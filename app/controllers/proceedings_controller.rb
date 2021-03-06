# this class is Proceedings controller
# @author koutarou haramoto
# @version 1.0
class ProceedingsController < ApplicationController
  before_action :set_proceeding
  before_action :set_proceeding_relation_user
  before_action :set_meeting_info, only: [:show, :edit, :update, :destroy]

  # GET /proceedings
  # GET /proceedings.json
  def index
  end
  # GET /proceedings/:id
  # GET /proceedings/:id.json
  def show
    @error_message = ""  
    unless check_relation_users
      redirect_to home_path
    else
      meeting = Meeting.find(@proceeding.meeting_id)
      @approver_name = User.where({ id: meeting.approver_id }).select(:name).first  if meeting.approver_id
      if meeting.is_completed == false
        @error_message = t('views.proceedings.error-message.meeting-is-not-completed', :meeting_name => meeting.name)
      elsif meeting.is_canceled?
        @error_message = t('views.proceedings.error-message.meeting-is-canceled', :meeting_name => meeting.name) 
      else
        #nothing to do
      end
    end
  end
  # GET /proceedings/:id/new
  # GET /proceedings/:id/new.json
  def new 
  end
  # GET /proceedings/:id/edit
  # GET /proceedings/:id/edit.json
  def edit
    @error_message = ""  
    unless check_relation_users
      redirect_to home_path
    else
      meeting = Meeting.find(@proceeding.meeting_id)
      @approver_name = User.where({ id: meeting.approver_id }).select(:name).first  if meeting.approver_id
      if meeting.is_completed? 
        @error_message = t('views.proceedings.error-message.meeting-is-completed', :meeting_name => meeting.name)
      elsif meeting.is_canceled?
        @error_message = t('views.proceedings.error-message.meeting-is-canceled', :meeting_name => meeting.name) 
      else
        meeting.update(:is_holding => true)
      end
    end
  end

  # GET /proceedings/:id
  # GET /proceedings/:id
  def create 
  end

  # Export pdf file
  def export_show
    url = request.referrer
    date = DateTime.now.to_date.strftime("%Y-%d-%m")
    pdf = render_to_string :pdf => 'show_pdf',
                           :template => Rails.root + "/proceedings/show_for_export.html.erb",
                           :encoding => "UTF-8",
                           # :print_media_type => true,
                           :layout => "export_pdf",
                           :margin => {:top => 25, :bottom => 25},
                           :header => {
                               font_name: '"Times New Roman", Times, serif',
                               right: url,
                               left: "Rock'nGiziLocker",
                               spacing: 15
                           },
                           :footer => {
                               font_name: '"Times New Roman", Times, serif',
                               right: DateTime.now.strftime("%d/%m/%Y %H:%M"),
                               left: '[page] of [topage]',
                               spacing: 15
                           }
    send_data(pdf,:filename => "export_show_#{date}.pdf", :type=>"application/pdf")
  end
  def export_confirm
    url = request.referrer
    date = DateTime.now.to_date.strftime("%Y-%d-%m")
    pdf = render_to_string :pdf => 'confirm_pdf',
                           :template => Rails.root + "/proceedings/confirm.html.erb",
                           :encoding => "UTF-8",
                           # :print_media_type => true,
                           :layout => "export_pdf",
                           :margin => {:top => 25, :bottom => 25},
                           :header => {
                               font_name: '"Times New Roman", Times, serif',
                               right: url,
                               left: "Rock'nGiziLocker",
                               spacing: 15
                           },
                           :footer => {
                               font_name: '"Times New Roman", Times, serif',
                               right: DateTime.now.strftime("%d/%m/%Y %H:%M"),
                               left: '[page] of [topage]',
                               spacing: 15
                           }
    send_data(pdf,:filename => "export_confirm_#{date}.pdf", :type=>"application/pdf")
  end

  # GET /proceedings/:id
  # GET /proceedings/:id
  def update
  end

  # GET /proceedings/:id
  # GET /proceedings/:id
  def destroy 
  end

  # GET /proceedings/:id/confirm
  # GET /proceedings/:id/confirm
  def confirm
    meeting = Meeting.find(@proceeding.meeting_id)
    @approver_name = User.where({ id: meeting.approver_id }).select(:name).first  if meeting.approver_id
  end

  # GET /proceedings/:id/end_confirm
  # GET /proceedings/:id/end_confirm
  def end_confirm 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceeding
      @proceeding = Proceeding.find(params[:id])
    end

    def set_proceeding_relation_user
      @relation_users = User.get_users_of_proceeding_relation(@proceeding.id) 
    end

    def set_meeting_info
      @meeting_info = Proceeding.where(:id => params[:id]).joins(:meeting)
      @meeting_info_related_meeting = Meeting.where(:id => @meeting_info[0].meeting.related_meeting_id)
      @meeting_info_participant = Participant.where(:meeting_id => params[:id]).eager_load(:user)
      @meeting_info_observer = Observer.where(:meeting_id => params[:id]).eager_load(:user)
    end

    def check_relation_users
      if @relation_users.find{|user| user[0] == current_user.id} == nil
        false
      else
        true
      end
    end

end
