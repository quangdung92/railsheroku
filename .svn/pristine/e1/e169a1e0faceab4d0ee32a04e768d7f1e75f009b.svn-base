# encoding: utf-8

FactoryGirl.define do

  factory :meeting_history do
    
    trait :operation_regist do
      meeting_id 1
      operation_user_id 1
      operation MeetingHistory.operations[:regist] 
      date Date.today 
    end
  
    trait :operation_edit do
      meeting_id 1
      operation_user_id 1
      operation MeetingHistory.operations[:edit] 
      date Date.today
    end
  
    trait :operation_canceled do
      meeting_id 3 
      operation_user_id 1
      operation MeetingHistory.operations[:canceled] 
      date Date.today
    end
  
    trait :operation_ended do
      meeting_id 2
      operation_user_id 1
      operation MeetingHistory.operations[:ended] 
      date Date.today
    end
  
    trait :date_before_1day do
      meeting_id 4 
      operation_user_id 1
      operation MeetingHistory.operations[:regist] 
      date Date.today - 3
    end
    
  end

end
