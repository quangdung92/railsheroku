class ActionItemHistory < ActiveRecord::Base
  extend MeetingsSearch

  belongs_to :action_item
  belongs_to :user, foreign_key: :operation_user_id

  validates :action_item_id, presence: true
  validates :operation_user_id, presence: true
  validates :operation, presence: true
  validates :date, presence: true

  enum operation: {regist: 1, edit: 2, show: 3, canceled: 4, ended: 5}

  class << self

    def get_the_list_of_action_item_of_whats_new(user_id, options, limit = nil)
      where = ["operation IN(?, ?, ?) AND ((participants.user_id = ?) OR (observers.user_id = ?))",
        ActionItemHistory.operations[:regist],
        ActionItemHistory.operations[:edit],
        ActionItemHistory.operations[:ended],
        user_id,
        user_id
      ]
      order = "date DESC"

      action_item_history_relation = get_action_item_history_of_whats_new(where, order, limit)
     
      action_item_history_relation = create_search_condition(action_item_history_relation, options)

    end

    def get_action_item_history_of_whats_new(where = nil, order = nil, limit = nil)
      action_item_history = []

      action_item_history = ActionItemHistory.eager_load(:user, {:action_item => {:agenda => {:proceeding => {:meeting => [:participants, :observers, :kind]}}}})
        .where(where)
        .order(order)
        .limit(limit)

      action_item_history
    end

  end

end
