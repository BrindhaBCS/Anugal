*** Settings ***
Resource    ../Tests/Resources/Anugal_Connection_ Health.robot
Suite Setup    Anugal_Connection_ Health.System_login
Suite Teardown    Anugal_Connection_ Health.System_Logout
Test Tags    Connection_health

*** Test Cases ***
Connection_health   
    Connection_health
    