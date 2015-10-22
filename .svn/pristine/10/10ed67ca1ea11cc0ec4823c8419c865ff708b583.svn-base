# This Class is Admin Users of Api
#
# @author Kudo Syuji
# @version 1.0
class Api::Admin::UsersController < AdminController

  # get a users list
  def get_list
    @users = User.get_list(params[:page], params[:itemCount])
  end

end
