# controller is meeting controller
# @author Kudo Syuji
# @version 1.0
class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy, :ended,:revert, :cancel]
  before_action :set_selectbox_options, only: [:new, :edit, :create, :update]

  # GET /meetings
  # GET /meetings.json
  def index
    @kinds = Kind.create_select_options
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @approver_name = User.where({ id: @meeting.approver_id }).select(:name).first  if @meeting.approver_id
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @meeting.build_proceeding
  end

  # GET /meetings/1/edit
  def edit
    if @meeting.is_completed || @meeting.is_canceled
      redirect_to home_url
    end
  end

  # PUT /meetings/1/ended
  def ended
    if @meeting.ended
      redirect_to home_url
    else
      redirect_to confirm_proceeding_url(@meeting.proceeding)
    end
  end

  # PUT /meetings/1/revert
  def revert
    if @current_user.id == @meeting.approver_id
        @meeting.revert
    end
    redirect_to home_url
  end

  # PUT /meetings/1/cancel
  def cancel

    begin
      Meeting.transaction do

        @meeting.cancel

        create_history(MeetingHistory.operations[:canceled])

        use_schedule_coordination_of_cybozu

        @meeting.save!

      end
    rescue => e
      logger.info e.message
    end

    redirect_to home_url

  end

  # POST /meetings
  # POST /meetings.json
  def create

    begin
      Meeting.transaction do
        @meeting = Meeting.new(meeting_params)

        create_agenda

        @meeting.save!

        create_material
        # create the history of meeting
        create_history(MeetingHistory.operations[:regist])
        # use cybozu api
        use_schedule_coordination_of_cybozu

        @meeting.save!
      end
    rescue CybozuApi::Error => e
      logger.info e.message
      @error = t('error.cybozu') << e.message
    rescue => e
      logger.info e.message
    else
      redirect_to @meeting
    end

    render :new if @error || @meeting.errors.any?

  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update

    begin
      Meeting.transaction do

        pre_update

        @meeting.update(meeting_params)

        # meeting status when holding or completed then not re create
        unless @meeting.is_holding || @meeting.is_completed
          create_agenda

          create_material
        end

        # create the history of meeting
        create_history(MeetingHistory.operations[:edit])

        use_schedule_coordination_of_cybozu

        @meeting.save!
      end
    rescue CybozuApi::Error => e
      logger.info e.message
      @error = t('error.cybozu') << e.message
    rescue ActiveRecord::StaleObjectError => e
      logger.info e.message
      @error = t('error.stale')
    rescue => e
      logger.info e.message
    else
      redirect_to @meeting
    end

    render :edit if @error || @meeting.errors.any?

  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url }
    end
  end

  private

    # create a material model
    # save the file to server.
    def create_material
      # upload a files
      materials = Material
        .upload(params[:meeting][:materials_attributes], @meeting.id)

      materials.each do |material|
        @meeting.materials.new(material)
      end
    end

    # create a agenda model
    def create_agenda
      unless params[:meeting][:agendas_attributes].blank?
        params[:meeting][:agendas_attributes].each do |agenda|
          next if agenda[1][:content].blank?
          @meeting.proceeding.agendas.new(content: agenda[1][:content])
        end
      end
    end

    # create a history of meeting
    #
    # @params [MeetingHistory::Operation]
    def create_history(operation)

      # create the history of meeting
      meeting_history = {
        operation_user_id: current_user.id,
        operation: operation,
        date: DateTime.now
      }

      @meeting.meeting_histories.new(meeting_history)

    end

    # use the schedule coordination of Cybozu.
    # do nothing if to not setting the information of cybozu.
    #
    # @raise [CybozuApi::Error::ConnectError]
    # @raise [CybozuApi::Error::ApiError]
    def use_schedule_coordination_of_cybozu

      # Function process to send notification by Email or Cybozu
      # @author: ThanhTV
      # @Date: 2015/09/09
      @admin_setting = AdminSetting.take
      if @admin_setting[:enable_cybozu] == true
        # Send by Email
        # send_email
      else
        # Send by Cybozu
        return if Cybozu.count.zero?

        case action_name
          when 'create'
            res = create_schedule_of_cybozu
            unless res.nil?
              @meeting.cybozu_schedule_id = res.id
              @meeting.cybozu_schedule_version = res.version
            end
          when 'update'
            if @meeting.cybozu_schedule_id.nil?
              res = create_schedule_of_cybozu
              unless res.nil?
                @meeting.cybozu_schedule_id = res.id
                @meeting.cybozu_schedule_version = res.version
              end
            else
              modify_schedule_of_cybozu
            end
          when 'cancel'
            unless @meeting.cybozu_schedule_id.nil?
              remove_schedule_of_cybozu
            end
          else
            # nothing to do
        end
      end

    end

    # create schedule of cybozu
    #
    # @raise [CybozuApi::Error::ConnectError]
    # @raise [CybozuApi::Error::ApiError]
    # @return [CybozuApi::Model::Schedule]
    def create_schedule_of_cybozu
      req = create_params_of_cybozu
      unless req[:users].blank?
        client = create_client_of_cybozu
        client.create_schedule(req[:schedule], req[:users], req[:date])
      end
    end

    # modify schedule of cybozu
    #
    # @raise [CybozuApi::Error::ConnectError]
    # @raise [CybozuApi::Error::ApiError]
    # @return [CybozuApi::Model::Schedule] or [nil]
    def modify_schedule_of_cybozu

      req = create_params_of_cybozu
      res = nil

      if req[:users].blank?
        remove_schedule_of_cybozu
      else
        req[:schedule].id = @meeting.cybozu_schedule_id
        req[:schedule].version = @meeting.cybozu_schedule_version
        client = create_client_of_cybozu
        res = client.modify_schedule(req[:schedule], req[:users], req[:date])
      end

      res

    end

    # remove schedule of cybozu
    #
    # @raise [CybozuApi::Error::ConnectError]
    # @raise [CybozuApi::Error::ApiError]
    def remove_schedule_of_cybozu
      client = create_client_of_cybozu
      client.remove_schedule(@meeting.cybozu_schedule_id) 
      @meeting.cybozu_schedule_id = nil
      @meeting.cybozu_schedule_version = nil
    end

    # create a client of cybozu
    #
    # @return [CybozuApi::Client]
    def create_client_of_cybozu
      cybozu = Cybozu.find(1) 
      CybozuApi::Client.new(cybozu.url, cybozu.login_id, cybozu.password)
    end

    # create a params of cybozu
    #
    # @return [Hash] { schedule, date, users }
    def create_params_of_cybozu

      hash = {}

      schedule = CybozuApi::Model::Schedule.new
      schedule.detail = @meeting.name
      schedule
        .description = %([#{t('activerecord.attributes.meeting.venue')}]\n#{@meeting.venue}\n)
      schedule
        .description << %([#{t('activerecord.attributes.meeting.message')}]\n#{@meeting.message})
      hash[:schedule] = schedule
      hash[:date] = @meeting.dates.to_s << 'T' << @meeting.start_time.strftime('%H:%M:%S')
      hash[:users] = @meeting.get_related_party

      hash

    end

    # before the update process
    # this function removes the observer, participant and agenda
    def pre_update
      # meeting status when holding or completed then not re create
      unless @meeting.is_holding || @meeting.is_completed
        @meeting.proceeding.agendas.destroy_all
      end
      @meeting.observers.destroy_all
      @meeting.participants.destroy_all
    end

    # set a kind option of selectbox
    def set_kind_option
      @search_kinds = Kind.create_select_options
      @select_kinds = Kind.create_select_options(false)
    end

    # set a scheduled time of selectbox
    def set_scheduled_times_option
      @scheduled_times = ScheduledTime.all
    end

    # set all user of selectbox
    def set_user_option
      @all_user = User.all.select(:id,:name).order(:name)
    end

    # set a options of selectbox
    def set_selectbox_options
      set_kind_option
      set_scheduled_times_option
      set_user_option
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting)
        .permit(
          :name, :kind_id, :related_meeting_id, :dates, :start_time, :lock_version,:approver_id,
          :scheduled_time_id, :venue, :message, :unregistered_guest,
          proceeding_attributes: [:id, :meeting_id],
          observers_attributes: [:id, :user_id],
          participants_attributes: [:id, :user_id])
    end


  # Function processing send email
  # Author: ThanhTV
  # Date: 2015/09/09
  def send_email

    # Set subject for email
    title = "" +  @meeting.name
    case action_name
      when 'create'
        title = "[" + t('views.meetings.new.title') + "] " +  @meeting.name
      when 'update'
        title = "[" + t('views.meetings.edit.title') + "] " +  @meeting.name
      when 'cancel'
        title = "[" + t('views.meetings.show.button.cancel') + "] " +  @meeting.name
      else
        #nothing to do
    end

    # Set content for email
    content = %([#{t('activerecord.attributes.meeting.id')}]\n#{@meeting.id}\n) +'<br>'+
        %([#{t('activerecord.attributes.meeting.dates')}]\n) << @meeting.dates.to_s << ' ' << @meeting.start_time.strftime('%l:%M %p') +'<br>'+
        %([#{t('activerecord.attributes.meeting.venue')}]\n#{@meeting.venue}\n) +'<br>'+
        %([#{t('activerecord.attributes.meeting.message')}]\n#{@meeting.message}\n) +'<br>'

    # Get email of users who join to meeting
    @meeting.participants.each do |participant|
      @participant_email = participant.user.mailaddress
      if !@participant_email.nil?
          Notifier.send_email_notifications(@participant_email, title, content ).deliver
      end
    end
    @meeting.observers.each do |observers|
      @observers_email = observers.user.mailaddress
      if !@observers_email.nil?
        Notifier.send_email_notifications(@observers_email, title, content ).deliver
      end
    end

  end
end
