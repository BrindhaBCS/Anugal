*** Settings ***
Resource    ../Tests/Resources/Anugal_Alerts.robot
Suite Setup    Anugal_Alerts.System_login
Suite Teardown    Anugal_Alerts.System_Logout
Test Tags    Alerts

*** Test Cases ***
Alerts
    Alerts
    Priority