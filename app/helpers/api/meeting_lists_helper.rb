# This Module is MeetingListsHelper of Api
#
# @author Kudo Syuji
# @version 1.0
module Api::MeetingListsHelper

  # create a list of schedule meeting
  # @return [Array] meeting list. [{ url:..., name:..., date:..., venue:... }]
  def create_list_of_scheduled_meeting

    list = []

    unless @schedule_meetings.empty?
      @schedule_meetings.each do |meeting|
        date = %(#{l(meeting.dates, format: :date)} #{l(meeting.start_time, format: :time)})
        list.push({
          url: "/meetings/#{meeting.id}",
          name: %(【#{meeting.kind.name}】#{meeting.name}),
          venue: meeting.venue,
          date: date
        })
      end
    end

    list

  end

  # create a list of ended meeting
  # @return [Array] meeting list. [{ url:..., name:..., date:... }]
  def create_list_of_ended_meeting

    list = []

    unless @ended_meetings.empty?
      @ended_meetings.each do |meeting|
        list.push({
          url: "/proceedings/#{meeting.proceeding.id}",
          name: %(【#{meeting.kind.name}】#{meeting.name}),
          date: l(meeting.dates, format: :date)
        })
      end
    end

    list

  end
end
