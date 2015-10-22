# encoding: utf-8

@home
Feature: Home Feature

  Background:

  Scenario: show the information to the related to me
    When login with the normal
    Then show the "あなたの未解決A/I"
    And show the "参加会議の未解決A/I"
    And show the "終了会議議事録"
    And show the "開催予定会議"
    And show the "What's New"
    And show the a of "会議の登録"
    And show the a of "ログアウト"
    And show the fieldset of "会議検索"
    And show the header of "現在あなたのA/Iはありません"

  Scenario: to display the achievement rate.
    Given create data
    When login with the administrator
    Then show the header of "あなたのA/I達成率は"

  Scenario: if the log in with the administrator to show the setting button.
    When login with the administrator
    Then show the a of "管理設定"

  Scenario: if the log in with the normal user to hide the setting button.
    When login with the normal
    Then hide the button of "管理設定"

  @javascript
  Scenario: I displays the message if the ended meeting data exist.
    Given ended meeting data exist
    When login with the normal
    Then show the ended meeting data

  @javascript
  Scenario: no displays the message if the ended meeting data not exist.
    Given ended meeting data not exist
    When login with the normal
    Then hide the ended meeting data

  @javascript
  Scenario: I displays the message if the scheduled meeting data exist.
    Given scheduled meeting data exist
    When login with the normal
    Then show the scheduled meeting data

  @javascript
  Scenario: no displays the message if the scheduled meeting data not exist.
    Given scheduled meeting data not exist
    When login with the normal
    Then hide the scheduled meeting data

  @javascript
  Scenario: I displays the message if the unresolved ai data of me to exist.
    Given exist the unresolved ai data of me
    When login with the normal
    Then show the unresolved ai data of me

  @javascript
  Scenario: no displays the message if the unresolved ai data of me to not exist.
    Given not exist the unresolved ai data of me
    When login with the normal
    Then hide the unresolved ai data of me

  @javascript
  Scenario: I displays the message if the unresolved ai data of meeting to exist.
    Given exist the unresolved ai data of meeting
    When login with the normal
    Then show the unresolved ai data of meeting

  @javascript
  Scenario: no displays the message if the unresolved ai data of meeting to not exist.
    Given not exist the unresolved ai data of meeting
    When login with the normal
    Then hide the unresolved ai data of meeting

  @javascript
  @whats_new
  Scenario: I displays the message if the what's new data exist.
    Given create whats new list data
    When login with the normal
    Then show the whats new data
    And show the "gijirokucloudさんがテスト会議会議を作成しました。"
    And show the "gijirokucloudさんがテスト会議会議を編集しました。"
    And show the "終了会議会議が終了しました。"
    And show the "中止会議会議は中止になりました。"
    And show the "開催予定会議1会議の開催予定日です。"
    And show the "gijirokucloudさんがテスト会議議事録にコメントしました。"
    And show the "テスト会議議事録の本日対応AIA/I対応予定日です。"
    And show the "もうすぐテスト会議議事録の翌日対応AIA/I対応予定日です。"
    And show the "gijirokucloudさんが完了AIA/Iを完了しました。"

  @javascript
  @whats_new
  Scenario: no displays the message if the what's new data not exist.
    When login with the normal
    Then hide the whats new data

  @javascript
  @whats_new_search
  Scenario: I want to search for a meeting what's new list from the meeting name.
    Given create whats new list data
    When login with the normal
    And input to "テスト" meeting name
    Then is displayed result of the search in meething name the whats'new

  @javascript
  @whats_new_search
  Scenario: I want to search for a meeting what's new list from the meeting date.
    Given create whats new list data
    When login with the normal
    And input 1_after_day to meeting date
    Then is displayed result of the search in meething date the whats'new

  @javascript
  @whats_new_search
  Scenario: I want to search for a meeting what's new list from the meeting kind.
    Given create whats new list data
    When login with the normal
    And select to meeting kind whats new
    Then is displayed result of the search in meething kind the whats'new

  @javascript
  Scenario: I want to search for a meeting from the meeting name.
    Given create search data
    When login with the normal
    And input to meeting name
    Then only data that matches the meeting name is displyed

  @javascript
  Scenario: I want to search for a meeting from the meeting date.
    Given create search data
    When login with the normal
    And input to meeting date
    Then only data that matches the meeting date is displyed

  @javascript
  Scenario: I want to search for a meeting from the meeting kind.
    Given create search data
    When login with the normal
    And select to meeting kind
    Then only data that matches the meeting kind is displyed

