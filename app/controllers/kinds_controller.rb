# this class is kinds controller
# @author koutarou haramoto
# @version 1.0
class KindsController < AdminController
  before_action :set_kind, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /kinds
  # GET /kinds.json
  def index
    @kinds = Kind.all
  end

  # GET /kinds/1
  # GET /kinds/1.json
  def show
  end

  # GET /kinds/new
  def new
    @kind = Kind.new
  end

  # GET /kinds/1/edit
  def edit
  end

  # POST /kinds
  # POST /kinds.json
  def create
    begin
      Kind.transaction do
        @kind = Kind.new(kind_params)
        @kind.save!
      end
    rescue => e
      logger.info e.message
    else
      redirect_to @kind
    end

    render :new if @kind.errors.any?
  end

  # PATCH/PUT /kinds/1
  # PATCH/PUT /kinds/1.json
  def update
    begin
      Kind.transaction do
        delete_the_kind_of_related_data_table
        @kind.update!(kind_params)
      end
    rescue => e
      logger.info e.message
    else
      redirect_to @kind
    end

    render :edit if @kind.errors.any?
  end

  # DELETE /kinds/1
  # DELETE /kinds/1.json
  def destroy
    @kind.logicalDelete
    respond_to do |format|
      format.html { redirect_to kinds_url, notice: t('views.kinds.destroy.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      @kind = Kind.find(params[:id])
    end

    # delete the kind of related data table
    def delete_the_kind_of_related_data_table
      @kind.participant_templates.destroy_all
      @kind.observer_templates.destroy_all
      @kind.agenda_templates.destroy_all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kind_params
      params.require(:kind)
        .permit(
          :name, :is_deleted,
          agenda_templates_attributes: [:id, :content],
          observer_templates_attributes: [:id, :user_id],
          participant_templates_attributes: [:id, :user_id])
    end

end
