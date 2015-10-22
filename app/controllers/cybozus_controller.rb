# controller is cybouzu controller
# @author Kudo Syuji
# @version 1.0
class CybozusController < AdminController
  before_action :set_cybozu, only: [:show, :edit, :update]

  layout 'admin'
  # default user id
  ID = 1



  # GET /cybozus
  # GET /cybozus.json
  def index
    if Cybozu.all.count.zero?
      redirect_to action: 'new'
    else
      redirect_to action: 'show', id: ID
    end
  end

  # GET /cybozus/1
  # GET /cybozus/1.json
  def show
  end

  # GET /cybozus/new
  def new
    if Cybozu.all.count.zero?
      @cybozu = Cybozu.new
    else
      redirect_to action: 'show', id: ID
    end
  end

  # GET /cybozus/1/edit
  def edit
  end

  # POST /cybozus
  # POST /cybozus.json
  def create
    @cybozu = Cybozu.new(cybozu_params)

    respond_to do |format|
      if @cybozu.save
        format.html { redirect_to action: 'index' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /cybozus/1
  # PATCH/PUT /cybozus/1.json
  def update
    respond_to do |format|
      if @cybozu.update(cybozu_params)
        format.html { redirect_to action: 'index' }
      else
        format.html { render :edit }
      end
    end
  end

  # GET /cybozus/get_users_of_cybozu
  def get_users_of_cybozu

    begin
      cybozu = Cybozu.find(1) 
      client = CybozuApi::Client.new(cybozu.url, cybozu.login_id, cybozu.password)
      users = client.get_users
      User.import_user_of_cybozu(users)
    rescue => e
      create_ajax_response(1, e.message)
    else
      create_ajax_response(0, t('views.cybozus.get_users.success'))
    end

  end

  # POST /cybozus/test_connect
  def test_connect

    begin
      cybozu = Cybozu.new(cybozu_params) 
      client = CybozuApi::Client.new(cybozu.url, cybozu.login_id, cybozu.password)
      client.test_connect
    rescue => e
      create_ajax_response(1, e.message)
    else
      create_ajax_response(0, t('views.cybozus.test_connect.success'))
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cybozu
      @cybozu = Cybozu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cybozu_params
      params.require(:cybozu).permit(:url, :login_id, :password)
    end
end
