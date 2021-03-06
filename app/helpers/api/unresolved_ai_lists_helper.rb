# This Module MeetingListsHelper of Api
#
# @author Kudo Syuji
# @version 1.0
module Api::UnresolvedAiListsHelper

  # create a list of unresolved action items
  # @return [Array] unresolved list. [{ url:..., name:..., content:..., data:... }]
  def create_list_of_unresolved_ai

    list = []

    unless @ais.empty?
      @ais.each do |ai|
        list.push({
          url: "/proceedings/#{ai.proceeding.id}#?ai=#{ai.id}",
          name: %(【#{ai.meeting.kind.name}】#{ai.meeting.name}),
          content: ai.content,
          date: l(ai.scheduled_date, format: :date)
        })
      end
    end

    list

  end

  # create a list of unresolved action items and it's count
  # @return [Hash] unresolved list and It's count. { count, dates }
  def create_list_of_unresolved_ai_and_count

    list = []

    unless @ais[:datas].empty?
      @ais[:datas].each do |ai|
        list.push({
          id: ai.id,
          proceeding_id: ai.proceeding.id,
          content: ai.content,
          date: l(ai.scheduled_date, format: :date),
          name: ai.meeting.name,
          kind_name: ai.meeting.kind.name,
          dates: l(ai.meeting.dates, format: :date)
        })
      end
    end

    @ais[:datas] = list

    @ais

  end

end
