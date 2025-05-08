*** Settings ***
Resource    ../Tests/Resources/Anugal_Display_Dashboard.robot
Suite Setup    Anugal_Display_Dashboard.System_login
Suite Teardown    Anugal_Display_Dashboard.System_Logout
Test Tags    Display_Dashboard

*** Test Cases ***
Display_Dashboard
    Display_Dashboard
    
Incidents
    Incidents
Alerts
    Alerts
    Prioritys
job
    job
Workflow
    Workflow
Connection_Health
    Connection_Health
