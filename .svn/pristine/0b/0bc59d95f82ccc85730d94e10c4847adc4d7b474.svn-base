# This Module is MeetingsHelper
# @author Kudo Syuji
# @version 1.0
module MeetingsHelper

  # create a header title
  # @return [String] header title
  def create_header_title

    case controller.action_name
    when 'index' then
      t('views.meetings.index.title')
    when 'new', 'create' then
      t('views.meetings.new.title')
    when 'edit', 'update' then
      t('views.meetings.edit.title')
    when 'show' then
      t('views.meetings.show.title')
    end
    
  end

  # create a scheduled times.
  # @return [Array] [[option_value, option_key],[...]]
  def create_scheduled_time_options

    times = []

    @scheduled_times.each do |time|
      option = []

      option.push(format_scheduled_time(time))
      option.push(time.id)

      times.push(option)
    end

    times

  end


end
