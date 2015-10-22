# This Module is AgendassHelper of Api
#
# @author Koutarou Haramoto 
# @version 1.0
module Api::AgendasHelper

  # create a list of action items of proceeding 
  # @return [Array] action item list. [{ id:..., content:..., user_id:..., user_name:..., scheduled_date:... }]
  def create_a_agenda_array

    list = []

    content = ApplicationController.helpers.sanitize(
        @create_or_update_agenda.content,
        :tags => ['h1', 'b', 'div', 'p', 'span', 'br', 'ul', 'li'],
        :attributes => ['id', 'class', 'name', 'type']
      ) 

    list.push({
      id: @create_or_update_agenda.id,
      content: content,
      proceeding_id: @create_or_update_agenda.proceeding_id
    })

    list

  end

end
