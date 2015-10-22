class CommentHistory < ActiveRecord::Base
  extend MeetingsSearch

  belongs_to :comment
  belongs_to :user, foreign_key: :operation_user_id

  validates :comment_id, presence: true
  validates :operation_user_id, presence: true
  validates :operation, presence: true
  validates :date, presence: true

  enum operation: {regist: 1, edit: 2, show: 3, canceled: 4, ended: 5}
  class << self
    def get_the_list_of_comment_of_whats_new(user_id, options, limit = nil)
      where = ["operation = ? AND ((participants.user_id = ?) OR (observers.user_id = ?))",
        CommentHistory.operations[:regist],
        user_id,
        user_id
      ]
      order = "date DESC"

      comment_history_relation = get_comment_history_of_whats_new(where, order, limit)
      
      create_search_condition(comment_history_relation, options)      
      
    end

    def get_comment_history_of_whats_new(where = nil, order = nil, limit = nil)
      comment_history = []

      comment_history = CommentHistory.eager_load(:user, :comment => {:proceeding => {:meeting => [:participants, :observers, :kind]}})
        .where(where)
        .order(order)
        .limit(limit)

      comment_history
    end
  end
end
