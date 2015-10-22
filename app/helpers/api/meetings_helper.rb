# This Module MeetingsHelper of Api
#
# @author Kudo Syuji
# @version 1.0
module Api::MeetingsHelper

  # create a list of meeting
  # @return [Array] meeting list. [{ url:..., name:..., date:..., venue:... }]
  def create_list_of_meeting

    list = []

    unless @meetings[:datas].empty?
      @meetings[:datas].each do |meeting|
        scheduled_time = meeting.scheduled_time_id ? format_scheduled_time(meeting.scheduled_time) : ''
        related_meeting_name = meeting.related_meeting_id ? meeting.related_meeting.name : ''
        list.push({
          id: meeting.id,
          name: meeting.name,
          kind_name: meeting.kind.name,
          related_meeting_name: related_meeting_name,
          dates: l(meeting.dates, format: :date),
          start_time: l(meeting.start_time, format: :time),
          scheduled_time: scheduled_time,
          is_holding: meeting.is_holding,
          is_canceled: meeting.is_canceled,
          is_completed: meeting.is_completed,
          proceeding_id: meeting.proceeding.id
        })
      end
    end

    @meetings[:datas] = list

    @meetings

  end

  # create a list of meeting
  # @return [Array] meeting list. [{ id:..., name:..., kind_name:..., dates:... }]
  def create_list_of_search_meeting

    list = []

    unless @meetings.empty?
      @meetings.each do |meeting|
        date = l(meeting.dates, format: :date)
        list.push({
          id: meeting.id,
          name: meeting.name,
          kind_name: meeting.kind.name,
          dates: date
        })
      end
    end

    list

  end

  def create_hash_of_relational_information_of_kind

    hash = {
      observers: [],
      participants: [],
      agendas: []
    }

    unless @kind.blank?
  
      @kind.observer_templates.each do |observer|
        obj = {}
        obj[:id] = observer.user_id
        obj[:name] = observer.user.name
        hash[:observers].push(obj)
      end

      @kind.participant_templates.each do |participant|
        obj = {}
        obj[:id] = participant.user_id
        obj[:name] = participant.user.name
        hash[:participants].push(obj)
      end

      @kind.agenda_templates.each do |agenda|
        obj = {}
        obj[:content] = agenda.content
        hash[:agendas].push(obj)
      end
    end

    hash

  end
end
