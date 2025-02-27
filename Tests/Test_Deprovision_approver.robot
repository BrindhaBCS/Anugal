*** Settings ***
Resource    ../Tests/Resource/Deprovision_approver.robot
Suite Setup    Deprovision_approver.Start TestCase
Suite Teardown    Deprovision_approver.Finish TestCase
Test Tags    Deprovision_approver

*** Test Cases ***
approver
    approver