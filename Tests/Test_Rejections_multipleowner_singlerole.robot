*** Settings ***
Resource    ../Tests/Resources/Rejections_multipleowner_singlerole.robot
Suite Setup    Rejections_multipleowner_singlerole.Start TestCase
Suite Teardown    Rejections_multipleowner_singlerole.Finish TestCase
Test Tags    Request_rejectionmultipleownersinglerole

*** Test Cases ***
Rejections multipleowner and singlerole
    Rejections multipleowner and singlerole