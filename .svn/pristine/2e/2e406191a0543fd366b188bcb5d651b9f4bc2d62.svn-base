# encoding: utf-8

@admin
Feature: Admin Feature

  Background:

  Scenario: show the admin screen. also show the link menu of each master screen.
    Given login with the administrator
    When visit the admin
    Then show the a of "ユーザ"
    And show the a of "会議種別"
    And show the a of "サイボウズ"
    And show the a of "ホーム画面へ"

  Scenario: click on the link of the home screen, you can moved to the home screen. 
    Given login with the administrator
    And visit the admin
    When click the a of "ホーム画面へ"
    Then moved to the "home"

  Scenario: click on the link of the user screen, you can moved to the user screen. 
    Given login with the administrator
    And visit the admin
    When click the a of "ユーザ"
    Then moved to the "admin/users"

  Scenario: click on the link of the kind screen, you can moved to the kind screen. 
    Given login with the administrator
    And visit the admin
    When click the a of "会議種別"
    Then moved to the "admin/kinds"

  Scenario: click on the link of the cybozu screen, you can moved to the cybozu screen. 
    Given login with the administrator
    And visit the admin
    When click the a of "サイボウズ"
    Then moved to the "admin/cybozu"

