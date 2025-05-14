*** Settings ***
Resource    ../Tests/Resource/multiple_owner_singlerole.robot
Suite Setup    multiple_owner_singlerole.Start TestCase
Suite Teardown    multiple_owner_singlerole.Finish TestCase
Test Tags    Request_multipleowner_singlerole

*** Test Cases ***
multiple role with single role
    multiple role with single role