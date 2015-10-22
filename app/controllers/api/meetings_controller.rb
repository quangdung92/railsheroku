# This Class is Users of Api
#
# @author Koutarou Haramoto 
# @version 1.0
class Api::MeetingsController < ApplicationController

  # get a venue of meetiongs
  def venue
    @venues = Meeting.get_venues
  end

  # get a relationel information of kind
  def kind_relation
    @kind = Kind.find(params[:kind_id])
  end

  # search a meeting
  def search
    @meetings = Meeting.search(params)
  end

  # get a meeting of list
  def get_list
    @meetings = Meeting.get_list(params, current_user.id)
  end

end
