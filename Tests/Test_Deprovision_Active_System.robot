*** Settings ***
Resource    ../Tests/Resource/Deprovision_Active_System.robot
Suite Setup    Deprovision_Active_System.Start TestCase
Suite Teardown    Deprovision_Active_System.Finish TestCase
Test Tags    Deprovision

*** Test Cases ***
Deprovision_active_system
    Deprovision_active_system
    