# This Class is CommentsController of Api
#
# @author Koutarou Haramoto
# @version 1.0
class Api::CommentsController < ApplicationController

  # get comments of proceeding
  def get_comments_of_proceeding
    @comments = Comment.where(:proceeding_id => params[:id]).eager_load(:user)
  end

  # create comment
  def create_comment
    comment = Comment.create_comment(
      params[:params][:proceeding_id],
      params[:params][:user_id],
      params[:params][:content]
    )
    @comments = Comment.where(:id => comment.id).eager_load(:user)
  end

end
