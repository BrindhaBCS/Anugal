*** Settings ***
Resource    ../Tests/Resources/Add_Delegation_singleuser.robot
Suite Setup    Add_Delegation_singleuser.Start TestCase
Suite Teardown    Add_Delegation_singleuser.Finish TestCase
Test Tags    single_add_delegation

*** Test Cases ***
add delegation for single user
    add delegation for single user