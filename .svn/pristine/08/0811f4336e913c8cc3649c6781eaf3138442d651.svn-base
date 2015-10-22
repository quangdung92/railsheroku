# encoding: utf-8

FactoryGirl.define do

  factory :meeting do

    sequence(:name) { |n| "27年度#{n}回目会議" }
    dates do
      from = Date.parse("2014-11-01")
      to = Date.parse("2015-04-01")
      Random.rand(from .. to)
    end
    kind_id 1

    start_time '12:00:00'
    venue '本社会議室'

    trait :search do
      name "サーチテスト"
      dates "2015-10-01"
      kind_id 2
    end

    trait :is_completed do
      is_completed true
      name "終了会議1"
    end

    trait :is_scheduled do
      name "開催予定会議1"
      dates Time.now()
    end

    trait :is_scheduled_after_1day do
      name "開催予定会議2"
      dates Date.today + 1
    end

    trait :is_canceled do
      name "中止会議1"
      is_canceled true
      dates Date.today
    end

    after(:create) do |meeting|
      create(:proceeding, meeting: meeting)
      2.times { create(:observer, meeting: meeting) }
      2.times { create(:participant, meeting: meeting) }
    end

  end
  
end
