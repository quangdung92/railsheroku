# this class is schedule model of cybozu
# @author Kudo Syuji
# @version 1.0
require 'happymapper'

module CybozuApi
  module Model
    class Schedule
      include HappyMapper

      # initialize
      def initialize(plan = "会議")
        @xmlns = ""
        @id = "dummy"
        @event_type = "normal"
        @version = "dummy"
        @public_type = "public"
        @timezone = "JST"
        @plan = plan
        @detail = ""
        @description = ""
        @allday = false
      end

      # convert to hash
      #
      # @return [Hash] { schedule_event: { params } }
      def to_h

        hash = {}

        hash = {
          schedule_event: {
            xmlns: @xmlns,
            id: @id,
            event_type: @event_type,
            version: @version,
            public_type: @public_type,
            timezone: @timezone,
            plan: @plan,
            detail: @detail,
            description: @description,
            allday: @allday
          }
        }

        hash

      end
    
      tag 'schedule_event'
      attribute :id, String
      attribute :event_type, String
      attribute :version, String
      attribute :public_type, String
      attribute :plan, String
      attribute :detail, String
      attribute :description, String
      attribute :timezone, String
      attribute :allday, Boolean
      attribute :start_only, String
    end
  end
end
