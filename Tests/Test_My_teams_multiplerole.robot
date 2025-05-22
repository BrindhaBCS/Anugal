*** Settings ***
Resource    ../Tests/Resource/My_teams_multiplerole.robot
Suite Setup    My_teams_multiplerole.Start TestCase
Suite Teardown    My_teams_multiplerole.Finish TestCase
Test Tags    multipleroles_myteams

*** Test Cases ***
multiple roles in team
    multiple roles in team