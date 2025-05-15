*** Settings ***
Resource    ../Tests/Resource/Rejected_singleowner_singlerole.robot
Suite Setup    Rejected_singleowner_singlerole.Start TestCase
Suite Teardown    Rejected_singleowner_singlerole.Finish TestCase
Test Tags    Reject_singleownersinglerole

*** Test Cases ***
Rejected single owner single role
    Rejected single owner single role