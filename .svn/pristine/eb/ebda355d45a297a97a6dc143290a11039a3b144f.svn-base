# This Module is ProceedingsHelper 
# @author Koutarou haramoto
# @version 1.0
module ProceedingsHelper

  # create a header title
  # @return [String] header title
  def create_header_title

    case controller.action_name
    when 'confirm' then
      t('views.proceedings.confirm.title',
        meeting_name: @proceeding.meeting.name)
    when 'new', 'create' then
    when 'edit' then
      proceeding = Proceeding.where(:id => params[:id]).joins(:meeting => :kind)
      kind_name = proceeding[0].meeting.kind.name
      unless kind_name.blank?
        kind_name = "【#{proceeding[0].meeting.kind.name}】"
      else
        kind_name = ""
      end
      t('views.proceedings.edit.title', 
        :kind_name => kind_name,
        :meeting_name => proceeding[0].meeting.name
      )
    when 'show' then
      t('views.proceedings.show.title',
        meeting_name: @proceeding.meeting.name)
    end
    
  end

  # create a partcipants
  # @return [String] Participant in a meeting.
  def create_participants

    names = []

    @proceeding.meeting.participants.each do |participant|
      names.push participant.user.name
    end

    names.join(', ')

  end

  # create a observers
  # @return [String] Observer in a meeting.
  def create_observers

    names = []

    @proceeding.meeting.observers.each do |observers|
      names.push observers.user.name
    end

    names.join(', ')

  end

end
