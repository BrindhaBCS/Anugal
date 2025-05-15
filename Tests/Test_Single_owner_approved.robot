*** Settings ***
Resource    ../Tests/Resource/Single_owner_approved.robot
Suite Setup    Single_owner_approved.Start TestCase
Suite Teardown    Single_owner_approved.Finish TestCase
Test Tags    approved_Single_owner

*** Test Cases ***
Approved_single_owner
    Approved_single_owner