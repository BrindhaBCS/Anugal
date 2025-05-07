*** Settings ***
Resource    ../Tests/Resources/Single_Owner_Multiple_Role_approved.robot
Suite Setup    Single_Owner_Multiple_Role_approved.Start TestCase
Suite Teardown    Single_Owner_Multiple_Role_approved.Finish TestCase
Test Tags    approved_Singleownermultiplerole

*** Test Cases ***
Single_Owner_Multiple_Role_approved
    Single_Owner_Multiple_Role_approved