*** Settings ***
Resource    ../Tests/Resource/Ang_provisioning_status.robot
# Suite Setup    Ang_provisioning_status.Start TestCase
# Suite Teardown    Ang_provisioning_status.Finish TestCase
Test Tags    check_provisioning

*** Test Cases ***
Start TestCase
    Start TestCase

Submit Anugal username and password
    Submit Anugal username and password

provisioning_status
    provisioning_status

Finish TestCase
    Close All Browsers