*** Settings ***
Resource    ../Tests/Resources/multiplerole_multipleowner_approved_roleB.robot
Suite Setup    multiplerole_multipleowner_approved_roleB.Start TestCase
Suite Teardown    multiplerole_multipleowner_approved_roleB.Finish TestCase
Test Tags    approved_roleB

*** Test Cases ***
Approved multiple owner multiplerole role
    Approved multiple owner multiplerole role