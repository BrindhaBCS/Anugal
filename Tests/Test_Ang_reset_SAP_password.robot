*** Settings ***
Resource    ../Tests/Resource/Ang_reset_SAP_password.robot
Suite Setup    Ang_reset_SAP_password.Start TestCase
Suite Teardown    Ang_reset_SAP_password.Finish TestCase
Test Tags    sap_reset

*** Test Cases ***


Submit Anugal username and password
    Submit Anugal username and password

Anugal_password_reset
    Anugal_password_reset

SAP_LOGIN
    SAP_LOGIN

New password Generate
    New password Generate