# this class is connect of cybozu
# @author Kudo Syuji
# @version 1.0
require "cybozu_api/xml_request"
require "cybozu_api/model/error"
require "cybozu_api/error"
require "net/http"
require "uri"

module CybozuApi
  class Connect

    attr_accessor :url, :user_name, :password

    # initialize
    #
    # @params [String] url cybozu url
    # @params [String] user_name cybozu login name
    # @params [String] password cybozu login password
    def initialize(url, user_name, password)
      @url = url
      @user_name = user_name
      @password = password
    end

    # http communication start
    #
    # @params [String] service cybozu service name
    # @params [String] method cybozu service method
    # @params [Mixed] params cybozu service parameter
    # @raise [CybozuApi::ConnectError]
    def exec(service, method, params)

      begin
        @response = ''

        xml_request = CybozuApi::XmlRequest.new(@user_name, @password, method, params)
        xml_request.create_xml

        uri = URI.parse(@url + "?page=PApi#{service}")

        request = Net::HTTP::Post.new(uri.request_uri)
        request["Content-Type"] = "application/soap+xml;charset=UTF-8;"
        request.body = xml_request.to_s

        http = Net::HTTP.new(uri.host, uri.port)
        http.set_debug_output $stderr

        http.start do |h|
          @response = h.request(request)
        end
      rescue => e
        raise CybozuApi::ConnectError.new(e.message)
      end

      check_error

    end

    # get a response body
    def get_response
      @response.body.gsub(/xmlns=".*"/,'')
    end

    private

    # check error
    def check_error

      unless @response.is_a? Net::HTTPOK
        raise CybozuApi::ConnectError.new(%([#{@response.code}]:#{@response.message}))
      end

    end

  end
end
