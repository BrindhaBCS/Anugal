*** Settings ***
Resource    ../Tests/Resources/multiple_owner_singlerole_approved.robot
Suite Setup    multiple_owner_singlerole_approved.Start TestCase
Suite Teardown    multiple_owner_singlerole_approved.Finish TestCase
Test Tags    approved_multipleowner_singlerole

*** Test Cases ***
Approved multiple owner single role
    Approved multiple owner single role