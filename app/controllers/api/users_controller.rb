# This Class is Users of Api
#
# @author Kudo Syuji
# @version 1.0
class Api::UsersController < ApplicationController

  # get a all users
  def index
    @users = User.is_enabled
  end

  # get proceeding relation users
  def get_list_of_proceeding_relation_user
    @users = User.get_users_of_proceeding_relation(params[:proceeding_id]) 
  end

end
