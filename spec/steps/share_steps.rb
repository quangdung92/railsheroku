# coding: utf-8

step %(screenshot :name) do |name|
  page.save_screenshot(%(/vagrant/js/#{name}.png), :full => true)
end

step %(create data) do
  create(:meeting)
end

step %(visit the :page) do |page|
  url = "http://127.0.0.1/#{page}"
  visit url
end

step %(input to id and password of the administrator) do
  admin = FactoryGirl.build(:user_admin)
  fill_in('user_login_id', :with => admin.login_id)
  fill_in('user_password', :with => admin.password)
  send %(screenshot :name), "input_admin"
end

step %(input to id and password of the normal) do
  normal = FactoryGirl.build(:user_normal)
  fill_in('user_login_id', :with => normal.login_id)
  fill_in('user_password', :with => normal.password)
  send %(screenshot :name), "input_normal"
end

step %(click login button) do
  click_button(I18n.t("login.btn.login"))
end

step %(login with the :name) do |name|
  send %(visit the :page), "login"
  send %(input to id and password of the #{name})
  send %(click login button)
end

step %(show the ":text") do |text|
  expect(page).to have_content(text)
end

step %(hide the ":text") do |text|
  expect(page).not_to have_content(text)
end

step %(show the :element of ":text") do |element, text|
  expect(page).to have_css(element, text: text)
end

step %(hide the :element of ":text") do |element, text|
  expect(page).not_to have_css(element, text: text)
end

step 'moved to the :page_name' do |page_name|
  url = "http://127.0.0.1/#{page_name}"
  expect(current_url).to eq url
end

step 'input id :id and password :password' do |id, password|
  fill_in('user_login_id', :with => id)
  fill_in('user_password', :with => password)
end

step 'input new_password :new_password and confirm_password :confirm_password' do |new_password, confirm_password|
  fill_in('user_password', :with => new_password)
  fill_in('user_password_confirmation', :with => confirm_password)
end

step %(show selector the :name) do |name|
  page.has_selector?("#{name}")
end

placeholder :text do
  match /.+/ do |text|
    text
  end
end
