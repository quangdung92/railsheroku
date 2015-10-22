# =============================================================================
# this helper is login helper
# @author k.haramoto
# @version 1.0
# =============================================================================
module LoginHelper

  # ===========================================================================
  # this function is login user of create cookie and cookie regist to db
  # @param [Object] user user object
  # ===========================================================================
  def login_user(user)
    remember_token = User.new_remember_token
    #cookies[:remember_token] = { :value => remember_token, :expires => 1.days.from_now, :secure => true }
    #cookies[:remember_token] = { :value => remember_token, :secure => true }
    cookies[:remember_token] = { :value => remember_token }
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    current_user = user
  end
  
  # ===========================================================================
  # this function is set the user object to current_user variable
  # @param [Object] user user object
  # ===========================================================================
  def current_user=(user)
    @current_user = user
  end
  
  # ===========================================================================
  # this function is user cookie check and return user object
  # @return [Object] user object or nill
  # ===========================================================================
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # ===========================================================================
  # this function is login user of cookie delete  
  # ===========================================================================
  def logout_user
    current_user = nil
    cookies.delete(:remember_token)
  end
  
end
