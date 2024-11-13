*** Settings ***
Library     SeleniumLibrary
Library    DateTime


*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
Submit Anugal username and password
    Wait until element is visible    ${angvar('user_text_box')}    60s
    # Sleep    10
    Input text    ${angvar('user_text_box')}        ${angvar('user_id')}
    Input password    ${angvar('password_text_box')}    ${angvar('password')}
    Click element    ${angvar('Login_anugal_button')}
    Maximize Browser Window
    # Sleep    20
    Wait Until Element Is Visible    xpath://img[@alt='IGA']    60s
User_creation
    Click Element    xpath:(//button[@type='button']//img)[1]
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='Access Request']    60s 
    Click Element    xpath://div[normalize-space(text())='Access Request']
    Wait Until Element Is Visible    id:mui-component-select-selectedDepartment    60s
    Click Element    id:mui-component-select-selectedDepartment  
    Sleep    2
    Click Element    xpath://li[@data-value='Testing']
    Sleep    1
    Input Text    id:addRolesSearch    Malay
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    Click Element    xpath://div[normalize-space(text())='Symphony']
    Sleep    2
    Wait Until Element Is Visible    xpath://p[normalize-space(text())='DEV Symphony']    60s
    Click Element    xpath://p[normalize-space(text())='DEV Symphony']
    Sleep    5
    Click Element    xpath://img[@alt='toggleIcon']
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    
    ${valid_from}=    Get Current Date    result_format=%d-%m-%Y
    
    ${valid_to}=    Get Current Date    result_format=%d-%m-%Y    increment=1 day
    
    Input Text    xpath:(//input[@type='date'])[1]    ${valid_from}
    Sleep    1
    Input Text    xpath:(//input[@type='date'])[2]    ${valid_to}
    Sleep    1
    Click Element    xpath://div[@role='combobox']
    Sleep    1
    Click Element    xpath://li[normalize-space(text())='Assign']
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    Input Text    xpath://textarea[@placeholder='Leave your comments']    For Testing
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Submit']
    Sleep    4
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//p[1]    60s
    Capture Page Screenshot
    Sleep    2

    ${Access_request}    Get Value    xpath://div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//p[1]
    Log    ${Access_request}
    
    Click Element    xpath://div[@data-testid='close-button']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://button[contains(.,'Status')]    60s  
    Sleep    2  

Request Status
    Click Element    xpath://button[contains(.,'Status')]
    Wait Until Keyword Succeeds    1 minute    5s    Click Element    xpath:(//button[@type='button'][normalize-space()='View'])[1]
    Sleep    5
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='DEV Symphony']    60s
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Status']
    Sleep    3
    Capture Page Screenshot



Finish TestCase
    Close All Browsers 