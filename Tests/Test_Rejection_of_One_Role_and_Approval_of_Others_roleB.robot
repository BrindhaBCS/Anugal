*** Settings ***
Resource    ../Tests/Resources/Rejection_of_One_Role_and_Approval_of_Others_roleB.robot
Suite Setup    Rejection_of_One_Role_and_Approval_of_Others_roleB.Start TestCase
Suite Teardown    Rejection_of_One_Role_and_Approval_of_Others_roleB.Finish TestCase
Test Tags    RoleB_OneRoleApprovalOthers

*** Test Cases ***
Rejection_of_One_Role_and_Approval_of_Others_roleB
    Rejection_of_One_Role_and_Approval_of_Others_roleB