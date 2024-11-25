*** Settings ***
Resource    ../Tests/Resources/Ang_approval.robot
Suite Setup    Ang_approval.Start TestCase
Suite Teardown    Ang_approval.Finish TestCase
Test Tags    Req_approve

*** Test Cases ***


Submit Anugal username and password
    Submit Anugal username and password

Approval_request
    Approval_request