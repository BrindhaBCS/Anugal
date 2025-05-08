*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Library    Anugal_library.py
Library    String

*** Variables ***

${Role_name}    Test_qa
${Apps}    symphony
${user_name}    Iren sobia

*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${wvar('url')}    ${wvar('browser')}    #options=${global_browser_options}
    
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${wvar('user_id')}
    Input password    id:password    ${wvar('password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    # Sleep    20
    Wait Until Element Is Visible    xpath:(//input[@inputmode='text'])    60s
    Execute Javascript    window.open('https://outlook.office365.com/mail/inbox/')
    Switch Window    new

    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://*[@id="i0116"]
    SeleniumLibrary.Input Text   xpath://*[@id="i0116"]    ${wvar('Mail_id')}
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    SeleniumLibrary.Input Text    xpath://*[@id="i0118"]    ${wvar('Mail_password')}
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    5

    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://span[normalize-space(text())='New mail']
    Wait Until Keyword Succeeds    2 minute    5s    Wait Until Element Is Visible    xpath:(//div[@data-folder-name='inbox'])[1]
    SeleniumLibrary.Input Text    id:topSearchInput    Anugal Administrator (Lab)
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//i[@fill='currentColor'])[3]
    Sleep    4
    SeleniumLibrary.Click Element    xpath://span[text()='Mail']
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//div[@class='XG5Jd TszOG'])[1]
    Sleep    2
    
    Wait Until Element Is Visible    xpath:(//button[@aria-label='Reply'])[3]    20s
    ${text_otp}    Get Text    xpath://div[@class='BodyFragment']//div[1]
    Sleep    1
    Log    ${text_otp}
    ${otp}    Extract Order Number otp    ${text_otp}
    Switch Window    main
    SeleniumLibrary.Input Text    xpath:(//input[@inputmode='text'])    ${otp}
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//button[@type='button'])[1]
    Sleep    10

create a delegation
    Wait Until Element Is Visible    xpath://h1[text()='My Team']    40s 
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='Approval']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//button[@type='button'][normalize-space()='View'])[1]    30s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='My Delegations']
    Sleep    4
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Add Delegation']    30s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Add Delegation']
    Sleep    3
    Wait Until Element Is Visible    xpath://input[@placeholder='Enter Username']    20s
    


    SeleniumLibrary.Click Element    xpath://input[@placeholder='Enter Username']
    Sleep    2
    SeleniumLibrary.Input Text    xpath://input[@role='combobox']    ${user_name}
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ARROW_DOWN
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ENTER

    ${Valid_from}    Get Current Date    result_format=%d-%m-%Y    
    ${valid_to}    Get Current Date    result_format=%d-%m-%Y    increment=1 day

    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[1]    ${Valid_from}
    Sleep    1
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[2]    ${valid_to}
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[2]
    Sleep    1
    
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Add']
    Sleep    5
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    30s
    ${pop_up}    Get Text    xpath:(//div[@direction='down']//div)[2]
    Log    ${pop_up}
    # Log To Console    **gbStart**Delete_Approval_to_Another_Approver**splitKeyValue**${pop_up}**gbEnd**
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2

Revoke Delegation
    Wait Until Element Is Visible    xpath://img[@aria-label='Delete']    30s
    SeleniumLibrary.Click Element    xpath://img[@aria-label='Delete']
    Sleep    2
    Wait Until Element Is Visible    id:alert-dialog-title    20s
    SeleniumLibrary.Click Element    xpath://img[@alt='clode']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://img[@aria-label='Edit']
    Sleep    2
    ${Valid_from}    Get Current Date    result_format=%d-%m-%Y    increment=1 day
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[1]    ${Valid_from}
    Sleep    1
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Save']    30s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Save']
    Sleep    2
    
    ${update_status}    Get Text    xpath:(//div[@direction='down']//div)[2]
    Log    ${update_status}
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2
    
    SeleniumLibrary.Click Element    xpath://img[@alt='Delete']
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Delete']    20s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Delete']
    Sleep    3
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    20s

    ${revoke_status}    Get Text    xpath:(//div[@direction='down']//div)[2]
    Log    ${revoke_status}


Finish TestCase
    Close Browser