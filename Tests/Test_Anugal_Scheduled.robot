*** Settings ***
Resource    ../Tests/Resources/Anugal_Scheduled.robot
Suite Setup    Anugal_Scheduled.System_login
Suite Teardown    Anugal_Scheduled.System_Logout
Test Tags    Scheduled

*** Test Cases ***
Scheduled
    Scheduled