*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
Library    DateTime

*** Variables ***

${Mail_id}    malayranjan.s@basiscloudsolutions.com
${Mail_password}    @Malay@Ranjan12
${out_look}    https://outlook.office365.com/mail/inbox/
${app}    Symphony

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
    Execute Javascript    window.open('${out_look}')
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
    Sleep    2
   

multiple roles in team
    Wait Until Keyword Succeeds    1 minute    5s     Wait Until Element Is Visible    xpath://p[normalize-space(text())='Peers']
    SeleniumLibrary.Click Element    xpath://div[@class='MuiBox-root css-1dzplvk']
    Sleep    2
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@class='react-flow__renderer']//div)[1]
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='Profile']
    Capture Page Screenshot
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[contains(.,'Team')]
    Wait Until Keyword Succeeds    1 minute    10s    Wait Until Element Is Visible    xpath:(//div[@class='react-flow__renderer']//div)[1]
    SeleniumLibrary.Double Click Element   xpath:(//*[name()='svg'][@class='MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1fb8gj2'])[6]
    Wait Until Element Is Visible    xpath://li[normalize-space(text())='View Access']    20s
    SeleniumLibrary.Click Element    xpath://li[normalize-space(text())='View Access']
    Wait Until Element Is Visible    xpath://h2[text()='${app}']    40s
    SeleniumLibrary.Click Element    xpath://h2[text()='${app}']
    Wait Until Element Is Visible    xpath:(//div[@data-colindex='0'])[1]    40s


    ${sym_env}    Set Variable    1
    WHILE    True
        ${element}    Set Variable    xpath:(//div[@data-colindex='2'])[${sym_env}]
        ${data_visible}    Run Keyword And Return Status    Get Text    ${element}
        Sleep    1
        Run Keyword If    not ${data_visible}    Exit For Loop  # Exit if no more data
        Sleep    1
        ${Env_name}    Get Text    xpath:(//div[@data-colindex='2'])[${sym_env}]
        Sleep    1
        ${sym_count}    Get Length    ${wvar('env_list')}
        FOR    ${system_group}  IN RANGE    0    ${sym_count}
            # Check if Env_name matches a specific value
            IF    '${Env_name}' == '${wvar('env_list')}[${system_group}]'
                Log      ${system_group}
                SeleniumLibrary.Click Element    xpath:(//div[@data-colindex='0'])[${sym_env}]
                Sleep    2
                 
                Exit For Loop
            END
            
        END
        ${sym_env}    Evaluate    ${sym_env} + 1
        
    END
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Mirror']
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Next']    50s

    ${Valid_from}    Get Current Date    result_format=%d-%m-%Y
    ${valid_to}    Get Current Date    result_format=%d-%m-%Y    increment=1 day

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
    Wait Until Element Is Visible    xpath://textarea[@placeholder='Leave your comments']    30s
    SeleniumLibrary.Input Text    xpath://textarea[@placeholder='Leave your comments']    multiplerole
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Submit']
    Sleep    2
    Wait Until Element Is Visible    xpath://div[@role='dialog']    40s
    Sleep    2
    ${teams_multiple_role}    Get Text    xpath://div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//p[1]
    Log    ${teams_multiple_role}
    ${multiple_ticket}    Extract Order Number    ${teams_multiple_role}
    Log    IGA-${multiple_ticket}
    Log To Console    **gbStart**my_teams_multiple_roles**splitKeyValue**IGA-${multiple_ticket}**gbEnd**
    SeleniumLibrary.Click Element    xpath://div[@data-testid='close-button']
    Sleep    2
    


        


Finish TestCase
    Close Browser