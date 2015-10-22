# This Class is ViewersController of Api
#
# @author Koutarou Haramoto
# @version 1.0
class Api::ObserversController < ApplicationController


  # ============================================================================
  # author:: Toan
  # date:: 09:49 - 8/31/15
  # brief::
  # @params::
  # @return::
  # ============================================================================
  def update_observer
    if params[:params][:proceeding_id]
      proceeding = Proceeding.find_by_meeting_id(params[:params][:proceeding_id])
      meeting_id = proceeding.meeting_id
      Observer.destroy_all(:meeting_id => meeting_id)
      if params[:params][:observer_id]
        params[:params][:observer_id].each do |observer_id|
          observer_new = Observer.new(
              :meeting_id => meeting_id,
              :user_id => observer_id,
          )
          observer_new.save
        end
      end
      @success = true
    else
      @success = false
    end
  end

end
