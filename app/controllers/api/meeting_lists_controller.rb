# This Class is MeetingListsController of Api
#
# @author Kudo Syuji
# @version 1.0
class Api::MeetingListsController < ApplicationController

  # get a scheduled meeting list
  def scheduled
    @schedule_meetings = Meeting.get_schedule(params, current_user.id)
  end

  # get a ended meeting list
  def ended
    @ended_meetings = Meeting.get_ended(params, current_user.id)
  end
end
