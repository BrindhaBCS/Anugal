*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Library    String
Library    Anugal_library.py

*** Variables ***
${Env}    DEV Symphony
${App}    Symphony


*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
Submit Anugal username and password
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${angvar('user_id')}
    SeleniumLibrary.Input password    id:password    ${angvar('password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    20
    
    Wait Until Element Is Visible    xpath:(//button[@type='button']//img)[1]    60s

User_creation
    SeleniumLibrary.Click Element    xpath:(//button[@type='button']//img)[1]
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='Access Request']    60s 
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='Access Request']
    Wait Until Element Is Visible    id:mui-component-select-selectedDepartment    60s
    SeleniumLibrary.Click Element    id:mui-component-select-selectedDepartment  
    Sleep    2
    SeleniumLibrary.Click Element    xpath://li[@data-value='Testing']
    Sleep    1
    SeleniumLibrary.Input Text    id:addRolesSearch    Malay
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='${App}']    60s    
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='${App}']
    Sleep    2
    Wait Until Element Is Visible    xpath://p[normalize-space(text())='${Env}']    60s
    SeleniumLibrary.Click Element    xpath://p[normalize-space(text())='${Env}']
    Sleep    5
    SeleniumLibrary.Click Element    xpath://img[@alt='toggleIcon']
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1


    Clear Element Text    (//input[@type='date'])[1]
    Sleep    1
    Clear Element Text    (//input[@type='date'])[2]
    Sleep    1

    ${valid_from}=    Get Current Date    result_format=%d-%m-%Y
    
    ${valid_to}=    Get Current Date    result_format=%d-%m-%Y    increment=1 day
    
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[1]    ${valid_from}
    Sleep    1
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[2]    ${valid_to}
    Sleep    1
    SeleniumLibrary.Click Element    xpath://div[@role='combobox']
    Sleep    1
    SeleniumLibrary.Click Element    xpath://li[normalize-space(text())='Assign']
    Sleep    2


    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    SeleniumLibrary.Input Text    xpath://textarea[@placeholder='Leave your comments']    For Testing
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Submit']
    Sleep    4
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//p[1]    60s
    Capture Page Screenshot
    Sleep    2

    ${Access_request}    Get Text    xpath://div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//p[1]
    Log    ${Access_request}
    Sleep    2
    ${request_id}    Anugal_library.Extract Order Number    ${Access_request}
    Log    ${request_id}
    Log To Console    **gbStart**Copilot_Request_id**splitKeyValue**${request_id}**gbEnd**

    Set Global Variable    ${request_id}


    SeleniumLibrary.Click Element    xpath://div[@data-testid='close-button']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://button[contains(.,'Status')]    60s  
    Sleep    2  

Request Status
    SeleniumLibrary.Click Element    xpath://button[contains(.,'Status')]
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//button[@type='button'][normalize-space()='View'])[1]
    Sleep    5
    SeleniumLibrary.Input Text    xpath:(//input[@id='search'])[2]    ${request_id}    



    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='View']
    Sleep    3
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='${App}']
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Status']
    Sleep    2
    ${Req_status}    Get Text    xpath:(//h6[contains(@class,'MuiTypography-root MuiTypography-h3')])[3]
    Log    ${Req_status}
    Log To Console    **gbStart**Copilot_Request_Status**splitKeyValue**${Req_status}**gbEnd**
    Capture Page Screenshot

Finish TestCase
    Close All Browsers 

