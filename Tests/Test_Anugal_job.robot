*** Settings ***
Resource    ../Tests/Resources/Anugal_Job.robot
Suite Setup    Anugal_Job.System_login
Suite Teardown    Anugal_Job.System_Logout
Test Tags    Job

*** Test Cases ***
Job
    Job