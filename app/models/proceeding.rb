class Proceeding < ActiveRecord::Base
  belongs_to :meeting
  has_many :comments
  has_many :agendas
  has_many :action_items, through: :agendas

  accepts_nested_attributes_for :agendas

end
