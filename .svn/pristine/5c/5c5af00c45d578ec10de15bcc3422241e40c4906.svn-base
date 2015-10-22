# encoding: utf-8

steps_for :kind do

  step 'show_wait' do
    sleep(3)
  end

  step 'sc :name' do |name|
    send %(screenshot :name), %(kinds/#{name})
  end

  step 'click the a of kind' do
    find('#kind_link').trigger('click')
  end

  step 'Row of the table is :num' do |num|
    send %(sc :name), "before-show-table-#{num}"
    send("show_wait") 
    expect(page).to have_css("table tbody tr", count: num)
    send %(sc :name), "after-show-table-#{num}"
  end

  step 'next list' do
    send %(sc :name), 'before-click-next'
    send("show_wait") 
    click_on '次へ'
    send %(sc :name), 'after-click-next'
  end

  step 'prev list' do
    send %(sc :name), 'before-click-prev'
    sleep(10)
    click_on '前へ'
    send %(sc :name), 'after-click-prev'
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
    all('table tbody tr')[1].click_link '表示'
  end

  step 'click the disable button in the second row' do
    sleep(2)
    send %(sc :name), 'click_disable'
    all('table tbody tr')[1].find('a:last-child').trigger('click')
  end

  step 'click a button of regist' do
    click_on '登録する'
  end

  step 'click a button of edit' do
    click_on '更新する'
  end

  step 'enter a new kind of the information' do
    fill_in('kind_name', :with => "テストDR")
    send %(sc :name), 'create_kind_enter-1'
    #select('gijirokucloud', :from => "participant-template-r")
    #click_link("pt-arrow-left")
    send %(sc :name), 'create_kind_enter-2'
  end

  step 'edit a user of the information' do
    find('#user_grant_0').trigger('click')
    send %(sc :name), 'create_user_edit'
  end

  step 'show a user of the information' do
    sleep(2)
    expect(page).to have_css('.user-details p:first-child', :text => 'normal')
    #expect(page.all('.user-details p')[0]).to have_content('normal')
  end

  step 'click the ok button in the modal' do
    sleep(2)
    send %(sc :name), 'click_modal_befor'
    click_on 'OK'
    send %(sc :name), 'click_modal_after'
  end

  step 'disabled to the disable button' do
    sleep(1)
    expect(all('table tbody tr')[1]).to have_css('a.disabled')
    send %(sc :name), 'disable_button'
  end

end
