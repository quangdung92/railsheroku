# This Module is HomeHelper
# @author Kudo Syuji
# @version 1.0
module HomeHelper

  # create a header title
  # @return [String] header title
  def create_header_title
    title = t('home.ai.nothing')
    unless @num.nil? || @num[:all].nil? || @num[:all].zero?
      value = @num[:ai].to_f / @num[:all].to_f * 100
      rate = number_to_percentage(value, precision: 0)
      title = "<i class='glyphicon glyphicon-fire'></i>"
      title << t('home.ai.achievement-rate', rate: rate, ai: @num[:ai], all: @num[:all])
    end
    title
  end

end
