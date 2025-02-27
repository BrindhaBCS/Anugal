*** Settings ***
Resource    ../Tests/Resource/Add_Delegation_multipleusermultiroles.robot
Suite Setup    Add_Delegation_multipleusermultiroles.Start TestCase
Suite Teardown    Add_Delegation_multipleusermultiroles.Finish TestCase
Test Tags    multipleuser_multiplerole_delegation

*** Test Cases ***
add delegation for multiple user multiple roles
    add delegation for multiple user multiple roles