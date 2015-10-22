class Participant < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :user

  validates :user_id, presence: true

  scope :eq_user_id, -> (user_id) { where(arel_table[:user_id].eq user_id) }
end
