# APP_HOST is the IP address or hostname
APP_HOST = "127.0.0.1"

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :defautl_wait_time => 3, :timeout => 60})
end

Capybara.configure do |config|
  config.javascript_driver = :poltergeist
  config.default_wait_time = 3
end

#RSpec.configure do |config|
#
#  config.before(:each, js: true) do
#    Capybara.app_host = "http://#{APP_HOST}"
#  end
#
#end
