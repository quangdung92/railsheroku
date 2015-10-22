# encoding: utf-8

@firstlogin
Feature: test the firstlogin
visit firstlogin. success firstlogin. fail firstlogin password not match. fail firstlogin password not input.cancel

  Background:
    Given visit the login
    When input id 'firstlogin' and password 'firstlogin'
    And click login button

  Scenario: visit the firstlogin
    Then show selector the 'user_login_id' 
    And show selector the 'user_password' 
    And show selector the 'user_password_confirmation' 
    And show selector the 'submit' 
    And show selector the 'cancel' 

  Scenario: success firstlogin
    When input new_password 'newpass' and confirm_password 'newpass'
    And click regist button
    Then moved to the 'home'

  Scenario: fail firstlogin password not match
    When input new_password 'newpass' and confirm_password 'naaaaaaa'
    And click regist button
    Then show password not match error message

  Scenario: fail firstlogin password not input
    When input new_password '' and confirm_password 'naaaaaaa'
    Then show password not match error message

  Scenario: fail firstlogin confirm password not input
    When input new_password 'newpass' and confirm_password ''
    Then show password not match error message

  Scenario: cancel
    When click the link of 'キャンセル' 
    Then moved to the 'login'
