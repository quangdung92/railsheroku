# This Class is What'sNewListsController of Api
#
# @author Koutarou Haramoto
# @version 1.0
class Api::WhatsNewListsController < ApplicationController
  include Api::WhatsNewListsHelper

  LIST_LIMIT = 50

  # get what's new list data
  def get_whats_new_data
    @whats_new_meeting = MeetingHistory.get_the_list_of_meeting_of_whats_new(current_user.id, params)
    @whats_new_comment = CommentHistory.get_the_list_of_comment_of_whats_new(current_user.id, params)
    @whats_new_action_item = ActionItemHistory.get_the_list_of_action_item_of_whats_new(current_user.id, params)

    @whats_new_list = create_whats_new_list(0, LIST_LIMIT)
    
  end

  # get all what's new list data
  def get_list_of_whats_new_data
    @whats_new_meeting = []
    @whats_new_comment = []
    @whats_new_action_item = []
    start_pos = (params[:page].to_i - 1) * params[:itemCount].to_i
    end_pos = start_pos + (params[:itemCount].to_i) - 1
    case params[:historyKind]
      when "all" then
        @whats_new_meeting = MeetingHistory.get_the_list_of_meeting_of_whats_new(current_user.id, params)
        @whats_new_comment = CommentHistory.get_the_list_of_comment_of_whats_new(current_user.id, params)
        @whats_new_action_item = ActionItemHistory.get_the_list_of_action_item_of_whats_new(current_user.id, params)
      when "meeting" then
        @whats_new_meeting = MeetingHistory.get_the_list_of_meeting_of_whats_new(current_user.id, params)
      when "action_item" then
        @whats_new_action_item = ActionItemHistory.get_the_list_of_action_item_of_whats_new(current_user.id, params)
      when "comment" then
        @whats_new_comment = CommentHistory.get_the_list_of_comment_of_whats_new(current_user.id, params)
      else
        #nothing to do
    end

    @whats_new_list = create_whats_new_list(start_pos, end_pos)

  end

end
