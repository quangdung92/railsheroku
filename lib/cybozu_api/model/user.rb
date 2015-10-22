# this class is user model of cybozu
# @author Kudo Syuji
# @version 1.0
require 'happymapper'

module CybozuApi
  module Model
    class User
      include HappyMapper
    
      tag 'user'
      attribute :cybozu_id, String, tag: 'key'
      attribute :version, String
      attribute :order, String
      attribute :login_id, String, tag: 'login_name'
      attribute :name, String
      attribute :status, String
      attribute :kana, String, tag: 'reading'
      attribute :mailaddress, String, tag: 'email'

    end
  end
end
