*** Settings ***
Resource    ../Tests/Resources/Anugal_EAM_Lanchupad.robot
Suite Setup    Anugal_EAM_Lanchupad.System_login
Suite Teardown    Anugal_EAM_Lanchupad.System_Logout
Test Tags    EAM

*** Test Cases ***
EAM_Launchpad
    EAM_Launchpad