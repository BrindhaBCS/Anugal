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
    Execute JavaScript    document.body.style.zoom="66%"

System_Logout
    Close Browser

MyAccess_request
    Wait Until Element Is Visible    locator=(//button[@type='button'])    timeout=10s
    Click Element    xpath:(//button[@type='button'])[1]
    Sleep    5
    Click Element    xpath://div[normalize-space(text())='Emergency Access Request']
    Sleep    5
    Wait Until Element Is Visible    id:mui-component-select-selectedDepartment   timeout=10s
    Click Element    id:mui-component-select-selectedDepartment
    Wait Until Element Is Visible    locator=//li[@data-value='Testing']   timeout=10s
    Mouse Up    locator=//li[@data-value='Testing']
    Click Element    xpath://li[@data-value='Testing']
    Sleep    5
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    5
    Execute JavaScript    document.body.style.zoom="50%"
    SeleniumLibrary.Press Keys    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[2]    CTRL+a    BACKSPACE
    Sleep    5
    Input Text    (//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[2]    SAP GRC & Authorizations
    Sleep    5
    Wait Until Element Is Visible    locator=//p[normalize-space()='SAP GRC & Authorizations']    timeout=10s
    Click Element    xpath://p[normalize-space()='SAP GRC & Authorizations']
    Sleep    5
    Click Element    xpath://p[normalize-space()='SAP Application']
    Sleep    5
    Click Element    xpath://div[contains(text(),'SAP HANA')]
    Sleep    5
    Scroll Element Into View    locator=(//button[@type='button'])[21]    
    Wait Until Element Is Visible    locator=(//button[@type='button'])[21]   timeout=10s
    Click Button    xpath:(//button[@type='button'])[21]
    Sleep    5
    Scroll Element Into View    locator=(//button[@type='button'])[22]  
    Click Button    xpath:(//button[@type='button'])[22]
    Sleep    5
    Click Button    xpath:(//button[@type='button'])[20]
    Sleep    5
    Click Element    xpath://button[normalize-space()='Next']
    Sleep    3
    # SeleniumLibrary.Press Keys    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[2]    CTRL+a    BACKSPACE
    # Sleep    3
    # Input Text    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[2]    2025-04-28
    # Sleep    3
    # SeleniumLibrary.Press Keys    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[3]    CTRL+a    BACKSPACE
    # Sleep    3
    # Input Text    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[5]    2025-04-04
    # Sleep    3
    # SeleniumLibrary.Press Keys    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[4]    CTRL+a    BACKSPACE
    # Sleep    3
    # Input Text    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[5]    2025-04-028
    # Sleep    3
    SeleniumLibrary.Press Keys    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[5]    CTRL+a    BACKSPACE
    Sleep    3
    Input Text    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[5]    2025-04-280
    Sleep    3
    # SeleniumLibrary.Press Keys    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[6]    CTRL+a    BACKSPACE
    # Sleep    3
    # Input Text    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[5]    2025-06-06
    # Sleep    3
    # SeleniumLibrary.Press Keys    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[7]    CTRL+a    BACKSPACE
    # Sleep    3
    # Input Text    xpath:(//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')])[7]    2025-06-08 
    Sleep    4
    Click Element    xpath://button[normalize-space()='Next']
    Sleep    2
    Input Text    xpath://p[contains(@class,'MuiTypography-root MuiTypography-body1')]//textarea[1]    Approve
    Sleep    2
    Click Element    xpath://button[normalize-space()='Next']
    Sleep    2
    Click Element    xpath://button[normalize-space()='Submit']
    Sleep    10
    Click Element    xpath://*[name()='svg' and @data-testid='CancelRoundedIcon']
    Sleep    5
