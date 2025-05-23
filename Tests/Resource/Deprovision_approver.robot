*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
Library    DateTime

*** Variables ***

${outlook}    https://outlook.office365.com/mail/inbox/
${tab_2}    My Systems
${sy_name}    BTP-APP
${admin_session}    Admin Reporting


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
    Wait Until Element Is Visible    xpath:(//button[@type='button']//img)[1]    60s

approver
    Wait Until Keyword Succeeds    1 minute    5s     Wait Until Element Is Visible    xpath://p[normalize-space(text())='Peers']
    Wait Until Element Is Visible    xpath://button[contains(.,'Admin')]    30s
    Sleep    5
    SeleniumLibrary.Click Element    xpath://button[contains(.,'Admin')]
    
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='${admin_session}']    40s
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='${admin_session}']
    Wait Until Element Is Visible    xpath://button[contains(.,'​Create a new filter set')]    40s
    SeleniumLibrary.Click Element    xpath://button[contains(.,'​Create a new filter set')] 
    Sleep    2
    SeleniumLibrary.Click Element    id:conditionDetails
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//div[@role='combobox'])[2]
    Sleep    2
    SeleniumLibrary.Click Element    xpath://li[normalize-space(text())='Status']
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//div[@role='combobox'])[3]
    Sleep    1
    SeleniumLibrary.Click Element    xpath://li[@data-value='IS']
    Sleep    1
    SeleniumLibrary.Click Element    id:filterDropdownInput
    Sleep    1
    SeleniumLibrary.Click Element    xpath://li[@data-value='Pending']
    Sleep    1
    SeleniumLibrary.Click Element    xpath://p[normalize-space(text())='Execute']
    Sleep    2
    Wait Until Element Is Visible    xpath://button[text()='View']    40s
    SeleniumLibrary.Input Text    xpath://input[@placeholder='Search...']    ${angvar('ticket_id')}
    Sleep    2
    Wait Until Element Is Visible    xpath://button[text()='View']    30s
    SeleniumLibrary.Click Element    xpath://button[text()='View']
    Sleep    2
    Wait Until Element Is Visible    //button[normalize-space(text())='Take Approver Role']    40s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Take Approver Role']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://li[text()='Approve']
    Sleep    5
    Wait Until Element Is Visible    xpath://button[text()='View']    50s
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='Status']
    Sleep    5
    Wait Until Element Is Visible    xpath://button[text()='View']    50s
    SeleniumLibrary.Input Text    xpath://input[@name='search']    ${angvar('ticket_id')}
    Sleep    5
    Wait Until Element Is Visible    xpath://button[text()='View']    50s
    SeleniumLibrary.Click Element    xpath://button[text()='View']
    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='Approvers']    40s
    ${status}    Get Text    xpath:(//p[contains(@class,'MuiTypography-root MuiTypography-body1')]//span)[1]
    Log    ${status}
    Sleep    1
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='My Access']
    Sleep    2
    # SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='My Systems']
    # Sleep    2

    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='${tab_2}']
    Wait Until Element Is Visible    xpath://h2[text()='${sy_name}']    30s
    SeleniumLibrary.Click Element    xpath://h2[text()='${sy_name}']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@data-colindex='0'])[1]    40s
    Sleep    2
    ${sym_env}    Set Variable    1
    
    WHILE    True
        ${element}    Set Variable    xpath:(//div[@data-colindex='1'])[${sym_env}]
        ${data_visible}    Run Keyword And Return Status    Get Text    ${element}
        Sleep    1
        
        Run Keyword If    not ${data_visible}    Exit For Loop  # Exit if no more data
        Sleep    1

        ${Env_name}    Get Text    xpath:(//div[@data-colindex='1'])[${sym_env}]
        Sleep    1

        # Check if Env_name matches a specific value
        IF    '${Env_name}' == '${angvar('ENV')}'  
            # SeleniumLibrary.Click Element    xpath:(//div[@data-colindex='0'])[${sym_env}]
            # Sleep    2
            # SeleniumLibrary.Click Element    xpath:(//img[@alt='View'])[${sym_env}]
            # Sleep    5
            ${dep_status}    Get Text    xpath:(//div[@aria-colindex='4'])[${sym_env}]
            Log    ${dep_status}
        END
        ${sym_env}    Evaluate    ${sym_env} + 1

    END


Finish TestCase
    Close Browser