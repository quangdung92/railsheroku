# This Module is CommentsHelper of Api
#
# @author Koutarou Haramoto 
# @version 1.0
module Api::CommentsHelper

  def convert_link(str)
    URI.extract(str, ['http', 'https', 'ftp']).uniq.each do |uri|
      str.gsub!(uri, %(<a href="#{uri}" target="_blank">#{uri}</a>))
    end
    str
  end

  # create a list of comments of proceeding 
  # @return [Array] comments list. [{ id:..., content:..., user_id:..., user_name:..., scheduled_date:... }]
  def create_list_of_comments_of_proceeding

    list = []

    unless @comments.blank?
      @comments.each do |comment|
        #init
        users = []
        users_name = ""
        users_id = []
        #get comment count
        viewers = Viewer.where(:comment_id => comment.id, :is_confirmed => true).eager_load(:user)
        unless viewers.blank?
          viewers.each do |viewer|
            users.push(viewer.user)
            users_name += "[#{viewer.user.name}] "
            users_id.push(viewer.user.id)
          end
        else
          users = []
          users_name = ""
          users_id = []
        end
        list.push({
          id: comment.id,
          proceeding_id: comment.proceeding_id,
          user_id: comment.user.id,
          user_name: comment.user.name,
          created_at: comment.created_at,
          updated_at: comment.updated_at,
          content: convert_link(comment.content),
          comment_user_count: viewers.count,
          comment_confirm_users: users,
          comment_confirm_users_name: users_name,
          comment_confirm_users_id: users_id
        })
      end
    end

    list

  end

end
