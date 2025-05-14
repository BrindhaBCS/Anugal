*** Settings ***
Library     SeleniumLibrary
Resource    ../Web/Support_Web.robot
 
*** Variables ***
${browser}    chrome
${url}    https://dev.anugalid.com/login
${Mail_id}    dhanasekaran.g@businesscoresolutions.com
${Mail_password}    Dhanag@2k00
${TEXT_TO_CHECK_Role_Level}    choose what to share with dev anugalid.com
 
 
*** Keywords ***
System_login
    Log    Opening browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    5
    Click Element    xpath://span[normalize-space(text())='Azure']
    Sleep    10
    Input Text   xpath://*[@id="i0116"]    ${Mail_id}
    Sleep    2
    Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    Input Text    xpath://*[@id="i0118"]    ${Mail_password}
    Sleep    2
    Click Element    xpath://*[@id="idSIButton9"]
    Sleep    15
    Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    15
    Execute JavaScript    document.body.style.zoom="50%"
 

system_Logout
    Close Browser
 
Alerts
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    3
    Click Element    xpath://p[normalize-space(text())='Self Monitoring']
    Sleep    5
    configuration
    
configuration
    Click Button    xpath:(//button[@role='tab'])[3]
    Sleep    2
    ${Control_Area}    Get Text    locator=//th[normalize-space(text())='Control Area']
    IF  '${Control_Area}' == 'Control Area'
    Log To Console    ${Control_Area}
    Control ID 
    ELSE
    Log To Console    Control Area Not Found  
    Control ID
    END    


Control ID
   ${Control_ID}    Get Text    locator=//th[normalize-space(text())='Control ID']
    IF  '${Control_ID}' == 'Control ID'
    Log To Console    ${Control_ID}
    Control Name 
    ELSE
    Log To Console    Control ID Not Found  
    Control Name
    END   

Control Name
    ${Control_Name}    Get Text    locator=//th[normalize-space(text())='Control Name']
    IF  '${Control_Name}' == 'Control Name'
    Log To Console    ${Control Name}
    Classification  
    ELSE
    Log To Console    Control Name Not Found  
    Classification 
    END 
 
Classification
    ${Classification}    Get Text    locator=//th[normalize-space(text())='Classification']
    IF  '${Classification}' == 'Classification'
    Log To Console    ${Classification}
    Created On
    ELSE
    Log To Console    Classification Not Found  
    Created On 
    END

Created On
    ${Created_On}    Get Text    locator=//th[normalize-space(text())='Created On']
    IF  '${Created_On}' == 'Created On'
    Log To Console    ${Created_On}
    Schedule  
    ELSE
    Log To Console    Created On Not Found  
    Schedule 
    END


Schedule
    ${Schedule}    Get Text    locator=//th[normalize-space(text())='Schedule']
    IF  '${Schedule}' == 'Schedule'
    Log To Console    ${Schedule}
    search option 
    ELSE
    Log To Console    Schedule Not Found  
    search option
    END


search option
       ${is visible}=    Run Keyword And Return Status    Element Should Be Visible    id:addRolesSearch
    Run Keyword If    '${is visible}' == 'True'   
    ...    Log    search option is displayed
    ...    ELSE
    ...    Log    search option is NOT displayed
        
view option
       ${is visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//img[@class='icon'])[1]
    Run Keyword If    '${is visible}' == 'True'    
    ...    Log    view option is displayed
    ...    ELSE
    ...    Log    view option is NOT displayed


edit option
       ${is visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//img[@alt='Edit'])[1]
    Run Keyword If    '${is visible}' == 'True'  
    ...    Log    edit option is displayed
    ...    ELSE
    ...    Log    edit option is NOT displayed    


delete option
       ${is visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//img[@aria-label='Delete'])[1]
    Run Keyword If    '${is visible}' == 'True'    
    ...    Log    delete option is displayed
    ...    ELSE
    ...    Log    delete option is NOT displayed
    Click Element    xpath:(//img[@alt='View'])[1]
    Sleep    2
    Click Element    xpath://h1[normalize-space(text())='Configuration']
    Sleep    2
    Check UI Elements Visibility

Check Element Visibility
    [Arguments]    ${label}    ${locator}
    ${is visible}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
    Run Keyword If    '${is visible}' == 'True'    
    ...    Log    ${label} is displayed
    ...    ELSE
    ...    Log    ${label} is NOT displayed

Check UI Elements Visibility
    Check Element Visibility    Control Area        xpath://p[normalize-space(text())='Control Area']
    Check Element Visibility    Control Name        xpath://p[normalize-space(text())='Control Name']
    Check Element Visibility    Created On          xpath://p[normalize-space(text())='Created On']
    Check Element Visibility    Control ID          xpath://p[normalize-space(text())='Control ID']
    Check Element Visibility    Classification      xpath://p[normalize-space(text())='Classification']
    Check Element Visibility    Last Updated On     xpath://p[normalize-space(text())='Last Updated On']
    Check Element Visibility    Status              xpath://p[normalize-space(text())='Status']

    Click Element    xpath://h1[normalize-space(text())='Logs']
    Sleep    2
    Click Element    xpath://h1[normalize-space(text())='Configuration']
    Sleep    2
    Check UI Elements Visibility_1


Check Element Visibility_1
    [Arguments]    ${label}    ${locator}
    ${is visible}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
    Run Keyword If    '${is visible}' == 'True'    
    ...    Log    ${label} is displayed
    ...    ELSE
    ...    Log    ${label} is NOT displayed

Check UI Elements Visibility_1
    Check Element Visibility_1    Date And Time        xpath://th[normalize-space(text())='Date And Time']
    Check Element Visibility_1    User Name        xpath://th[normalize-space(text())='User Name']
    Check Element Visibility_1    Action          xpath://th[normalize-space(text())='Action']
    Check Element Visibility_1    Search              id:logsInput
    Click Element    xpath://img[@alt='clode']
    Sleep    2
    Edit_icon
Edit_icon
    Click Element    xpath:(//img[@alt='Edit'])[1]
    Sleep    2
    Input Text    id:controlArea    Testing workflow
    Sleep    2
    Input Text    id:controlId    MON-001
    Sleep    2
    Input Text    id:controlName    workflow - Failure
    Sleep    2
    Input Text    id:classification    Monitoring
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Save']
    Sleep    2
    Wait Until Element Is Visible    xpath=(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[3]
    ${popup_text}=    Get Text    xpath=(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[3]
    Log    ${popup_text}
    Sleep    2
    Click Element    xpath:(//img[@alt='Delete'])[1]
    Sleep    2
    Input Text    id:deleteRole    testing purpose
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Delete']
    Sleep    2
     Wait Until Element Is Visible    xpath=(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[3]
    ${popup_text_1}=    Get Text    xpath=(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[3]
    Log    ${popup_text_1}
    Sleep    2
    




