*** Settings ***
Resource    ../Tests/Resource/Revoke_Delegation_Before_Expiry.robot
Suite Setup    Revoke_Delegation_Before_Expiry.Start TestCase
Suite Teardown    Revoke_Delegation_Before_Expiry.Finish TestCase
Test Tags    Revoke_delegation

*** Test Cases ***
create a delegation
    create a delegation
    Revoke Delegation