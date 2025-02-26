*** Settings ***
Resource    ../Tests/Resources/Add_Delegation_multipleuser.robot
Suite Setup    Add_Delegation_multipleuser.Start TestCase
Suite Teardown    Add_Delegation_multipleuser.Finish TestCase
Test Tags    multiple_add_delegation

*** Test Cases ***
add delegation for multiple user
    add delegation for multiple user