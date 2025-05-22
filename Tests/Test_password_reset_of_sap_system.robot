*** Settings ***
Resource    ../Tests/Resources/password_reset_of_sap_system.robot
Suite Setup    password_reset_of_sap_system.Start TestCase
Suite Teardown    password_reset_of_sap_system.Finish TestCase
Test Tags    ressetpassword

*** Test Cases ***
Reset_sap_password
    Reset_sap_password
   