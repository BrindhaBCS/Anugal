*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
Library    DateTime

# *** Variables ***

# ${Mail_id}    malayranjan.s@basiscloudsolutions.com
# ${Mail_password}    Malay@@Ranjan12



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
    Execute Javascript    window.open('https://outlook.office365.com/mail/inbox/')
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
    Sleep    10
    
unlock_SAP
    Wait Until Element Is Visible    xpath://h1[text()='My Team']    40s 
    
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='My Systems']
    Sleep    3
    Wait Until Element Is Visible    xpath://div[text()='SAP Systems']    20s
    SeleniumLibrary.Click Element    xpath://div[text()='SAP Systems']
    Sleep    2
    Wait Until Element Is Visible    xpath://img[@alt='View']    30s

    ${sap_env}    Set Variable    1
    
    WHILE    True
        ${element}    Set Variable    xpath:(//div[@data-colindex='1'])[${sap_env}]
        ${data_visible}    Run Keyword And Return Status    Get Text    ${element}
        Sleep    1
        
        Run Keyword If    not ${data_visible}    Exit For Loop  # Exit if no more data
        Sleep    1

        ${Env_name}    Get Text    xpath:(//div[@data-colindex='1'])[${sap_env}]
        Sleep    1

        # Check if Env_name matches a specific value
        IF    '${Env_name}' == '${angvar('SAP_SYSTEM')}'  
            SeleniumLibrary.Click Element    xpath:(//div[@data-colindex='0'])[${sap_env}]
            Sleep    2
            # SeleniumLibrary.Click Element    xpath:(//img[@alt='View'])[${sap_env}]
            # Sleep    5
            Capture Page Screenshot
        END
        ${sap_env}    Evaluate    ${sap_env} + 1

    END

    SeleniumLibrary.Click Element    xpath:(//div[@aria-colspan='1']//button)[1]
    Sleep    1
    Wait Until Element Is Visible    xpath://div[@role='dialog']    30s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Confirm request']
    Sleep    2
    Wait Until Element Is Visible    xpath://div[@class='MuiAlert-message css-1xsto0d']    30s
    ${unlock_popup}    Get Text    xpath://div[@class='MuiAlert-message css-1xsto0d']
    Log To Console    ${unlock_popup}



        
Finish TestCase
    Close Browser