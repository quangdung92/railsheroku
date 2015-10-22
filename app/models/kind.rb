class Kind < ActiveRecord::Base
  has_many :meetings
  has_many :participant_templates
  has_many :observer_templates
  has_many :agenda_templates

  validates :name, presence: true, uniqueness: true
  scope :is_deleted, -> (flag) { where(is_deleted: flag) }
  
  accepts_nested_attributes_for :participant_templates
  accepts_nested_attributes_for :observer_templates
  accepts_nested_attributes_for :agenda_templates

  # logically delete the kind 
  #
  # @params [Integer] kind_id Kind ID or the target
  def logicalDelete
    update_attribute(:is_deleted, true)
  end

  class << self

    # create a select options 
    # @params [Boolean] include_blank default true
    # @return [Array] [[name, id][...]]
    def create_select_options(include_blank = true)

      kinds = is_deleted(false).pluck(:name, :id)

      if include_blank
        kinds.unshift(["#{I18n.t('home.search.select.default')}", ""])
      end

      kinds

    end

    # get the list of kind
    #
    # @params [integer] page_num current page
    # @params [integer] item_count items pre 
    # @return [hash] { count : ..., datas : [{model}, {model} ...] }
    def getList(page_num, item_count)

      params = [];

      params.push({count: count})

      start_position = (page_num.to_i - 1) * item_count.to_i
      params.push({datas: offset(start_position).limit(item_count).to_a})

      params

    end

  end
end
