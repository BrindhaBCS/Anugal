*** Settings ***
Resource    ../Tests/Resources/clubcracker.robot
Suite Setup    clubcracker.Start TestCase
Suite Teardown    clubcracker.Finish TestCase
Test Tags    clubcracker

*** Test Cases ***


HomePage_menu_image_loading
    HomePage_menu_image_loading