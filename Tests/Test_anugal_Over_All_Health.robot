*** Settings ***
Resource    ../Tests/Resources/Anugal_Over_all_health.robot
Suite Setup    Anugal_Over_all_health.System_login
Suite Teardown    anugal_Over_all_health.system_Logout
Test Tags    overallhealth

*** Test Cases ***
OverAll_Health
    OverAll_Health