*** Settings ***
Resource    ../Tests/Resources/password_reset_of_sap_system_expaired.robot
Suite Setup    password_reset_of_sap_system_expaired.Start TestCase
Suite Teardown    password_reset_of_sap_system_expaired.Finish TestCase
Test Tags    expaired_ressetpassword

*** Test Cases ***
expaied_Reset_sap_password
    expaied_Reset_sap_password