*** Settings ***
Resource    ../Tests/Resources/Anugal_Workflow.robot
Suite Setup    Anugal_Workflow.System_login
Suite Teardown    Anugal_Workflow.System_Logout
Test Tags    workflow

*** Test Cases ***
work_flow
    work_flow
    