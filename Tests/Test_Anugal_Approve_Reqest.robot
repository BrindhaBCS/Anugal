*** Settings ***
Resource    ../Tests/Resources/Anugal_Emergency_Access_Rquest.robot
Suite Setup    Anugal_Emergency_Access_Rquest.System_login
Suite Teardown    Anugal_Emergency_Access_Rquest.System_Logout
Test Tags    Request_EAM

*** Test Cases ***
MyAccess_request
    MyAccess_request