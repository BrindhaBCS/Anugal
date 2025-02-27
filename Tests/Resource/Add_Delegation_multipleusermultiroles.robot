*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
Library    DateTime

*** Variables ***
${user_name_1}    sanket
${user_name_2}    Bhavani
${outlook}    https://outlook.office365.com/mail/inbox/


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
    

add delegation for multiple user multiple roles
    Wait Until Keyword Succeeds    1 minute    5s     Wait Until Element Is Visible    xpath://p[normalize-space(text())='Peers']
    SeleniumLibrary.Click Element    xpath://div[@class='MuiBox-root css-1dzplvk']
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@class='react-flow__renderer']//div)[1] 
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='Delegate']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Add Delegation']
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Add']    30s
    SeleniumLibrary.Click Element    xpath://input[@placeholder='Enter Username']
    Sleep    2
    SeleniumLibrary.Input Text    xpath://input[@role='combobox']    ${user_name_1}
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ARROW_DOWN
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ENTER
    Sleep    1
    SeleniumLibrary.Input Text    xpath://input[@role='combobox']    ${user_name_2}
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ARROW_DOWN
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ENTER
    Sleep    1
    

    ${Valid_from}    Get Current Date    result_format=%d-%m-%Y    increment=1 day
    ${valid_to}    Get Current Date    result_format=%d-%m-%Y    increment=2 day

    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[1]    ${Valid_from}
    Sleep    1
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[2]    ${valid_to}
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[2]
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    1
    
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[3]    ${Valid_from}
    Sleep    1
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[4]    ${valid_to}
    Sleep    1
    
    SeleniumLibrary.Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[6]
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[7]
    Sleep    1

    

    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Add']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    30s
    ${pop_up}    Get Text    xpath:(//div[@direction='down']//div)[2]
    Log    ${pop_up}
    Log To Console    **gbStart**add_delegation_for_multiple_user_multiple_roles**splitKeyValue**${pop_up}**gbEnd**
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2


Finish TestCase
    Close Browser