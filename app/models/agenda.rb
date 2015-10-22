class Agenda < ActiveRecord::Base
  has_many :action_items
  belongs_to :proceeding
  delegate :meeting, to: :proceeding

  class << self
    def get_agendas_of_proceeding(proceeding_id)
      Agenda.where(:proceeding_id => proceeding_id)
    end
  end
end
