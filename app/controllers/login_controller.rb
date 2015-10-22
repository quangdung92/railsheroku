# this class is login controller
# @author koutarou haramoto
# @version 1.0
class LoginController < ApplicationController
  before_action :user_params, only: [:login]

  @error_msg = ""

  # GET /logins
  # GET /logins.json
  def index
  end

  def login
    a_user_params = user_params
    user = User.find_by(["login_id = ? AND is_deleted = false", a_user_params[:login_id]])
    if user && user.authenticate(a_user_params[:password])
      login_user(user)
      if user.is_firstlogged?
        redirect_path = session[:previous_url] || home_path
        session[:previous_url] = nil
        redirect_to redirect_path
      else
        redirect_to firstlogin_path 
      end
    else
      @error_msg = t("login.message.login_error") 
      render :index 
    end
  end

  def logout
    logout_user
    redirect_to login_path 
  end

  private
    def user_params
      params.require(:user).permit(:login_id, :password)
    end

end
