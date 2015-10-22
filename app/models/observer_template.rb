class ObserverTemplate < ActiveRecord::Base
  belongs_to :kind
  belongs_to :user

  validates :user_id, presence: true
end
