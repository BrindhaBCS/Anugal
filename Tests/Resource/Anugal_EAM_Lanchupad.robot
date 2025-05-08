*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
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

EAM_Launchpad
    Click Element    xpath://span[normalize-space()='My Apps']
    Sleep    5
    ${filter}    Run Keyword And Return Status     element should be visible    xpath://div[normalize-space(text())='EAM Launchpad']
    IF  ${filter} == True  
    Click Element    xpath://div[normalize-space(text())='EAM Launchpad']
    Log_In
    ELSE    
    Log To Console    EAM_Launchpad not Found
    END
Log_In
    Click Element    xpath://button[normalize-space(text())='Log In']
    Sleep    2
    Click Element    id:mui-component-select-reasonCode
    Sleep    2
    Click Element    xpath://li[normalize-space()='G001']
    Sleep    2
    Input Text    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[3]    8989
    Sleep    2
    Input Text    xpath:(//p[contains(@class,'MuiTypography-root MuiTypography-body1')]//textarea)[1]   Runexecution
    Sleep    2
    Input Text    xpath:(//p[contains(@class,'MuiTypography-root MuiTypography-body1')]//textarea)[3]    comment
    Sleep    2
    Click Button    xpath://button[contains(@class, 'MuiButton-containedPrimary') and contains(@class, 'MuiButton-sizeMedium')]
    Sleep    4
    Anugal_library.Press Keys    TAB
    Sleep    2
    Anugal_library.Press Keys    TAB
    Sleep    2
    Anugal_library.Press Keys    ENTER    
    Sleep    2
    ${Second_Login}    Run Keyword And Return Status     element should be visible    xpath://button[contains(@class, 'MuiButton-containedPrimary') and contains(@class, 'MuiButton-sizeMedium')]
    IF  ${Second_Login} == True  
    Click Element    xpath://button[contains(@class, 'MuiButton-containedPrimary') and contains(@class, 'MuiButton-sizeMedium')]
    Second_Login
    ELSE    
    Log To Console    Second Login not Found
    END
Second_Login
    Anugal_library.Press Keys    TAB
    Sleep    2
    Anugal_library.Press Keys    ENTER
    Sleep    2
    Anugal_library.Press Keys    TAB
    Sleep    2
    Anugal_library.Press Keys    ENTER
    Sleep    10     
