module UnresolvedAiListsHelper

  # create a header title
  # @return [String] header title
  def create_header_title

    case controller.action_name
    when 'me' then
      t('home.unresolved.ai.me.title')
    when 'meeting' then
      t('home.unresolved.ai.meeting.title')
    end
    
  end


end
