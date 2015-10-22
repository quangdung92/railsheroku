# this class is accounts controller
# @author koutarou haramoto
# @version 1.0
class AccountsController < ApplicationController
  before_action :set_user, only: [:index, :edit, :update]

  # GET /accounts
  # GET /accounts.json
  def index
  end

  # POST /accounts/edit
  # POST /accounts/edit.json
  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to accounts_path, notice: t('views.accounts.update.notice') }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login_id, :name, :kana, :mailaddress, :password, :password_confirmation)
    end

end
