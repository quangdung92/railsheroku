# This Module is ActionItemsHelper of Api
#
# @author Koutarou Haramoto 
# @version 1.0
module Api::ActionItemsHelper

  # create a list of action items of proceeding 
  # @return [Array] action item list. [{ id:..., content:..., user_id:..., user_name:..., scheduled_date:... }]
  def create_list_of_action_items_of_proceeding

    list = []

    unless @action_items.empty?
      @action_items.each do |action_item|
        list.push({
          id: action_item.id,
          agenda_id: action_item.agenda_id,
          user_id: action_item.user.id,
          user_name: action_item.user.name,
          content: action_item.content,
          scheduled_date: action_item.scheduled_date,
          completion_date: action_item.completion_date
        })
      end
    end

    list

  end

  # create array of action item
  # @return [Array] action item. [{ Model }]
  def create_array_of_action_item

    list = []
    user = User.find(@action_item.user_id) 

    list.push({
      id: @action_item.id, 
      agenda_id: @action_item.agenda_id, 
      user_id: @action_item.user_id, 
      user_name: user.name, 
      content: @action_item.content, 
      scheduled_date: @action_item.scheduled_date, 
      completion_date: @action_item.completion_date 
    })

    list

  end

end
