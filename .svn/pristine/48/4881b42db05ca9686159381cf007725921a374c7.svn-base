# This Class is ViewersController of Api
#
# @author Koutarou Haramoto
# @version 1.0
class Api::ViewersController < ApplicationController


  # confirm comment 
  def confirm_comment
    viewer = Viewer.confirm_comment(
      params[:params][:comment_id],
      params[:params][:user_id]
    )
    
    @viewer = viewer
  end

end
