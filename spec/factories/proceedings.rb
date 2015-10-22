# encoding: utf-8

FactoryGirl.define do

  factory :proceeding do
    meeting

    after(:create) do |proceeding|
      3.times { create(:agenda, proceeding: proceeding) }
    end
  end

end
