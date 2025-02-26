*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
Library    DateTime

*** Variables ***

${Mail_id}    malayranjan.s@basiscloudsolutions.com
${Mail_password}    @Malay@Ranjan12
${user_name}    Varsha

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
    SeleniumLibrary.Input Text   xpath://*[@id="i0116"]    ${Mail_id}
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    SeleniumLibrary.Input Text    xpath://*[@id="i0118"]    ${Mail_password}
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
    Sleep    2
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
    Sleep    2
    

Delete_add delegation for single user
    Wait Until Keyword Succeeds    1 minute    5s     Wait Until Element Is Visible    xpath://p[normalize-space(text())='Peers']
    SeleniumLibrary.Click Element    xpath://div[@class='MuiBox-root css-1dzplvk']
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@class='react-flow__renderer']//div)[1] 
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='Delegate']
    Sleep    2
    
    SeleniumLibrary.Input Text    xpath:(//input[@id='search'])[2]    ${user_name}
    Wait Until Element Is Visible    xpath://img[@alt='Delete']    40s
    SeleniumLibrary.Click Element    xpath://img[@alt='Delete']
    Sleep    3
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Delete']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    30s
    ${pop_up}    Get Text    xpath:(//div[@direction='down']//div)[2]
    Log    ${pop_up}
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2

Finish TestCase
    Close Browser

