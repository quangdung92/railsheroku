# encoding: utf-8

steps_for :home do

  step %(wait_js) do
    sleep(1)
  end

  step %(ended meeting data exist) do
    FactoryGirl.create(:meeting, :is_completed)
    send %(wait_js)
  end

  step %(ended meeting data not exist) do
    send %(wait_js)
  end

  step %(show the ended meeting data) do
    send %(screenshot :name), 'show-ended-data'
    expect(find('#ended-meeting .list-content')).to have_css("a")
  end

  step %(hide the ended meeting data) do
    send %(screenshot :name), 'hide-ended-data'
    expect(find('#ended-meeting .list-content')).not_to have_css("a")
  end

  step %(scheduled meeting data exist) do
    FactoryGirl.create(:meeting, :is_scheduled)
    send %(wait_js)
  end

  step %(scheduled meeting data not exist) do
    send %(wait_js)
  end

  step %(show the scheduled meeting data) do
    send %(screenshot :name), 'show-scheduled-data'
    expect(find('#scheduled-meeting .list-content')).to have_css("a")
  end

  step %(hide the scheduled meeting data) do
    send %(screenshot :name), 'hide-scheduled-data'
    expect(find('#scheduled-meeting .list-content')).not_to have_css("a")
  end

  step %(exist the unresolved ai data of me) do
    FactoryGirl.create(:action_item)
    send %(wait_js)
  end

  step %(create whats new list data) do
    Meeting.create(:name=> "テスト会議", :kind_id => 1, :start_time => "12:00", :dates => Date.today, venue: "本社")
    Meeting.create(:name=> "開催予定会議1", :kind_id => 1, :start_time => "12:00", :dates => Date.today, venue: "本社")
    Meeting.create(:name=> "開催予定会議2", :kind_id => 1, :start_time => "12:00", :dates => Date.today + 1, venue: "本社")
    Meeting.create(:name=> "中止会議", :kind_id => 1, :start_time => "12:00", :dates => Date.today, :venue => "本社", :is_canceled => true)
    Meeting.create(:name=> "終了会議", :kind_id => 2, :start_time => "12:00", :dates => Date.today, :venue => "本社", :is_completed => true)
    for i in 1 .. 5 do
      Participant.create(:meeting_id => i, :user_id => 1)
    end
    for i in 1 .. 5 do
      Observer.create(:meeting_id => i, :user_id => 2)
    end
    for i in 1 .. 5 do
      Proceeding.create(:meeting_id => i)
    end
    for i in 1 .. 5 do
      Agenda.create(:proceeding_id => i, :content => "#{i}回目会議です。")
    end
    MeetingHistory.create(:meeting_id => 1, :operation => 1, :operation_user_id => 1, :date => Time.now())
    MeetingHistory.create(:meeting_id => 1, :operation => 2, :operation_user_id => 1, :date => Time.now())
    MeetingHistory.create(:meeting_id => 2, :operation => 2, :operation_user_id => 1, :date => Time.now())
    MeetingHistory.create(:meeting_id => 4, :operation => 4, :operation_user_id => 1, :date => Time.now())
    MeetingHistory.create(:meeting_id => 5, :operation => 5, :operation_user_id => 1, :date => Time.now())
    MeetingHistory.create(:meeting_id => 3, :operation => 1, :operation_user_id => 1, :date => Time.now())
    FactoryGirl.create(:comment)
    FactoryGirl.create(:comment_history, :operation_regist)
    ActionItem.create(:agenda_id => 1, :content => "本日対応AI", :user_id => 1, :scheduled_date => Date.today)
    ActionItem.create(:agenda_id => 1, :content => "翌日対応AI", :user_id => 1, :scheduled_date => Date.today + 1)
    ActionItem.create(:agenda_id => 1, :content => "完了AI", :user_id => 1, :scheduled_date => Date.today, :completion_date => Date.today)
    ActionItemHistory.create(:action_item_id => 1, :operation => 1, :operation_user_id => 1, :date => Time.now())
    ActionItemHistory.create(:action_item_id => 2, :operation => 1, :operation_user_id => 1, :date => Time.now())
    ActionItemHistory.create(:action_item_id => 3, :operation => 5, :operation_user_id => 1, :date => Time.now())
=begin
    FactoryGirl.create(:meeting)
    FactoryGirl.create(:meeting, :is_scheduled)
    FactoryGirl.create(:meeting, :is_completed)
    FactoryGirl.create(:meeting, :is_canceled)
    FactoryGirl.create(:meeting_history, :operation_regist)
    FactoryGirl.create(:meeting_history, :operation_edit)
    FactoryGirl.create(:meeting_history, :operation_canceled)
    FactoryGirl.create(:meeting_history, :operation_ended)
    FactoryGirl.create(:comment)
    FactoryGirl.create(:comment_history, :operation_regist)
    FactoryGirl.create(:action_item, :ai_after_1day)
    FactoryGirl.create(:action_item, :completion_date)
    FactoryGirl.create(:action_item, :ai_today)
    FactoryGirl.create(:action_item_history, :operation_regist)
    FactoryGirl.create(:action_item_history, :operation_regist_ai_after_1day)
    FactoryGirl.create(:action_item_history, :operation_ended)
    FactoryGirl.create(:action_item_history, :operation_regist_today)
=end
    send %(wait_js)
  end

  step %(not exist the unresolved ai data of me) do
    send %(wait_js)
  end

  step %(show the unresolved ai data of me) do
    send %(screenshot :name), 'show-unesolved-me'
    expect(find('#unresolved-ai-me .list-content')).to have_css("a")
  end

  step %(hide the unresolved ai data of me) do
    send %(screenshot :name), 'hide-unesolved-me'
    expect(find('#unresolved-ai-me .list-content')).not_to have_css("a")
  end
 
  step %(show the whats new data) do
    send %(screenshot :name), 'show-whats-new'
    expect(find('#whats-new .list-content')).to have_css("a")
  end

  step %(hide the whats new data) do
    send %(screenshot :name), 'hide-whats-new'
    expect(find('#whats-new .list-content')).not_to have_css("a")
  end

  step %(exist the unresolved ai data of meeting) do
    FactoryGirl.create(:meeting)
    send %(wait_js)
  end

  step %(not exist the unresolved ai data of meeting) do
    send %(wait_js)
  end

  step %(show the unresolved ai data of meeting) do
    send %(screenshot :name), 'show-unesolved-meeting'
    expect(find('#unresolved-ai-meeting .list-content')).to have_css('a')
  end

  step %(hide the unresolved ai data of meeting) do
    send %(screenshot :name), 'hide-unesolved-meeting'
    expect(find('#unresolved-ai-meeting .list-content')).not_to have_css('a')
  end

  step %(create search data) do
    send %(create data)
    create(:meeting, :search)
  end

  step %(input to meeting name) do
    send %(screenshot :name), 'befor-search-meeting-name'
    fill_in('free_word', with: 'サーチ')
  end


  step %(only data that matches the meeting name is displyed) do
    send %(wait_js)
    expect(find('#unresolved-ai-meeting')).not_to have_content('27年度')
    send %(screenshot :name), 'after-search-meeting-name'
  end

  step %(input to meeting date) do
    send %(screenshot :name), 'befor-search-meeting-date'
    fill_in('date', with: '2015-05-31')
  end

  step %(only data that matches the meeting date is displyed) do
    send %(wait_js)
    expect(find('#unresolved-ai-meeting')).not_to have_content('27年度')
    send %(screenshot :name), 'after-search-meeting-date'
  end

  step %(select to meeting kind) do
    send %(screenshot :name), 'befor-search-meeting-kind'
    select('grooovy_dr', from: 'kind')
  end

  step %(only data that matches the meeting kind is displyed) do
    send %(wait_js)
    expect(find('#unresolved-ai-meeting')).not_to have_content('27年度')
    send %(screenshot :name), 'after-search-meeting-kind'
  end

  #step %(ended meeting data exist) do
  #  #FactoryGirl.create(:meeting, :is_completed)
  #end

  #step %(scheduled meeting) do
  #  #FactoryGirl.create(:meeting)
  #end

  step %(input to ":text" meeting name) do |text|
    send %(screenshot :name), 'befor-search-meeting-name-whats-new'
    fill_in('free_word', :with => text)
  end

  step %(select to meeting kind whats new) do
    send %(screenshot :name), 'befor-search-meeting-kind-whats-new'
    select('grooovy_dr', from: 'kind')
  end

  step %(input 1_after_day to meeting date) do
    send %(screenshot :name), 'befor-search-meeting-date-whats-new'
    fill_in('date', :with => Date.today + 1)
  end

  step %(is displayed result of the search in meething name the whats'new) do
    send %(wait_js)
    send %(show the ":text"), "gijirokucloudさんがテスト会議会議を作成しました。"
    send %(hide the ":text"), "終了会議会議が終了しました。"
    send %(screenshot :name), 'after-search-meeting-name-whats-new'
  end

  step %(is displayed result of the search in meething date the whats'new) do
    send %(wait_js)
    send %(show the ":text"), "gijirokucloudさんが開催予定会議2会議を作成しました。"
    send %(hide the ":text"), "終了会議会議が終了しました。"
    send %(screenshot :name), 'after-search-meeting-date-whats-new'
  end

  step %(is displayed result of the search in meething kind the whats'new) do
    send %(wait_js)
    send %(show the ":text"), "終了会議会議が終了しました。"
    send %(hide the ":text"), "gijirokucloudさんが開催予定会議2会議を作成しました。"
    send %(screenshot :name), 'after-search-meeting-kind-whats-new'
  end

end
