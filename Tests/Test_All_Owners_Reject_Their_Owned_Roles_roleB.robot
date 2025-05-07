*** Settings ***
Resource    ../Tests/Resources/All_Owners_Reject_Their_Owned_Roles_roleB.robot
Suite Setup    All_Owners_Reject_Their_Owned_Roles_roleB.Start TestCase
Suite Teardown    All_Owners_Reject_Their_Owned_Roles_roleB.Finish TestCase
Test Tags    Reject_roleB

*** Test Cases ***
Reject_roleB_All_Owners_Reject_Their_Owned_Roles
    Reject_roleB_All_Owners_Reject_Their_Owned_Roles