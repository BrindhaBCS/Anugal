*** Settings ***
Resource    ../Tests/Resources/Delegate_Approval_to_Another_Approver_approved.robot
Suite Setup    Delegate_Approval_to_Another_Approver_approved.Start TestCase
Suite Teardown    Delegate_Approval_to_Another_Approver_approved.Finish TestCase
Test Tags    Approved_DeleteApprovaltoAnotherApprover

*** Test Cases ***
Approved multiple owner multiplerole role
    Approved multiple owner multiplerole role
    