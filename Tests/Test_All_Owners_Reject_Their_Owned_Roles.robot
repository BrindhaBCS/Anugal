*** Settings ***
Resource    ../Tests/Resources/All_Owners_Reject_Their_Owned_Roles.robot
Suite Setup    All_Owners_Reject_Their_Owned_Roles.Start TestCase
Suite Teardown    All_Owners_Reject_Their_Owned_Roles.Finish TestCase
Test Tags    AllOwnersRejectTheirOwnedRoles

*** Test Cases ***
All Owners Reject Their Owned Roles
    All Owners Reject Their Owned Roles