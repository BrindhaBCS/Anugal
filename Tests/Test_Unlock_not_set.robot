*** Settings ***
Resource    ../Tests/Resources/Unlock_not_set.robot
Suite Setup    Unlock_not_set.Start TestCase
Suite Teardown    Unlock_not_set.Finish TestCase
Test Tags    sap_notset

*** Test Cases ***
unlock_SAP_not_set
    unlock_SAP_not_set