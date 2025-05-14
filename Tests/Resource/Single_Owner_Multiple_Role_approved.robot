*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Library    Anugal_library.py
Library    String

*** Variables ***
${exit_loop}    Set Variable    False
${Role_name}    Role_testing
${Apps}    symphony

*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${angvar('user_id')}
    Input password    id:password    ${angvar('qa_password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    20

    Wait Until Element Is Visible    xpath:(//input[@inputmode='text'])    60s
    Execute Javascript    window.open('https://outlook.office365.com/mail/inbox/')
    Switch Window    new

    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://*[@id="i0116"]
    SeleniumLibrary.Input Text   xpath://*[@id="i0116"]    ${angvar('Mail_id')}
    Sleep    5
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    SeleniumLibrary.Input Text    xpath://*[@id="i0118"]    ${angvar('Mail_password')}
    Sleep    5
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    5
    SeleniumLibrary.Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    15

    SeleniumLibrary.Click Element    xpath=//input[@id='topSearchInput']
    SeleniumLibrary.Input Text       xpath=//input[@id='topSearchInput']    Anugal login otp
    Sleep    5
    SeleniumLibrary.Press Keys       xpath=//input[@id='topSearchInput']    ENTER

    Sleep    5
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
    

Single_Owner_Multiple_Role_approved
    Wait Until Element Is Visible    xpath://h1[text()='My Team']    40s 
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='Approval']
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View']    30s
    SeleniumLibrary.Input Text    id:search    ${angvar('singleowner_multiplerole_id')}
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View'][1]    20s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='View'][1]
    Sleep    2
    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='symphony']    30s
    SeleniumLibrary.Click Element    xpath://input[@value='selectAll']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Approve']
    Sleep    2
    SeleniumLibrary.Input Text    xpath://textarea[@rows='7']    Approved
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary css-1pncztj']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    20s
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='Status']
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View'][1]    20s
    SeleniumLibrary.Input Text    id:search    ${angvar('singleowner_multiplerole_id')}    
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='View']
    Sleep    2
    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='Approver']    30s
    ${status}    Get Text    xpath:(//p[contains(@class,'MuiTypography-root MuiTypography-body1')]//span)[1]
    Log    ${status}
    Log To Console    **gbStart**Singleowner_multiplerole_status**splitKeyValue**${status}**gbEnd**


Finish TestCase
    Close Browser