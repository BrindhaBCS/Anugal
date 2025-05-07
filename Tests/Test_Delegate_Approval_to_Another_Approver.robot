*** Settings ***
Resource    ../Tests/Resources/Delegate_Approval_to_Another_Approver.robot
Suite Setup    Delegate_Approval_to_Another_Approver.Start TestCase
Suite Teardown    Delegate_Approval_to_Another_Approver.Finish TestCase
Test Tags    DeleteApprovaltoAnotherApprover

*** Test Cases ***
Delete Approval to Another Approver
    Delete Approval to Another Approver
    Raised a request