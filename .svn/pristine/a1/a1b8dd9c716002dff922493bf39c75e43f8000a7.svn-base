class Cybozu < ActiveRecord::Base

  validates :url, presence: true
  validates :login_id, presence: true
  validates :password, presence: true, on: :create

  def encryptor
    secret = 'jijkjkjdkjgdjljdkkieognkhkkgjekaaaaiehgjss'
    ::ActiveSupport::MessageEncryptor.new(secret)
  end

  def password=(val)
    encryptor = self.encryptor
    write_attribute("password",encryptor.encrypt_and_sign(val))
  end

  def password
    encryptor = self.encryptor
    encryptor.decrypt_and_verify(read_attribute("password"))
  end
end
