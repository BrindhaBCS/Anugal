*** Settings ***
Resource    ../Tests/Resource/Rejection_of_One_Role_and_Approval_of_Others.robot
Suite Setup    Rejection_of_One_Role_and_Approval_of_Others.Start TestCase
Suite Teardown    Rejection_of_One_Role_and_Approval_of_Others.Finish TestCase
Test Tags    Rejection_OneRole_ApprovalOthers

*** Test Cases ***
Rejection_of_One_Role_and_Approval_of_Others
    Rejection_of_One_Role_and_Approval_of_Others