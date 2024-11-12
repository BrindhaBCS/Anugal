*** Settings ***
Resource    ../Tests/Resource/Ang_Emergency_Access_Request.robot
Suite Setup    Ang_Emergency_Access_Request.Start TestCase
Suite Teardown    Ang_Emergency_Access_Request.Finish TestCase
Test Tags    Emergency_Access

*** Test Cases ***


Submit Anugal username and password
    Submit Anugal username and password

Emergency Access Request for Firefighter Onboarding
    Emergency Access Request for Firefighter Onboarding

Emergency Access Request
    Emergency Access Request