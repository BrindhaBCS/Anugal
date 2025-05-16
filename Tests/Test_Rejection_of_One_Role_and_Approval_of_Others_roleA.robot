*** Settings ***
Resource    ../Tests/Resource/Rejection_of_One_Role_and_Approval_of_Others_roleA.robot
Suite Setup    Rejection_of_One_Role_and_Approval_of_Others_roleA.Start TestCase
Suite Teardown    Rejection_of_One_Role_and_Approval_of_Others_roleA.Finish TestCase
Test Tags    RoleA_OneRoleApprovalOthers

*** Test Cases ***
Reject_roleA_All_Owners_Reject_Their_Owned_Roles
    Reject_roleA_All_Owners_Reject_Their_Owned_Roles