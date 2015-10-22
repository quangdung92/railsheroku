# encoding: utf-8

@user
Feature: User Feature

  Background:
    Given login with the administrator
    And visit the admin
    And click the a of user

  @javascript
  Scenario: show list
    Then Row of the table is 20

  @javascript
  Scenario: visit the naxt page
    When next list
    Then Row of the table is 4

  @javascript
  Scenario: create a new user
    Given click a button of create
    When enter a new user of the information
    And click a button of regist
    Then moved to the 'admin/users/25'

  @javascript
  Scenario: edit the user
    Given click the edit button in the second row
    When edit a user of the information
    And click a button of edit
    Then moved to the 'admin/users/2'

  @javascript
  Scenario: show the user
    When click the show button in the second row
    Then show a user of the information

  @javascript
  Scenario: disable the user
    Given click the edit button in the second row
    When check the disable
    And click a button of edit
    And click the a of user
    Then disabled to the user of second row
