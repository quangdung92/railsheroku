# encoding: utf-8

@kind
Feature: Kind Feature

  Background:
    Given login with the administrator
    And visit the admin
    And click the a of kind 

  @javascript
  Scenario: show list
    Then Row of the table is 20

  @javascript
  Scenario: visit the naxt page
    When next list
    Then Row of the table is 2

  @javascript
  Scenario: visit the prev page
    Given next list
    When prev list
    Then Row of the table is 20

  @javascript
  @create_user
  Scenario: create a new kind 
    Given click a button of create
    When enter a new kind of the information
    And click a button of regist
    Then moved to the 'admin/kinds/23'

  #@javascript
  #Scenario: edit the user
  #  Given click the edit button in the second row
  #  When edit a user of the information
  #  And click a button of edit
  #  Then moved to the 'admin/users/2'

  #@javascript
  #Scenario: show the user
  #  When click the show button in the second row
  #  Then show a user of the information

  #@javascript
  #Scenario: disable the user
  #  When click the disable button in the second row
  #  And click the ok button in the modal
  #  Then disabled to the disable button
