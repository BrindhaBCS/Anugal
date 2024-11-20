*** Settings ***
Resource    ../Tests/Resources/Ang_Password_reset.robot
Suite Setup    Ang_Password_reset.Start TestCase
Suite Teardown    Ang_Password_reset.Finish TestCase
Test Tags    sap_reset

*** Test Cases ***


Submit Anugal username and password
    Submit Anugal username and password

Anugal_password_reset
    Anugal_password_reset


New password Generate
    New password Generate