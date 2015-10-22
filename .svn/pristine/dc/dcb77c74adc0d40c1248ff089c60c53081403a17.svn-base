# this class is error model of cybozu
# @author Kudo Syuji
# @version 1.0
require 'happymapper'

module CybozuApi
  module Model
    class Error
      include HappyMapper
    
      tag 'Detail'
      namespace 'soap'
      element :code, String, namespace: nil
      element :message, String, tag: 'diagnosis', namespace: nil
    end
  end
end
