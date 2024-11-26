*** Settings ***
Library     SeleniumLibrary
Library    DateTime


*** Variables ***

${Env}    DEV Symphony

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

provisioning_status
    Wait Until Element Is Visible    xpath://button[contains(.,'Status')]    60s
    SeleniumLibrary.Click Element    xpath://button[contains(.,'Status')]
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//button[@type='button'][normalize-space()='View'])[1]    60s
    SeleniumLibrary.Input Text    xpath:(//input[@id='search'])[2]    ${angvar('request_id')}
    Wait Until Element Is Visible    xpath://button[normalize-space()='View']
    Sleep    4
    SeleniumLibrary.Click Element    xpath://button[normalize-space()='View']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='${Env}']    60s 
    Sleep    1
    

    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Status']
    Sleep    2
    ${Pr_status}    Get Text    xpath:(//h6[contains(@class,'MuiTypography-root MuiTypography-h3')])[3]
    Log    ${Pr_status}
    Log To Console    **gbStart**Copilot_Provisioning_Status**splitKeyValue**${Pr_status}**gbEnd**

Finish TestCase
    Close All Browsers

        