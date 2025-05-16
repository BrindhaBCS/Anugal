*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Library    Anugal_library.py
Library    String

*** Variables ***

# @{ROLES}    QA_QA    testaudit
${Apps}    Symphony

&{ROLE_MAP_1}    envm=Predev Symphony    role=Harmony Developer
&{ROLE_MAP_2}    envm=DEV Symphony    role=appstoretest
@{ROLES_LIST}    &{ROLE_MAP_1}    &{ROLE_MAP_2}

*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url2')}    ${angvar('browser')}    #options=${global_browser_options}
    
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${angvar('user_id')}
    Input password    id:password    ${angvar('password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    5
    

Rejection_of_One_Role_and_Approval_of_Others
    Wait Until Element Is Visible    xpath://h1[text()='My Team']    40s 
    SeleniumLibrary.Click Element    xpath:(//img[@class='css-0'])[1]
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

        
        ${dept_name_clean}    Replace String    ${dept_name}    \n    ${SPACE}
        ${dept_name_clean}    Strip String    ${dept_name_clean}

        Log To Console    Dept Name After Cleaning: ${dept_name_clean}

        IF    '${dept_name_clean}' == '${angvar("department2").strip()}'
        # IF    '${dept_name}' == '${angvar('department2')}'
            SeleniumLibrary.Click Element    ${element}
            Sleep    5

            FOR    ${app}    IN RANGE    1    100    
                ${App_name}    Set Variable    xpath:(//span[@class='MuiAccordionSummary-content MuiAccordionSummary-contentGutters css-1b8uc0m'])[${app}]
                ${app_visible}    Run Keyword And Return Status    Element Should Be Visible    ${App_name}

                Run Keyword If    not ${app_visible}    Exit For Loop  # Exit if no more data

                ${dept_name}    Run Keyword If    ${app_visible}    Get Text    ${App_name}

                ${Application}    Get Text    xpath:(//span[@class='MuiAccordionSummary-content MuiAccordionSummary-contentGutters css-1b8uc0m'])[${app}]
                Sleep    1

                # Check if Env_name matches a specific value
                
                IF    '${Application}' == '${Apps}'
                    Log    Application is Symphony
                    SeleniumLibrary.Click Element    xpath:(//span[@class='MuiAccordionSummary-content MuiAccordionSummary-contentGutters css-1b8uc0m'])[${app}]
                    Sleep    5
                    # Wait Until Element Is Visible    xpath://div[contains(@class, 'MuiCollapse-entered')]//button[.//p[normalize-space(text())='QA SYMPHONY']]    30s
                    # SeleniumLibrary.Click Element    xpath://div[contains(@class, 'MuiCollapse-entered')]//button[.//p[normalize-space(text())='QA SYMPHONY']]
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
    



    FOR    ${item}    IN    @{ROLES_LIST}
        ${envm}=    Set Variable    ${item['envm']}
        ${role}=  Set Variable    ${item['role']}

        Scroll Element Into View    xpath://div[contains(@class, 'MuiCollapse-entered')]//button[.//p[normalize-space(text())='${envm}']]
        Sleep    2
        Wait Until Element Is Visible    xpath://div[contains(@class, 'MuiCollapse-entered')]//button[.//p[normalize-space(text())='${envm}']]    30s
        SeleniumLibrary.Click Element    xpath://div[contains(@class, 'MuiCollapse-entered')]//button[.//p[normalize-space(text())='${envm}']]
        Wait Until Element Is Visible  xpath:(//input[@id='addRolesSearch'])[2]    10s
        SeleniumLibrary.Press Keys    xpath:(//input[@id='addRolesSearch'])[2]    CTRL+a    BACKSPACE
        Sleep    2
        SeleniumLibrary.Input Text    xpath:(//input[@id='addRolesSearch'])[2]    ${role}
        Sleep    2
        Wait Until Element Is Visible  xpath://img[@alt='toggleIcon']    20s
        SeleniumLibrary.Click Element    xpath://img[@alt='toggleIcon']
        Sleep    3
    END


    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Next']    10s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[contains(.,'Symphonytest')]
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//div[@id='mui-component-select-selectedDepartment'])[1]
    Sleep    1
    SeleniumLibrary.Click Element    xpath://li[@data-value='Assign']
    Sleep    1

    SeleniumLibrary.Click Element    xpath:(//div[@id='mui-component-select-selectedDepartment'])[2]
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
    
    ${multipleowner_multiplerole}    Get Text    xpath://div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//p[1]
    Log    ${multipleowner_multiplerole}
    ${Rejection_of_One_Role_and_Approval_of_Others_id}    Extract Order Number    ${multipleowner_multiplerole}
    Log    IGA-${Rejection_of_One_Role_and_Approval_of_Others_id}
    Set Global Variable    ${Rejection_of_One_Role_and_Approval_of_Others_id}
    Log To Console    **gbStart**Rejection_of_One_Role_and_Approval_of_Others**splitKeyValue**IGA-${Rejection_of_One_Role_and_Approval_of_Others_id}**gbEnd**
    SeleniumLibrary.Click Element    xpath://div[@data-testid='close-button']
    
    Sleep    2
    
    
Finish TestCase
    Close Browser




    


        