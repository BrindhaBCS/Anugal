*** Settings ***
Resource    ../Tests/Resource/Delete_Add_Delegation_multipleusermultiroles.robot
Suite Setup    Delete_Add_Delegation_multipleusermultiroles.Start TestCase
Suite Teardown    Delete_Add_Delegation_multipleusermultiroles.Finish TestCase
Test Tags    Delete_multipleusers_and_roles

*** Test Cases ***
Delete_add delegation for multiple user multiple roles
    Delete_add delegation for multiple user multiple roles