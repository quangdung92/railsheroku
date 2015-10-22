FactoryGirl.define do
  factory :user_admin, class: User do
    login_id "gijirokucloud" 
    name "gijirokucloud" 
    kana "ぎじろくくらうど"
    mailaddress ""
    password "gijirokucloud" 
    password_confirmation "gijirokucloud" 
    cybozu_id ""
    grant 0 
    is_deleted false
    is_firstlogged true 
  end

  factory :user_normal, class: User do
    login_id "normal" 
    name "一般" 
    kana "いっぱん"
    mailaddress ""
    password "normal" 
    password_confirmation "normal" 
    cybozu_id ""
    grant 1
    is_deleted false
    is_firstlogged true 
  end
  
  factory :user_not_firstlogin, class: User do
    login_id "firstlogin" 
    name "firstlogin" 
    kana "てすとゆーざ"
    mailaddress ""
    password "firstlogin" 
    password_confirmation "firstlogin" 
    cybozu_id ""
    grant 1
    is_deleted false
    is_firstlogged false 
  end
  
  factory :user_deleted, class: User do
    login_id "deleted" 
    name "削除済みユーザ" 
    kana "さくじょずみゆーざ"
    mailaddress ""
    password "deleted" 
    password_confirmation "deleted" 
    cybozu_id ""
    grant 1
    is_deleted true 
    is_firstlogged true 
  end

  factory :test_users, class: User do
    sequence(:login_id) { |n| "testuser_#{n}"  }
    name "削除済みユーザ" 
    kana "さくじょずみゆーざ"
    mailaddress ""
    password "deleted" 
    password_confirmation "deleted" 
    cybozu_id ""
    grant 1
    is_deleted false
    is_firstlogged true 
  end

  factory :create_user, class: User do
    login_id "create_user"
    name "テストユーザ" 
    kana "てすとゆーざ"
    mailaddress ""
    password "test" 
    password_confirmation "test" 
    cybozu_id ""
    grant 1
    is_deleted false
    is_firstlogged false
  end

end
