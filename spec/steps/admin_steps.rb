#encoding: utf-8

steps_for :admin do

  step 'click the a of ":link_name"' do |link_name|
    click_link link_name
  end

end
