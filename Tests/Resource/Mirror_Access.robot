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
    # Sleep    20
    Wait Until Element Is Visible    xpath:(//input[@inputmode='text'])    60s
    Execute Javascript    window.open('${outlook}')
    Switch Window    new

    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://*[@id="i0116"]
    SeleniumLibrary.Input Text   xpath://*[@id="i0116"]    ${angvar('Mail_id')}
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    SeleniumLibrary.Input Text    xpath://*[@id="i0118"]    ${angvar('Mail_password')}
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    5

    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://span[normalize-space(text())='New mail']
    Wait Until Keyword Succeeds    2 minute    5s    Wait Until Element Is Visible    xpath:(//div[@data-folder-name='inbox'])[1]
    SeleniumLibrary.Click Element    xpath:(//div[@data-folder-name='inbox'])[1]
    Sleep    3
    SeleniumLibrary.Input Text    id:topSearchInput    Anugal Administrator (Lab)
    Sleep    4
    SeleniumLibrary.Click Element    xpath://button[@title='Search']
    Sleep    2
    Wait Until Element Is Visible    xpath://span[text()='Mail']    40s
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
    # Wait Until Element Is Visible    xpath:(//button[@type='button']//img)[1]    60s

Mirror_Access
    Wait Until Keyword Succeeds    1 minute    5s     Wait Until Element Is Visible    xpath://p[normalize-space(text())='Peers']
    SeleniumLibrary.Click Element    xpath://div[@class='MuiBox-root css-1dzplvk']
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





    
    
