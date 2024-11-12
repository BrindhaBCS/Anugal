*** Settings ***
Resource    ../Tests/Resource/Ang_user_creation.robot
Suite Setup    Ang_user_creation.Start TestCase
Suite Teardown    Ang_user_creation.Finish TestCase
Test Tags    user_creation

*** Test Cases ***


Submit Anugal username and password
    Submit Anugal username and password

User_creation_step
    User_creation_step

Request Status
    Request Status

 