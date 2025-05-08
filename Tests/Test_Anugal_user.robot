*** Settings ***
Resource    ../Tests/Resources/Anugal_user.robot
Suite Setup    Anugal_User.System_login
Suite Teardown    Anugal_User.System_Logout
Test Tags    user

*** Test Cases ***
User
    User