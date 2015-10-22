# encoding: utf-8

@login
Feature: test the login
visit login. success login. fail login. first login

  Scenario: visit the login
    When visit the login
    Then show selector the 'user_login_id' 
    And show selector the 'user_password' 
    And show selector the 'submit' 

  Scenario: success login
    When login with the "administrator"
    Then moved to the 'home'

  Scenario: fail login
    Given visit the login
    When input id 'aaa' and password 'aaa'
    And click login button
    Then show error message

  Scenario: first login
    Given visit the login
    When input id 'firstlogin' and password 'firstlogin'
    And click login button
    Then moved to the 'firstlogin'
