*** Settings ***
Resource    ../Tests/Resources/Rejected_multipleowner_singlerole.robot
Suite Setup    Rejected_multipleowner_singlerole.Start TestCase
Suite Teardown    Rejected_multipleowner_singlerole.Finish TestCase
Test Tags    Reject_multipleownersinglerole

*** Test Cases ***
Rejected multiple owner single role
    Rejected multiple owner single role