*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Library    Anugal_library.py
Library    String



*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${wvar('url')}    ${wvar('browser')}    #options=${global_browser_options}
    
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${wvar('RoleB_user_id')}
    Input password    id:password    ${wvar('RoleB_password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    # Sleep    20
    Wait Until Element Is Visible    xpath:(//input[@inputmode='text'])    60s
    Execute Javascript    window.open('https://outlook.office365.com/mail/inbox/')
    Switch Window    new

    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://*[@id="i0116"]
    SeleniumLibrary.Input Text   xpath://*[@id="i0116"]    ${wvar('RoleB_Mail_id')}
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    SeleniumLibrary.Input Text    xpath://*[@id="i0118"]    ${wvar('RoleB_Mail_password')}
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    5

    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://span[normalize-space(text())='New mail']
    Wait Until Element Is Visible    xpath:(//div[@data-folder-name='inbox'])[1]    30s
    SeleniumLibrary.Click Element    xpath:(//div[@data-folder-name='inbox'])[1]
    Sleep    2
    SeleniumLibrary.Input Text    xpath://input[@placeholder='Search']    Anugal Administrator (Lab)
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//i[@fill='currentColor'])[3]
    Sleep    5
    SeleniumLibrary.Click Element    xpath://span[text()='Mail']
    Sleep    5
    SeleniumLibrary.Click Element    xpath:(//div[@class='xc0ZS TszOG'])[1]
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

One_Owner_Approves_One_Role_and_Rejects_Other_Role_and_Other_Owner_Approves_His_Roles_roleC
    Wait Until Element Is Visible    xpath://h1[text()='My Team']    40s 
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='Approval']
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View']    30s
    SeleniumLibrary.Input Text    id:search    117171    #${wvar('One_Owner_Approves_One_Role_and_Rejects_Other_Role_and_Other_Owner_Approves_His_Roles_id')}
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View'][1]    20s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='View'][1]
    Sleep    2
    Wait Until Element Is Visible    xpath://img[@alt='Symphony']   30s
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
    Sleep    5
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='Status']
    Sleep    5
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View'][1]    20s
    SeleniumLibrary.Input Text    id:search    117171    #${wvar('One_Owner_Approves_One_Role_and_Rejects_Other_Role_and_Other_Owner_Approves_His_Roles_id')}
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='View'][1]
    Sleep    5
    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='Approvers']    30s
    ${status}    Get Text    xpath:(//p[contains(@class,'MuiTypography-root MuiTypography-body1')]//span)[1]
    Log    ${status}

Finish TestCase
    Close Browser