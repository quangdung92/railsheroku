# encoding: utf-8

@account
Feature: Account Feature

  Background:
    Given login with the normal

  @javascript
  Scenario: visit the account
    When click a button of login user name
    Then visit the account

  @javascript
  Scenario: visit the account edit 
    When click a button of login user name
    And click a button of edit
    Then show account edit 

  @javascript
  Scenario: cancel edit
    When click a button of login user name
    And click a button of edit
    And click a button of cancel 
    Then moved to the 'accounts'

  @javascript
  Scenario: edit the user
    When click a button of login user name
    And click a button of edit
    And edit a user of the information 
    And click a button of update 
    Then moved to the 'accounts'
