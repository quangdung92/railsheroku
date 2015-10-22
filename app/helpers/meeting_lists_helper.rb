# this class is MeetingLists helper 
# @author koutarou haramoto
# @version 1.0
module MeetingListsHelper

  # create a header title
  # @return [String] header title
  def create_header_title

    case controller.action_name
    when 'scheduled' then
      t('home.meeting.scheduled.title')
    when 'ended' then
      t('home.meeting.ended.title')
    end
    
  end

end
