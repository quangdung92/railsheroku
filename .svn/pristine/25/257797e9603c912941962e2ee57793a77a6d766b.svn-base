# This Module is UsersHelper of Api
#
# @author Koutarou Haramoto 
# @version 1.0
module Api::UsersHelper

  # create a list of proceeding relation user
  # @return [Array] action item list. [{ id:..., content:..., user_id:..., user_name:..., scheduled_date:... }]
  def create_list_of_proceeding_relation_user

    list = []
    unless @users.empty?
      @users.each do |user|
        list.push({
          user_id: user[0],
          user_name: user[1]
        })
      end
    end

    list

  end

end
