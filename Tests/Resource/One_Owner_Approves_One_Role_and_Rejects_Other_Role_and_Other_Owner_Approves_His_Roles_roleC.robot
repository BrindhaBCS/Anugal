*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Library    Anugal_library.py
Library    String



*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url2')}    ${angvar('browser')}    #options=${global_browser_options}
    
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${angvar('c_user_id')}
    Input password    id:password    ${angvar('c_password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    5

One_Owner_Approves_One_Role_and_Rejects_Other_Role_and_Other_Owner_Approves_His_Roles_roleC
    Wait Until Element Is Visible    xpath://h1[text()='My Team']    40s 
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='Approval']
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View']    30s
    SeleniumLibrary.Input Text    id:search    ${angvar('One_Owner_Approves_One_Role_and_Rejects_Other_Role_and_Other_Owner_Approves_His_Roles_id')}
    Sleep    2
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View'][1]    20s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='View'][1]
    Sleep    2
    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='Select All']   30s
    SeleniumLibrary.Click Element    xpath://button[contains(.,'Symphonytest')]
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//input[@type='checkbox'])[5]
    Sleep    2
    
    # SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Next']
    # Sleep    2
    # SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Reject']
    # Sleep    2
    SeleniumLibrary.Click Element    xpath://img[@alt='Approve']
    Sleep    2
    SeleniumLibrary.Input Text    xpath://textarea[1]    Approved
    Sleep    1
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Approve']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    20s
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    5
    SeleniumLibrary.Click Element    xpath://span[normalize-space(text())='Status']
    Sleep    5
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='View'][1]    20s
    SeleniumLibrary.Input Text    id:search    ${angvar('One_Owner_Approves_One_Role_and_Rejects_Other_Role_and_Other_Owner_Approves_His_Roles_id')}
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='View']
    Sleep    5
    Wait Until Element Is Visible    xpath://h2[normalize-space(text())='Approvers']    30s
    ${status}    Get Text    xpath:(//p[contains(@class,'MuiTypography-root MuiTypography-body1')]//span)[1]
    Log    ${status}
    Log To Console    **gbStart**One_Owner_Approves_One_Role_and_Rejects_Other_Role_and_Other_Owner_Approves_His_Roles_status_roleB**splitKeyValue**${status}**gbEnd**
    

Finish TestCase
    Close Browser