class ScheduledTime < ActiveRecord::Base

  has_many :meetings

  enum kind: {default: 0, and_under: 1, and_over: 2}

end
