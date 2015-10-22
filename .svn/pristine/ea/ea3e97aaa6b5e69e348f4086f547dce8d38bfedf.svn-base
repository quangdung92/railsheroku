class MeetingHistory < ActiveRecord::Base
  extend MeetingsSearch

  belongs_to :meeting
  belongs_to :user, foreign_key: :operation_user_id

  validates :meeting_id, presence: true
  validates :operation_user_id, presence: true
  validates :operation, presence: true
  validates :date, presence: true

  enum operation: {regist: 1, edit: 2, show: 3, canceled: 4, ended: 5}

  class << self
    def get_the_list_of_meeting_of_whats_new(user_id, options, limit = nil)
      where = ["operation IN(?, ?, ?, ?) AND ((participants.user_id = ?) OR (observers.user_id = ?))",
        MeetingHistory.operations[:regist],
        MeetingHistory.operations[:edit],
        MeetingHistory.operations[:canceled],
        MeetingHistory.operations[:ended],
        user_id,
        user_id 
      ]
      order = "date DESC"
      meeting_history_relation = get_meeting_history_of_whats_new(where, order, limit)
      create_search_condition(meeting_history_relation, options)
    end

    def get_meeting_history_of_whats_new(where = nil, order = nil, limit = nil)
      meeting_history = []

      meeting_history = MeetingHistory.eager_load(:user, :meeting => [:proceeding, :observers, :participants, :kind])
        .where(where)
        .order(order)
        .limit(limit)

      meeting_history
    end

  end

end
