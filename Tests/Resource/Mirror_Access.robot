*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
Library    DateTime

*** Variables ***
${Env}    DEV Symphony

${out_look}    https://outlook.office365.com/mail/inbox/

*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${angvar('user_id')}
    Input password    id:password    ${angvar('password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    5
    

Mirror_Access
    wait Until Element Is Visible    xpath://h1[text()='My Team']    40s
    SeleniumLibrary.Click Element    xpath://h1[normalize-space()='My Team']//*[name()='svg']
    Wait Until Keyword Succeeds    1 minute    10s    Wait Until Element Is Visible    xpath:(//div[@class='react-flow__renderer']//div)[1]    
    
    SeleniumLibrary.Double Click Element    xpath:(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1fb8gj2'])[6]
    Wait Until Element Is Visible    xpath:(//ul[contains(@class,'MuiList-root MuiList-padding')]//li)[2]    20s
    SeleniumLibrary.Click Element    xpath:(//ul[contains(@class,'MuiList-root MuiList-padding')]//li)[2]
    Wait Until Element Is Visible    xpath://h2[text()='Symphony']    40s
    SeleniumLibrary.Click Element    xpath://h2[text()='Symphony']
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@aria-colspan='1'])[3]  
    SeleniumLibrary.Click Element    xpath:(//input[@type='checkbox'])[1] 
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//input[@type='checkbox'])[2] 
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Mirror']
    Sleep    2

    ${Valid_from}    Get Current Date    result_format=%m-%d-%Y    increment=1 day
    ${valid_to}    Get Current Date    result_format=%m-%d-%Y    increment=2 day

    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[1]    ${Valid_from}
    Sleep    1
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[2]    ${valid_to}
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//div[@role='combobox'])[1]
    Sleep    1
    SeleniumLibrary.Click Element    xpath://li[normalize-space(text())='Assign']
    Sleep    1

    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[3]    ${Valid_from}
    Sleep    1
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[4]    ${valid_to}
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//div[@role='combobox'])[2]
    Sleep    1
    SeleniumLibrary.Click Element    xpath://li[normalize-space(text())='Assign']
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    SeleniumLibrary.Input Text    xpath://textarea[@placeholder='Leave your comments']    mirror_access
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Submit']
    Sleep    2
    Wait Until Element Is Visible    xpath://div[@role='dialog']    40s
    ${request_ticket}    Get Text    xpath://div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//p[1]
    Log    ${request_ticket}
    ${ticket_no}    Extract Order Number    ${request_ticket}
    Log    IGA-${ticket_no}
    Log To Console    **gbStart**Mirror_Access**splitKeyValue**IGA-${ticket_no}**gbEnd**
    SeleniumLibrary.Click Element    xpath://div[@data-testid='close-button']
    Sleep    2


Finish TestCase
    Close Browser





    
    
