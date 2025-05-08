*** Settings ***
Library     SeleniumLibrary
Resource    ../Web/Support_Web.robot
 
*** Variables ***
${browser}    chrome
${url}    https://dev.anugalid.com/login
${Mail_id}    dhanasekaran.g@businesscoresolutions.com
${Mail_password}    Dhanag@2k00
${TEXT_TO_CHECK_Role_Level}    choose what to share with dev anugalid.com


*** Keywords *** 
System_login
    Log    Opening browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    5 
    Click Element    xpath://span[normalize-space(text())='Azure']
    Sleep    10 
    Input Text   xpath://*[@id="i0116"]    ${Mail_id}
    Sleep    2
    Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    Input Text    xpath://*[@id="i0118"]    ${Mail_password}
    Sleep    2
    # Input Text    id:emailId    dhanasekaran.g@basiscloudsolutions.com
    # Sleep    2 Dhanag@2k00
    # Input Text    id:password    bA6s5uGM
    # Sleep    2
    # Click Element    xpath://button[normalize-space(text())='Login']
    # Sleep    2
    Click Element    xpath://*[@id="idSIButton9"]
    Sleep    15
    Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    15
    Execute JavaScript    document.body.style.zoom="50%"


System_Logout
    Close Browser
    
Request
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Click Element    xpath://div[normalize-space(text())='Admin Reporting']
    Sleep    5
    Click Element    xpath://p[normalize-space(text())='Create a new filter set']
    Sleep    5
    Click Element    xpath://button[contains(.,'New Conditions')]
    Sleep    2
    Click Element    xpath:(//div[contains(@class,'MuiSelect-select MuiSelect-outlined')])[2]
    Sleep    3
    Click Element    xpath://li[@data-value='status']
    Sleep    2
    Click Element    xpath:(//div[contains(@class,'MuiSelect-select MuiSelect-outlined')])[3]
    Sleep    2
    Click Element    xpath://li[normalize-space(text())='Is']
    Sleep    3
    Click Element    id:filterDropdownInput
    Sleep    2
    Click Element    xpath://li[normalize-space()='Approved']
    Sleep    5
    Click Element    xpath://p[normalize-space(text())='Execute']
    Sleep    5
    Click Element    xpath://button[contains(.,'User')]
    Sleep    4
    Click Element    xpath://button[contains(.,'Request')]
    Sleep    4
    Click Element    xpath://p[normalize-space(text())='Create a new filter set']
    Sleep    5
    Click Element    xpath://button[contains(.,'New Conditions')]
    Sleep    2
    Click Element    xpath:(//div[contains(@class,'MuiSelect-select MuiSelect-outlined')])[2]
    Sleep    3
    Click Element    xpath://li[normalize-space()='Department']
    Sleep    2
    Click Element    xpath:(//div[contains(@class,'MuiSelect-select MuiSelect-outlined')])[3]
    Sleep    2
    Click Element    xpath://li[normalize-space(text())='Is']
    Sleep    3
    Click Element    id:filterDropdownInput
    Sleep    2
    Click Element    xpath://li[normalize-space()='Testing']
    Sleep    5
    Click Element    xpath://p[normalize-space(text())='Execute']
    Sleep    5