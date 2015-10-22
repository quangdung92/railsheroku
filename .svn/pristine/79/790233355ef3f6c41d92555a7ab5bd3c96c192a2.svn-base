# This module is ApplicationHelper
# @author Kudo Syuji
# @version 1.0
module ApplicationHelper
  include LoginHelper

  # this functon is shortcut of model locales.
  #
  # @param [String] key is model name or model.attribute
  def t_m(key)

    arr = key.split(/\./)

    if arr.length <= 2
      begin
        tmp = arr[0].split(/_/).map { |t| t.capitalize }
        model = tmp.join.constantize
      rescue
        # nothing todo
      else
        if arr.length == 1
          model.model_name.human
        else
          model.human_attribute_name(arr[1])
        end
      end
    end

  end

  # create a waring message if is no type.
  def create_warning_message_of_kind

    warning_message = ''

    if current_user.grant.zero?
      warning_message = t('views.shared.message.admin_html')
    else
      warning_message = t('views.shared.message.normal_html')
    end

    warning_message

  end

  def format_scheduled_time(time)

    res_time = ''

    if time.short
      res_time = l(time.time, format: :scheduled_time_short)
    else
      res_time = l(time.time, format: :scheduled_time)
    end

    if time.and_under?
      res_time = t('time.scheduled_time.and_under', time: res_time)
    elsif time.and_over?
      res_time = t('time.scheduled_time.and_over', time: res_time)
    else
      # nothing todo
    end

    res_time

  end

  def page_title(separator = " – ")
    # [content_for(:title), "page"].compact.join(separator)
    "Rock'nGiziLocker"
  end

end
