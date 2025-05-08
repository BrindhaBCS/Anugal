*** Settings ***
Resource    ../Tests/Resources/Single_owner_approval.robot
Suite Setup    Single_owner_approval.Start TestCase
Suite Teardown    Single_owner_approval.Finish TestCase
Test Tags    Request_Single_owner

*** Test Cases ***
create_Access_Request
    create_Access_Request