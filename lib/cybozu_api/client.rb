# this class is client of cybozu
# @author Kudo Syuji
# @version 1.0
require "cybozu_api/connect"
require "cybozu_api/model/user_item"
require "cybozu_api/model/user"
require "cybozu_api/model/schedule"
require "cybozu_api/error"

module CybozuApi
  class Client

    # initialize
    #
    # @params [String] url cybozu url
    # @params [String] user_name cybozu login name
    # @params [String] password cybozu login password
    def initialize(url, user_name, password)
      @connect = CybozuApi::Connect.new(url, user_name, password)
    end

    # test connect
    #
    def test_connect

      @connect.exec('Base', 'BaseGetUsersByLoginName', {login_name: {innerValue: @connect.user_name}}) 
      check_error

    end

    # get a user lists
    #
    # @return [Array] CybozuApi::Model::User
    def get_users
      # get a all users id
      @connect.exec('Base', 'BaseGetUserVersions', nil) 
      check_error

      user_items = CybozuApi::Model::UserItem.parse(@connect.get_response)
      ids = user_items.map {|user| { innerValue: user.id } }

      # get a users infomation
      @connect.exec('Base', 'BaseGetUsersById', { user_id: ids }) 
      check_error

      CybozuApi::Model::User.parse(@connect.get_response)
    end

    # get a cybozu schedule
    # @params [Integer] cybozu schedule id 
    # @return [Array] CybozuApi::Model::Schedule
    def get_schedule_by_id(id)
      @connect.exec("Schedule", "ScheduleGetEventsById", {event_id: {innerValue: id}})
      # skip check error(If you plan there is no error)
      unless get_error_code = "501"
        check_error
      end
      CybozuApi::Model::Schedule.parse(@connect.get_response)
    end

    # create a schedule
    #
    # @params [CybozuApi::Model::Schedule] schedule schedule model of cybozu
    # @params [Array] users [ intger, intger, ...]
    # @params [String] date to format to '%Y-%m-%dT%H:%M:%s'
    # @return [CybozuApi::Model::Schedule]
    def create_schedule(schedule, users, date)
      params = create_request_of_schedule(schedule, users, date)
      @connect.exec("Schedule", "ScheduleAddEvents", params)
      check_error
      CybozuApi::Model::Schedule.parse(@connect.get_response, single: true)
    end

    # modify a schedule
    #
    # @params [CybozuApi::Model::Schedule] schedule schedule model of cybozu
    # @params [Array] users [ intger, intger, ...]
    # @params [String] date to format to '%Y-%m-%dT%H:%M:%s'
    # @return [CybozuApi::Model::Schedule]
    def modify_schedule(schedule, users, date)
      params = create_request_of_schedule(schedule, users, date)
      @connect.exec("Schedule", "ScheduleModifyEvents", params)
      check_error
      CybozuApi::Model::Schedule.parse(@connect.get_response, single: true)
    end

    # remove a schedule
    # 
    # @params [Integer] event_id schedule event id
    def remove_schedule(event_id)
      @connect.exec("Schedule", "ScheduleRemoveEvents", { event_id: { innerValue: event_id} })
      check_error
    end

    private

    # check error
    def check_error

      data = @connect.get_response
      error = CybozuApi::Model::Error.parse(data, single: true)

      unless error.nil?
        raise CybozuApi::ApiError.new(error.message)
      end

    end

    # get error code
    #
    # @return [String] error code
    def get_error_code

      error_code = nil
      data = @connect.get_response
      error = CybozuApi::Model::Error.parse(data, single: true)

      unless error.nil?
        error_code = error.code
      end

      error_code
    end

    # create a request of schedule
    #
    # @params [CybozuApi::Model::Schedule] schedule schedule model of cybozu
    # @params [Array] users [intger, integer, ...]
    # @params [String] date to format to '%Y-%m-%dT%H:%M:%s'
    # @return [Hash] { schedule_event { ..., members, start_only, when } }
    def create_request_of_schedule(schedule, users, date)

      params = schedule.to_h
      params[:schedule_event][:members] = create_schedule_member(users)
      params[:schedule_event][:start_only] = true
      params[:schedule_event][:when] = {datetime: {start: date}}

      params

    end

    # create schedule member
    #
    # @params [Array] users [intger, integer, ...]
    # @return [Hash] { member: [{user: {id: integer}}, {user: {id: integer}}, ...]
    def create_schedule_member(users)

      hash = {}
      hash[:member] = []

      users.each do |user|
        hash[:member] << {user: { id: user }}
      end

      hash

    end

  end
end
