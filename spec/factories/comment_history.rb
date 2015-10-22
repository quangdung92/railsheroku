# encoding: utf-8

FactoryGirl.define do

  factory :comment_history do
    
    trait :operation_regist do
      comment_id 1
      operation_user_id 1
      operation CommentHistory.operations[:regist] 
      date Date.today 
    end
    
  end

end
