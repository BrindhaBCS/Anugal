*** Settings ***
Resource    ../Tests/Resource/Unlock_set.robot
Suite Setup    Unlock_set.Start TestCase
Suite Teardown    Unlock_set.Finish TestCase
Test Tags    sap_unlock

*** Test Cases ***
unlock_SAP
    unlock_SAP