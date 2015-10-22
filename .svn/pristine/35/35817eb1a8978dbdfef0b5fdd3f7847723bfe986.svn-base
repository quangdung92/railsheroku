require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.build(:user) }

  specify "name is not empty" do
    expect(user).to be_valid
  end

  specify "name is empty" do
    user[:name] = ''
    expect(user).not_to be_valid
    expect(user.errors[:name]).to be_present
  end

end
