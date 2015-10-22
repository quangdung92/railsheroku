# encoding: utf-8

steps_for :account do

  step 'sc :name' do |name|
    send %(screenshot :name), %(account/#{name})
  end

  step %(modify user to normal) do
    user = User.where(:login_id => "modify")
    user = user[0]
    user.update(:login_id => "normal", :name => "一般")
  end

  step %(click a button of login user name) do
    user = User.where(:login_id => "normal")
    p user[0].name
    click_on user[0].name
  end

  step %(show account edit) do
    user = User.where(:login_id => "normal")
    url = "http://127.0.0.1/account/#{user[0].id}"
    visit url
  end

  step %(click a button of edit) do
    click_on '設定変更'
  end

  step 'click a button of update' do
    click_on '更新する'
  end

  step 'click a button of cancel' do
    click_on 'キャンセル'
  end

  step 'edit a user of the information' do
    send %(sc :name), 'before_edit_user'
    fill_in('user_login_id', :with => "modify")
    fill_in('user_name', :with => "変更済みユーザ")
    fill_in('user_kana', :with => "へんこうずみゆーざ")
    fill_in('user_mailaddress', :with => "modify@grooovyware.jp")
    fill_in('user_password', :with => "modify") 
    fill_in('user_password_confirmation', :with => "modify")
    send %(sc :name), 'after_edit_user'
  end

end
