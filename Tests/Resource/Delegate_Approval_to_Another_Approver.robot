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

Delete Approval to Another Approver
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
    Log To Console    **gbStart**Delete_Approval_to_Another_Approver**splitKeyValue**${pop_up}**gbEnd**
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2

Raised a request
    
    Wait Until Element Is Visible    xpath:(//button[@type='button']//img)[1]    40s 
    SeleniumLibrary.Click Element    xpath:(//button[@type='button']//img)[1]
    # SeleniumLibrary.Click Element    xpath:(//img[@class='css-0'])[1]
    Sleep    2
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='Access Request']    30s
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='Access Request']
    Sleep    5
   
    SeleniumLibrary.Click Element    xpath://button[text()='Next']
    Sleep    2
    # SeleniumLibrary.Press Keys    xpath:(//input[@aria-invalid='false'])[2]    CTRL+a    BACKSPACE  
    SeleniumLibrary.Click Element    xpath://button[@aria-label='clear selection']
    Sleep    2
    ${dept}    Set Variable    1
    ${app}    Set Variable    1
    ${Env}    Set Variable    1
    
    WHILE    True
        ${element}    Set Variable    xpath:(//div[contains(@class,'MuiPaper-root MuiPaper-outlined')]//div)[${dept}]
        ${data_visible}    Run Keyword And Return Status    Element Should Be Visible    ${element}

        Run Keyword If    not ${data_visible}    Exit For Loop  # Exit if no more data

        ${dept_name}    Run Keyword If    ${data_visible}    Get Text    ${element}

        
        # ${dept_name_clean}    Replace String    ${dept_name}    \n    ${SPACE}
        # ${dept_name_clean}    Strip String    ${dept_name_clean}

        # Log To Console    Dept Name After Cleaning: ${dept_name_clean}

        # IF    '${dept_name_clean}' == '${wvar("department").strip()}'
        IF    '${dept_name}' == '${wvar('department')}'
            SeleniumLibrary.Click Element    ${element}
            Sleep    5
            FOR    ${app}    IN RANGE    1    100
                ${App_name}    Set Variable    xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[${app}]
                ${app_visible}    Run Keyword And Return Status    Element Should Be Visible    ${App_name}

                Run Keyword If    not ${app_visible}    Exit For Loop  # Exit if no more data

                ${dept_name}    Run Keyword If    ${app_visible}    Get Text    ${App_name}

                ${Application}    Get Text    xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[${app}]
                Sleep    1

                # Check if Env_name matches a specific value
                
                IF    '${Application}' == '${Apps}'
                    Log    Application is Symphony
                    SeleniumLibrary.Click Element    xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[${app}]
                    Sleep    5
                    Wait Until Element Is Visible    xpath://div[contains(@class, 'MuiCollapse-entered')]//button[.//p[normalize-space(text())='QA SYMPHONY']]    30s
                    SeleniumLibrary.Click Element    xpath://div[contains(@class, 'MuiCollapse-entered')]//button[.//p[normalize-space(text())='QA SYMPHONY']]
                    Sleep    5
                    Exit For Loop
                ELSE
                    Log    Application is not Symphony
                END
                ${app}    Evaluate    ${app} + 1
                
            END

        END

        ${dept}    Evaluate    ${dept} + 1  
        
    END
    


    Wait Until Element Is Visible    xpath:(//div[@class='MuiCardContent-root css-1qw96cp'])[1]    40s
    SeleniumLibrary.Input Text    xpath:(//input[@id='addRolesSearch'])[2]    ${Role_name}
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@class='MuiGrid-root css-rfnosa'])    20s
    SeleniumLibrary.Click Element    xpath://img[@alt='toggleIcon']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    SeleniumLibrary.Click Element    id:mui-component-select-selectedDepartment
    Sleep    1
    SeleniumLibrary.Click Element    xpath://li[@data-value='Assign']
    Sleep    1

    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    SeleniumLibrary.Input Text    xpath://textarea[@placeholder='Leave your comments']    Testing
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Submit']
    Sleep    2
    Wait Until Element Is Visible    xpath://div[@role='dialog']    20s
    
    ${Access_req}    Get Text    xpath://div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//p[1]
    Log    ${Access_req}
    ${Delete_Approval_to_Another_Approver_id}    Extract Order Number    ${Access_req}
    Log    IGA-${Delete_Approval_to_Another_Approver_id}
    Set Global Variable    ${Delete_Approval_to_Another_Approver_id}
    Log To Console    **gbStart**Delete_Approval_to_Another_Approver**splitKeyValue**IGA-${Delete_Approval_to_Another_Approver_id}**gbEnd**
    SeleniumLibrary.Click Element    xpath://div[@data-testid='close-button']
    Sleep    2
    
        




Finish TestCase
    Close Browser