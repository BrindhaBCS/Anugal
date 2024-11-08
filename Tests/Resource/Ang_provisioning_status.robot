*** Settings ***
Library     SeleniumLibrary
Library    DateTime

*** Variables ***
${Access_request}    IGA-109677


*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
Submit Anugal username and password
    Wait until element is visible    ${angvar('user_text_box')}    60s
    
    Input text    ${angvar('user_text_box')}        ${angvar('user_id')}
    Input password    ${angvar('password_text_box')}    ${angvar('password')}
    Click element    ${angvar('Login_anugal_button')}
    Maximize Browser Window
    
    Wait Until Element Is Visible    xpath://img[@alt='IGA']    60s

provisioning_status
    Wait Until Element Is Visible    xpath://button[contains(.,'Status')]    60s
    Click Element    xpath://button[contains(.,'Status')]
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//button[@type='button'][normalize-space()='View'])[1]    60s
    Input Text    xpath:(//input[@id='search'])[2]    ${Access_request}
    Wait Until Element Is Visible    xpath://button[normalize-space()='View']
    Sleep    4
    Click Element    xpath://button[normalize-space()='View']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='DEV Symphony']    60s 
    Sleep    1
    # ${status}    Get Value    xpath://p[contains(@class, 'MuiTypography-root') and contains(@class, 'MuiTypography-body1') and (text()='Pending' or text()='Approved')]
    # Sleep    1
    # Log To Console    ${status}
    # Sleep    1
    # Click Element    xpath://button[normalize-space(text())='Status']
    # Sleep    1
    # ${status2}    Get Value    xpath:(//span[contains(@class,'MuiStepLabel-label Mui-active')]//h6)[2]
    # Log To Console    ${status2}
    # Sleep    1

    Click Element    xpath://button[normalize-space(text())='Status']
    Sleep    2
    

Finish TestCase
    Close All Browsers

        