# This Class is UnresolvedAiListsController of Api
#
# @author Kudo Syuji
# @version 1.0
class Api::UnresolvedAiListsController < ApplicationController

  # get a unresolved ai lists of me
  def me

    @ais = ActionItem.find_unresolved_ai_by_me(current_user.id, params)

  end

  # get a unresolved ai lists of meeting
  def meeting

    @ais = ActionItem.find_unresolved_ai_by_meeting(current_user.id, params)

  end

  # get a unresolved ai lists of me and get a count.
  def me_and_count

    @ais = ActionItem.find_unresolved_ai_by_me_and_count(current_user.id, params)

  end

  # get a unresolved ai lists of meeting and get a count.
  def meeting_and_count

    @ais = ActionItem.find_unresolved_ai_by_meeting_and_count(current_user.id, params)

  end

end
