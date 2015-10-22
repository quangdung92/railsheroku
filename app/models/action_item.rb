class ActionItem < ActiveRecord::Base
  extend MeetingsSearch, ActionItemsSearch

  has_many :action_item_histories
  belongs_to :agenda
  belongs_to :user
  delegate :proceeding, to: :agenda
  delegate :meeting, to: :proceeding
    
  validates :agenda_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
  validates :scheduled_date, presence: true

  ZERO = 0

  scope :eq_scheduled_date, -> (date) { where(arel_table[:scheduled_date].eq date) }
  scope :gteq_scheduled_date, -> (date) { where(arel_table[:scheduled_date].gteq date) }
  scope :lteq_scheduled_date, -> (date) { where(arel_table[:scheduled_date].lteq date) }
  scope :find_by_user_id, -> (user_id) { where(arel_table[:user_id].eq user_id) }
  scope :like_content, -> (value) { where(arel_table[:content].matches(value)) }
  scope :is_null, -> (flag) do

    id = arel_table[:id]

    if flag
      where(id.eq nil)
    else
      where(id.not_eq nil)
    end 

  end
  scope :is_completed, -> (flag) do

    completion_date = arel_table[:completion_date]

    if flag
      where(completion_date.not_eq nil)
    else
      where(completion_date.eq nil)
    end 

  end

  class << self

    # get unresolved ai lists and get a count
    # @param [integer] user_id user id
    # @param [Hash] options { freeWord, fromDate, toDate, kind, content, aiFromDate, aiToDate }
    # @return [Hash] { count: integer, datas: array }
    def find_unresolved_ai_by_me_and_count(user_id, options)

      params = {}

      page_num = options[:page]
      item_count = options[:itemCount]

      action_item_relation = ActionItem.eager_load({:agenda => {:proceeding => {:meeting => :kind}}})
        .find_by_user_id(user_id)
        .is_completed(false)
        .order("action_items.scheduled_date, action_items.id")

      action_item_relation = create_search_condition(action_item_relation, options)
      action_item_relation = create_search_condition_of_ai(action_item_relation, options)

      params[:count] = action_item_relation.count

      start_position = (page_num.to_i - 1) * item_count.to_i
      params[:datas] = action_item_relation.offset(start_position).limit(item_count).to_a

      params

    end

    # get a unresolved ai of related meeting and count
    # @param [Integer] user id
    # @param [Hash] options { freeWord, fromDate, toDate, kind, content, aiFromDate, aiToDate }
    # @return [Hash] { count: integer, datas: array }
    def find_unresolved_ai_by_meeting_and_count(user_id, options)

      params = {}

      page_num = options[:page]
      item_count = options[:itemCount]

      participant_user_id = Participant.arel_table[:user_id]
      observer_user_id = Observer.arel_table[:user_id]

      action_item_relation = ActionItem
        .eager_load({:agenda => {:proceeding => {:meeting => [:kind, :observers, :participants]}}})
        .is_completed(false)
        .where(participant_user_id.eq(user_id).or(observer_user_id.eq(user_id)))
        .merge(Meeting.is_canceled(Meeting::IS_NO_CANCELED))
        .order("action_items.scheduled_date, action_items.id")

      action_item_relation = create_search_condition(action_item_relation, options)
      action_item_relation = create_search_condition_of_ai(action_item_relation, options)

      params[:count] = action_item_relation.count

      start_position = (page_num.to_i - 1) * item_count.to_i
      params[:datas] = action_item_relation.offset(start_position).limit(item_count).to_a

      params

    end

    # find a unresolved ai lists
    # @param [integer] user_id user id
    # @param [Hash] options { freeWord, fromDate, toDate, kind }
    # @return [ActiveRecord::Relation]
    def find_unresolved_ai_by_me(user_id, options)

      #action_item_relation = ActionItem.joins({:agenda => {:proceeding => :meeting}})
      action_item_relation = ActionItem.eager_load({:agenda => {:proceeding => {:meeting => :kind}}})
        .find_by_user_id(user_id)
        .is_completed(false)
        .order("action_items.scheduled_date DESC")

      create_search_condition(action_item_relation, options)

    end
  
    # find a unresolved ai of related meeting
    # @param [integer] user_id user id
    # @param [Hash] options { freeWord, fromDate, toDate, kind }
    # @return [ActiveRecord::Relation]
    def find_unresolved_ai_by_meeting(user_id, options)

      participant_user_id = Participant.arel_table[:user_id]
      observer_user_id = Observer.arel_table[:user_id]

      action_item_relation = ActionItem
        .eager_load({:agenda => {:proceeding => {:meeting => [:kind, :observers, :participants]}}})
        .is_completed(false)
        .where(participant_user_id.eq(user_id).or(observer_user_id.eq(user_id)))
        .merge(Meeting.is_canceled(Meeting::IS_NO_CANCELED))
        .order("action_items.scheduled_date DESC")

      create_search_condition(action_item_relation, options)

    end

    # get count of action items.
    # @param [Integer] user_id user id
    # @return [Hash] { all: integer, ai: integer }
    def get_count_of_action_items(user_id)
  
      count = { all: ZERO, ai: ZERO }
  
      count[:all] = find_by_user_id(user_id).select("user_id").count
  
      unless count[:all].zero?
        count[:ai] = find_by_user_id(user_id).is_completed(true).select("user_id").count
      end
  
      count
  
    end

    # get action items of proceeding
    # @param [Integer] proceeding_id proceeding_id
    # @return [Array] [{Model, Model}...]
    def get_action_items_of_proceeding(proceeding_id)
      ActionItem.eager_load(:agenda, :user).where(["agendas.proceeding_id = ?", proceeding_id])
    end

    # get action items of agenda
    # @param [Integer] agenda_id agenda_id
    # @return [Array] [{Model, Model}...]
    def get_action_items_of_agenda(agenda_id)
      ActionItem.where(:agenda_id => agenda_id)
    end

    # create action item
    # @param [Integer] agenda_id agenda_id
    # @return [Array] [{Model, Model}...]
    def create_action_item(agenda_id, user_id, content, scheduled_date)

      action_item = ActionItem.new(
        :agenda_id => agenda_id, 
        :user_id => user_id,
        :content => content,
        :scheduled_date => scheduled_date
      )
      action_item.save

      action_item_history = ActionItemHistory.new(
        :action_item_id => action_item.id, 
        :operation_user_id => user_id,
        :operation => ActionItemHistory.operations[:regist],
        :date => Time.now()
      )
      action_item_history.save

      action_item
    end

    # update action item
    # @param [Integer] id action item id
    # @param [Integer] user_id user id
    # @param [String] scheduled_date scheduled date 
    # @return [Array] [{Model, Model}...]
    def update_action_item(id, user_id, scheduled_date)
      action_item = ActionItem.find(id)
      action_item.update(
        :user_id => user_id,
        :scheduled_date => scheduled_date
      )

      action_item_history = ActionItemHistory.new(
        :action_item_id => action_item.id, 
        :operation_user_id => user_id,
        :operation => ActionItemHistory.operations[:edit],
        :date => Time.now()
      )
      action_item_history.save

      action_item
    end

    # update update_completion_date_of_action_item
    # @param [Integer] user_id user id
    # @param [String] completion_date completion_date 
    # @return [Array] [{Model, Model}...]
    def update_completion_date_of_action_item(id, user_id, completion_date)
      action_item = ActionItem.find(id)
      action_item.update(
        :completion_date => completion_date
      )

      action_item_history = ActionItemHistory.new(
        :action_item_id => action_item.id, 
        :operation_user_id => user_id,
        :operation => ActionItemHistory.operations[:ended],
        :date => Time.now()
      )
      action_item_history.save

      action_item
    end

    # clear_completion_date_of_action_item
    # @param [Integer] user_id user id
    # @return [Array] [{Model, Model}...]
    def clear_completion_date_of_action_item(id)
      action_item = ActionItem.find(id)
      action_item.update(:completion_date => nil)

      action_item
    end

  end
end
