*** Settings ***
Resource    ../Tests/Resource/All_Owners_Reject_Their_Owned_Roles_roleA.robot
Suite Setup    All_Owners_Reject_Their_Owned_Roles_roleA.Start TestCase
Suite Teardown    All_Owners_Reject_Their_Owned_Roles_roleA.Finish TestCase
Test Tags    Reject_roleA

*** Test Cases ***
Reject_roleA_All_Owners_Reject_Their_Owned_Roles
    Reject_roleA_All_Owners_Reject_Their_Owned_Roles