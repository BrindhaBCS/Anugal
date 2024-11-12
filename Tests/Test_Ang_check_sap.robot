*** Settings ***
Resource    ../Tests/Resource/Ang_check_sap.robot
Suite Setup    Ang_check_sap.Start TestCase
Suite Teardown    Ang_check_sap.Finish TestCase
Test Tags    sap_login

*** Test Cases ***


Submit Anugal username and password
    Submit Anugal username and password

SAP_login_EAM_lunchpad
    SAP_login_EAM_lunchpad