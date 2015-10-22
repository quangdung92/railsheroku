# require
require 'factory_girl_rails'

RSpec.configure do |config|

  # It's omitted syntax of FactoryGirl
  config.include FactoryGirl::Syntax::Methods

  config.before(:all) do
    FactoryGirl.reload
    FactoryGirl.create(:user_admin)
    FactoryGirl.create(:user_normal)
    FactoryGirl.create(:user_not_firstlogin)
    FactoryGirl.create_list(:test_users, 20)
    FactoryGirl.create(:user_deleted)
    FactoryGirl.create(:aiken)
    FactoryGirl.create(:grooovy)
    FactoryGirl.create_list(:test_kinds, 20)
  end

  config.before(:each) do
    # nothing todo
  end

  config.before(:each, type: :feature, javascript: :true) do
    # nothing todo
  end
end
