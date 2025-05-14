*** Settings ***
Resource    ../Tests/Resource/anugul_configurations.robot
Suite Setup    anugul_configurations.System_login
Suite Teardown   anugul_configurations.system_Logout
Task Tags    configuration


*** Test Cases ***
configurations
    Alerts
    search option
    view option
    edit option
    delete option
    

