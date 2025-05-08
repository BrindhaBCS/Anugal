*** Settings ***
Resource    ../Tests/Resources/Anugal_FFID Status .robot
Suite Setup    Anugal_FFID Status .System_login
Suite Teardown    Anugal_FFID Status .System_Logout
Test Tags    FFID_Status

*** Test Cases ***
FFID_Status
    FFID_Status
    