*** Settings ***
Resource    ../Tests/Resource/Mirror_Access.robot
Suite Setup    Mirror_Access.Start TestCase
Suite Teardown    Mirror_Access.Finish TestCase
Test Tags    mirroraccess

*** Test Cases ***
Mirror_Access
    Mirror_Access

