*** Settings ***
Resource    ../Tests/Resources/multiplerole_multipleowner_approved_roleA.robot
Suite Setup    multiplerole_multipleowner_approved_roleA.Start TestCase
Suite Teardown    multiplerole_multipleowner_approved_roleA.Finish TestCase
Test Tags    approved_roleA

*** Test Cases ***
Approved multiple owner multiplerole role
    Approved multiple owner multiplerole role