*** Settings ***
Resource    ../Tests/Resources/Delete_Add_Delegation_singleuser.robot
Suite Setup    Delete_Add_Delegation_singleuser.Start TestCase
Suite Teardown    Delete_Add_Delegation_singleuser.Finish TestCase
Test Tags    Delete_single_add_delegation

*** Test Cases ***
Delete_add delegation for single user
    Delete_add delegation for single user