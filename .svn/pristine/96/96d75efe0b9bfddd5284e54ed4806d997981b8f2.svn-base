# encoding: utf-8

FactoryGirl.define do

  factory :action_item_history do
    
    trait :operation_regist_ai_after_1day do
      action_item_id 49
      operation_user_id 1
      operation ActionItemHistory.operations[:regist] 
      date Date.today 
    end

    trait :operation_regist_today do
      action_item_id 93 
      operation_user_id 1
      operation ActionItemHistory.operations[:regist] 
      date Date.today 
    end

    trait :operation_regist do
      action_item_id 1
      operation_user_id 1
      operation ActionItemHistory.operations[:regist] 
      date Date.today 
    end

    trait :operation_ended do
      action_item_id 71
      operation_user_id 1
      operation ActionItemHistory.operations[:ended] 
      date Date.today 
    end
    
  end

end
