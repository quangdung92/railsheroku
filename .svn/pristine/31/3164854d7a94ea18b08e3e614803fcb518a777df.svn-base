# this class is MeetingLists controller
# @author koutarou haramoto
# @version 1.0
class MeetingListsController < ApplicationController
  before_action :set_kind

  # POST /scheduled
  # POST /scheduled.json
  def scheduled
  end

  # POST /ended
  # POST /ended.json
  def ended
  end

  private

    def set_kind
      @kinds = Kind.create_select_options
    end

end
