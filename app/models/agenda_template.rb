class AgendaTemplate < ActiveRecord::Base
  belongs_to :kind

  validates :content, presence: true
end
