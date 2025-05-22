*** Settings ***
Resource    ../Tests/Resource/My_teams.robot
Suite Setup    My_teams.Start TestCase
Suite Teardown    My_teams.Finish TestCase
Test Tags    navigate_myteams

*** Test Cases ***
navigate_my_teams
    navigate_my_teams
