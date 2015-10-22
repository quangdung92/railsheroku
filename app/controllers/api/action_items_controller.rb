# This Class is ActionItemsController of Api
#
# @author Koutarou Haramoto
# @version 1.0
class Api::ActionItemsController < ApplicationController

  # get action items of proceeding
  def get_action_items_of_proceeding
    @action_items = ActionItem.get_action_items_of_proceeding(params[:id]) 
  end

  # get action items of agenda
  def get_action_items_of_agenda
    @action_items_of_agenda = ActionItem.get_action_items_of_agenda(params[:id]) 
  end

  # create action item 
  def create_action_item 
    begin
      ActionItem.transaction do

        # create action item
        @action_item = ActionItem.create_action_item(
          params[:params][:agenda_id],
          params[:params][:person_in_charge_user_id],
          params[:params][:action_item_content],
          params[:params][:scheduled_date]
         )
        # check cybozu setting
        unless Cybozu.count.zero?
          # create cybozu schedule and update action item
          res = create_schedule_of_cybozu
          unless res.nil?
            @action_item.cybozu_schedule_id = res.id
            @action_item.cybozu_schedule_version = res.version
            @action_item.save!
          end
        # not registration cybozu schedule
        else
        end
      end
    rescue => e
      logger.error(e.message)
      @action_item = []
    end
    @action_item
  end

  # update action item 
  def update_action_item 
    begin
      ActionItem.transaction do

        # update action item
        @action_item = ActionItem.update_action_item(
          params[:params][:action_item_id],
          params[:params][:person_in_charge_user_id],
          params[:params][:scheduled_date]
         )

        # check cybozu setting
        unless Cybozu.count.zero?
          # create cybozu schedule and update action item
          if @action_item.cybozu_schedule_id.nil?
            res = create_schedule_of_cybozu
            unless res.nil?
              @action_item.cybozu_schedule_id = res.id
              @action_item.cybozu_schedule_version = res.version
              @action_item.save!
            end
           # modify cybozu schedule
          else 
            res = modify_schedule_of_cybozu
          end
        # not modify cybozu schedule
        else
        end
      end
    rescue => e
      logger.error(e.message)
      @action_item = []
    end

    @action_item
  end

  # update completion date of action item
  def update_completion_date_of_action_item 
    begin
      ActionItem.transaction do

        @action_item = ActionItem.update_completion_date_of_action_item(
          params[:params][:action_item_id],
          params[:params][:user_id],
          params[:params][:completion_date]
         ) 

        # check cybozu setting
        unless Cybozu.count.zero?
          # create cybozu schedule and update action item
          if @action_item.cybozu_schedule_id.nil?
            res = create_schedule_of_cybozu
            unless res.nil?
              @action_item.cybozu_schedule_id = res.id
              @action_item.cybozu_schedule_version = res.version
              @action_item.save!
            end
           # modify cybozu schedule
          else 
            res = modify_schedule_of_cybozu
          end
        # not modify cybozu schedule
        else
        end
      end
    rescue => e
      logger.error(e.message)
      @action_item = []
    end

    @action_item
  end

  # clear completion date of action item
  def clear_completion_date_of_action_item 
    begin
      ActionItem.transaction do

        @action_item = ActionItem.clear_completion_date_of_action_item(params[:params][:action_item_id]) 

        # check cybozu setting
        unless Cybozu.count.zero?
          # create cybozu schedule and update action item
          if @action_item.cybozu_schedule_id.nil?
            res = create_schedule_of_cybozu
            unless res.nil?
              @action_item.cybozu_schedule_id = res.id
              @action_item.cybozu_schedule_version = res.version
              @action_item.save!
            end
           # modify cybozu schedule
          else 
            res = modify_schedule_of_cybozu
          end
        # not modify cybozu schedule
        else
        end
      end
    rescue => e
      logger.error(e.message)
      @action_item = []
    end

    @action_item
  end

  # delete action item 
  def delete_action_item 
    begin
      ActionItem.transaction do

        @action_item = ActionItem.find(params[:params][:action_item_id])
        # check cybozu setting
        unless Cybozu.count.zero?
          # delete cybozu schedule
          unless @action_item.cybozu_schedule_id.nil?
            res = remove_schedule_of_cybozu
          else 
          end
        # not delete cybozu schedule
        else
        end

        # delete action item
        @action_item = ActionItem.delete(params[:params][:action_item_id])
      end
    rescue => e
      logger.error(e.message)
      @action_item = 0 
    end

    @action_item
  end

  private
  
    # create schedule of cybozu
    #
    # @raise [CybozuApi::Error::ConnectError]
    # @raise [CybozuApi::Error::ApiError]
    # @return [CybozuApi::Model::Schedule]
    def create_schedule_of_cybozu
      req = create_params_of_cybozu
      unless req[:users].blank?
        client = create_client_of_cybozu
        client.create_schedule(req[:schedule], req[:users], req[:date])
      end
    end

    # modify schedule of cybozu
    #
    # @raise [CybozuApi::Error::ConnectError]
    # @raise [CybozuApi::Error::ApiError]
    # @return [CybozuApi::Model::Schedule] or [nil]
    def modify_schedule_of_cybozu

      req = create_params_of_cybozu
      res = nil

      if req[:users].blank?
        remove_schedule_of_cybozu
      else
        client = create_client_of_cybozu
        # modify(registration cybozu schedule)
        unless client.get_schedule_by_id(@action_item.cybozu_schedule_id).blank?
          req[:schedule].id = @action_item.cybozu_schedule_id
          req[:schedule].version = @action_item.cybozu_schedule_version
          res = client.modify_schedule(req[:schedule], req[:users], req[:date])
        # create(not registration cybozu schedule)
        else
          logger.debug "schedule id not found create schedule of cybozu"
          res = create_schedule_of_cybozu
          unless res.nil?
            @action_item.cybozu_schedule_id = res.id
            @action_item.cybozu_schedule_version = res.version
            @action_item.save!
          end
        end
      end

      res

    end

    # remove schedule of cybozu
    #
    # @raise [CybozuApi::Error::ConnectError]
    # @raise [CybozuApi::Error::ApiError]
    def remove_schedule_of_cybozu
      client = create_client_of_cybozu
      # delete(registration cybozu schedule)
      unless client.get_schedule_by_id(@action_item.cybozu_schedule_id).blank?
        client.remove_schedule(@action_item.cybozu_schedule_id) 
      # nothing todo(not registration cybozu schedule)
      else
        logger.debug "schedule id not found"
      end
      @action_item.cybozu_schedule_id = nil
      @action_item.cybozu_schedule_version = nil
    end

    # create a client of cybozu
    #
    # @return [CybozuApi::Client]
    def create_client_of_cybozu
      cybozu = Cybozu.find(1) 
      CybozuApi::Client.new(cybozu.url, cybozu.login_id, cybozu.password)
    end

    # create a params of cybozu
    #
    # @return [Hash] { schedule, date, users }
    def create_params_of_cybozu

      hash = {}

      schedule = CybozuApi::Model::Schedule.new("A/I")
      @meeting = @action_item.agenda.meeting
      schedule.detail = @action_item.content
      schedule
          .description = %([#{t('activerecord.attributes.meeting.name')}]\n#{@meeting.name}\n)
      schedule
          .description << %([#{t('activerecord.attributes.action_item.content')}]\n#{@action_item.content}\n)
      schedule
          .description << %([#{t('activerecord.attributes.action_item.scheduled_date')}]\n#{@action_item.scheduled_date.strftime(t('date.formats.date'))}\n)
      completion_date = @action_item.completion_date.blank? ? "" : @action_item.completion_date.strftime(t('date.formats.date'))
      schedule
          .description << %([#{t('activerecord.attributes.action_item.completion_date')}]\n#{completion_date})
      hash[:schedule] = schedule
      hash[:date] = @action_item.scheduled_date.to_s << 'T' << '18:00:00' 
      user = User.where(:id => @action_item.user_id)
      hash[:users] = user[0].cybozu_id.blank? ? nil : [ user[0].cybozu_id ]

      hash

    end

end
