#encoding: utf-8

steps_for :firstlogin do

  step 'click regist button' do
    click_button(I18n.t("firstlogin.btn.regist"))  
  end

  step 'click the link of :link_name' do |link_name|
    click_link link_name
  end

  step 'show password not match error message' do
    expect(page).to have_content I18n.t("firstlogin.message.not_match")
  end

  step 'show password not input error message' do
    expect(page).to have_content I18n.t("firstlogin.message.not_input")
  end
  
  step 'click cancel button' do
    click_button(I18n.t("firstlogin.btn.cancel"))  
  end
  
end
