*** Settings ***
Resource    ../Tests/Resources/Single_Owner_Multiple_Role.robot
Suite Setup    Single_Owner_Multiple_Role.Start TestCase
Suite Teardown    Single_Owner_Multiple_Role.Finish TestCase
Test Tags    Request_Singleownermultiplerole

*** Test Cases ***
single owner multiple role
    single owner multiple role