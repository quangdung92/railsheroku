# encoding: utf-8

FactoryGirl.define do

  factory :agenda do
    proceeding
    sequence(:content) { |n| "[#{n}]初回会議です。" }

    after(:create) do |agenda|
      3.times { create(:action_item, agenda: agenda) }
    end
  end

end
