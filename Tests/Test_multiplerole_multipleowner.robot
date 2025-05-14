*** Settings ***
Resource    ../Tests/Resource/multiplerole_multipleowner.robot
Suite Setup    multiplerole_multipleowner.Start TestCase
Suite Teardown    multiplerole_multipleowner.Finish TestCase
Test Tags    Request_multiplerole_multipleowner

*** Test Cases ***
multiple role with multiple owner
    multiple role with multiple owner