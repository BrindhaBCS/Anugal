*** Settings ***
Resource    ../Tests/Resources/Anugal_Request.robot
Suite Setup    Anugal_Request.System_login
Suite Teardown    Anugal_Request.System_Logout
Test Tags    Request_a

*** Test Cases ***
Request
    Request