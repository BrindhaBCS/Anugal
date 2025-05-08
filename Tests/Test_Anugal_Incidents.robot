*** Settings ***
Resource    ../Tests/Resources/Anugal_Incidents.robot
Suite Setup    Anugal_Incidents.System_login
Suite Teardown    Anugal_Incidents.System_Logout
Test Tags    Incidents

*** Test Cases ***
Incidents
    Incidents
    Priority