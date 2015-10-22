# encoding: utf-8

steps_for :user do

  step 'sc :name' do |name|
    send %(screenshot :name), %(users/#{name})
  end

  step 'click the a of user' do
    find('#user_link').trigger('click')
  end

  step 'Row of the table is :num' do |num|
    sleep(5)
    send %(sc :name), "row_is_#{num}"
    expect(page).to have_css("table tbody tr", count: num)
  end

  step 'next list' do
    sleep(5)
    click_on '次へ'
  end

  step 'click a button of create' do
    click_on '作成'
  end

  step 'click the edit button in the second row' do
    sleep(1)
    send %(sc :name), 'click_edit'
    all('table tbody tr')[1].click_link '編集'
  end

  step 'click the show button in the second row' do
    sleep(1)
    send %(sc :name), 'click_show'
    all('table tbody tr')[1].click_link '詳細'
  end

  step 'click a button of regist' do
    send %(sc :name), 'before_regist'
    sleep(1)
    click_on '登録する'
    sleep(1)
    send %(sc :name), 'after_regist'
  end

  step 'click a button of edit' do
    click_on '更新する'
  end

  step 'enter a new user of the information' do
    test = build(:create_user)
    fill_in('user_login_id', :with => test.login_id)
    fill_in('user_name', :with => test.name)
    fill_in('user_kana', :with => test.kana)
    fill_in('user_password', :with => test.password)
    fill_in('user_password_confirmation', :with => test.password)
    find('#user_grant_1').trigger('click')
    send %(sc :name), 'create_user_enter'
  end

  step 'edit a user of the information' do
    find('#user_grant_0').trigger('click')
    send %(sc :name), 'create_user_edit'
  end

  step 'check the disable' do
    find('#user_is_deleted').trigger('click')
    send %(sc :name), 'user_deleted'
  end

  step 'disabled to the user of second row' do
    sleep(2)
    send %(sc :name), 'user_list_deleted'
    t = all('table tbody tr')[1]
    expect(t[:class]).to be_include('danger')
  end

  step 'show a user of the information' do
    sleep(2)
    expect(page).to have_css('.user-details p:first-child', :text => 'normal')
    #expect(all('.user-details p')[0]).to have_content('normal')
  end

  step 'click the ok button in the modal' do
    sleep(2)
    send %(sc :name), 'click_modal_befor'
    click_on 'OK'
    send %(sc :name), 'click_modal_after'
  end

  step 'disabled to the disable button' do
    sleep(4)
    send %(sc :name), 'disable_button'
    expect(all('table tbody tr')[1]).to have_css('a.disabled')
  end

end
