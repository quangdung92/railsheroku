# encoding: utf-8

FactoryGirl.define do

  factory :action_item do
    agenda
    sequence(:content) { |n| "[#{n}]案件を取得する。" }
    sequence(:user_id) { |n| n % 2 + 1 }

    scheduled_date do
      from = Date.parse("2014-11-01")
      to = Date.parse("2015-04-01")
      Random.rand(from .. to)
    end

    trait :data_of_me do
      user_id 2
    end

    trait :ai_after_1day do
      scheduled_date Date.today + 1
    end
    
    trait :ai_today do
      scheduled_date Date.today
    end

    trait :completion_date do
      completion_date Date.today
    end

  end

end
