*** Settings ***
Resource    ../Tests/Resource/Rejections_singleowner_singlerole.robot
Suite Setup    Rejections_singleowner_singlerole.Start TestCase
Suite Teardown    Rejections_singleowner_singlerole.Finish TestCase
Test Tags    Request_rejectionSingleownersinglerole

*** Test Cases ***
Rejections singleowner and singlerole
    Rejections singleowner and singlerole