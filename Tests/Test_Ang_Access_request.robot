*** Settings ***
Resource    ../Tests/Resource/Ang_Access_request.robot
Suite Setup    Ang_Access_request.Start TestCase
Suite Teardown    Ang_Access_request.Finish TestCase
Test Tags    user_creation

*** Test Cases ***


Submit Anugal username and password
    Submit Anugal username and password

User_creation
    User_creation

Request Status
    Request Status

 