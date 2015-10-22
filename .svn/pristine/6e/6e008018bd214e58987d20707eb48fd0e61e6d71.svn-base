# this class is request xml of cybozu
# @author Kudo Syuji
# @version 1.0
require 'time'
require 'cgi'

module CybozuApi
  class XmlRequest

    # initialize
    #
    # @params [String] user_name cybozu login name
    # @params [String] password cybozu login password
    # @params [String] method cybozu service method
    # @params [Mixed] params cybozu service parameter
    def initialize(user_name, password, method, params)
      @user_name = user_name
      @password = password
      @method = xml_escape(method)
      @params = params
    end

    # create request xml
    def create_xml
      set_header
      set_body
    end

    # request xml to string
    # @return [String] xml string
    def to_s
      @request = '<?xml version="1.0" encoding="utf-8"?>'
      @request << '<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope"'
      @request << ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
      @request << ' xmlns:xsd="http://www.w3.org/2001/XMLSchema">'
      @request << @xml_header
      @request << @xml_body
      @request << '</soap:Envelope>'
    end

    private

    # set a header of request xml
    def set_header

      time = Time.now
      created = Time.iso8601(time.iso8601).xmlschema
      expires = Time.iso8601((time + 1000).iso8601).xmlschema
      #created = time.strftime('%Y-%m-%dT%H:%M:%SZ')
      #expires = (time + 1000).strftime('%Y-%m-%dT%H:%M:%SZ')

      @xml_header = '<soap:Header>'
      @xml_header << '<Action soap:mustUnderstand="1" xmlns="http://schemas.xmlsoap.org/ws/2003/03/addressing">'
      @xml_header << @method
      @xml_header << '</Action>'
      @xml_header << '<Timestamp soap:mustUnderstande="1" xmlns="http://schemas.xmlsoap.org/ws/2002/07/utility">'
      @xml_header << '<Created>' + created + '</Created>'
      @xml_header << '<Expires>' + expires + '</Expires>'
      @xml_header << '</Timestamp>'
      @xml_header << set_security
      @xml_header << '</soap:Header>'

    end

    # set a security
    def set_security

      xml = ''

      if @user_name && @password
        xml << '<Security xmlns:wsu="http://schemas.xmlsoap.org/ws/2002/07/utility"'
        xml << ' soap:mustUnderstand="1" xmlns="http://schemas.xmlsoap.org/ws/2002/12/secext">'
        xml << '<UsernameToken>'
        xml << '<Username>' << xml_escape(@user_name) << '</Username>'
        xml << '<Password>' << xml_escape(@password) << '</Password>'
        xml << '</UsernameToken>'
        xml << '</Security>'
      end

      xml

    end

    # set a body of request xml
    def set_body
      @xml_body = '<soap:Body>'
      @xml_body << '<' << @method << ' xmlns="http://wsdl.cybozu.co.jp/base/2008">'
      @xml_body << make_parameters_xml("parameters", @params)
      @xml_body << '</' << @method << '></soap:Body>'
    end

    # make a parameters of request xml
    #
    # @params [Mixed] name xml element name
    # @params [Mixed] chile element children
    # @return [String] xml
    def make_parameters_xml(name, child)

      if !child || !(child.is_a? Hash)
        return "<#{name} />"
      end

      xml = "<" << name.to_s
      attributes_ended = false

      if name == "parameters"
          xml << ' xmlns=""'
      end

      child.each do |key, value|

        if value.nil?
          #do noting
        elsif value.is_a? Hash
          unless attributes_ended
            attributes_ended = true
            xml << ">"
          end
          xml << make_parameters_xml(key, value)
        elsif value.is_a? Array
          unless attributes_ended
            attributes_ended = true
            xml << ">"
          end
          value.each do |v|
            next unless v.is_a? Hash
            xml << make_parameters_xml(key, v)
          end
        elsif key.to_s == "innerValue"
          unless attributes_ended
            attributes_ended = true
            xml << ">"
          end
          xml << html_escape(value.to_s);
          break
        elsif !attributes_ended
            #attribute
            if value.is_a? String
                if value.index("\n").nil?
                    xml << " " << key.to_s << '="' << html_escape(value) << '"'
                else
                    xml << " " << key.to_s << '="' << xml_attr_escape(value) << '"'
                end
            elsif value.is_a? Integer || (value.is_a?(TrueClass) || value.is_a?(FalseClass))
                xml << " " << key.to_s << '="' << value.to_s << '"'
            end
        else
          #attributes are ended
        end
      end
      xml << ">" unless attributes_ended
      xml << "</#{name}>"
    end

    # html escape
    # 
    # @params [String] text original string
    # @return [String] escape string
    def html_escape(text)
      CGI.escapeHTML(text)
    end

    # xml escape
    # 
    # @params [String] text original string
    # @return [String] escape string
    def xml_escape(text)
      text.encode(xml: :text)
    end

    # xml attributes escape
    # 
    # @params [String] text original string
    # @return [String] escape string
    def xml_attr_escape(text)
      CGI.escapeHTML(text).gsub(/\r/, "&#xD;").gsub(/\n/, "&#xA;");
    end

  end
end
