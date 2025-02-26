*** Settings ***
Resource    ../Tests/Resources/Delete_Add_Delegation_multipleuser.robot
Suite Setup    Delete_Add_Delegation_multipleuser.Start TestCase
Suite Teardown    Delete_Add_Delegation_multipleuser.Finish TestCase
Test Tags    Delete_multiple_add_delegation

*** Test Cases ***
Delete_add delegation for multiple user
    Delete_add delegation for multiple user