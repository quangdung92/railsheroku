# this controller is firstlogin controller
# @author k.haramoto
# @version 1.0
class FirstloginController < ApplicationController
  before_action :set_user, only: [:index, :update]
  before_action :user_params, only: [:update]

  layout 'login'

  def index

    # check firstlogged
    if @user.is_firstlogged?
      redirect_to home_path 
    else
      #nothing to do
    end

  end

  def update

    a_user_params = user_params
    a_user_params[:is_firstlogged] = true

    respond_to do |format|
      if @user.update(a_user_params)
        format.html { redirect_to home_path, notice: t('firstlogin.update.notice') }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # this function is redirect /login/logout 
  def destroy
    redirect_to "/login/logout" 
  end

  private
    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:login_id, :password, :password_confirmation)
    end

end
