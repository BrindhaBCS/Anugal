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
    # Input Text    id:emailId    dhanasekaran.g@basiscloudsolutions.com
    # Sleep    2 Dhanag@2k00
    # Input Text    id:password    bA6s5uGM
    # Sleep    2
    # Click Element    xpath://button[normalize-space(text())='Login']
    # Sleep    2
    Click Element    xpath://*[@id="idSIButton9"]
    Sleep    15
    Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    15
    Execute JavaScript    document.body.style.zoom="50%"

System_Logout
    Close Browser

Scheduled
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    3
    Wait Until Element Is Visible    xpath://p[normalize-space(text())='Self Monitoring']    10s
    Click Element    xpath://p[normalize-space(text())='Self Monitoring']
    Sleep    2
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='Configuration']    10s
    Click Element    xpath://div[normalize-space(text())='Configuration']
    Sleep    3
    ${Scheduled} =    Run Keyword And Return Status    element should be visible    xpath://button[normalize-space(text())='Scheduled']
    Log To Console    ${Scheduled}
    IF  ${Scheduled} == True
    Click Element    xpath://button[normalize-space(text())='Scheduled']
    Control_Area
    ELSE    
    Log To Console    Scheduled not Found
    END   
Control_Area
    ${Control_Area}    Get Text    locator=(//th[contains(@class,'MuiTableCell-root MuiTableCell-head')])[1]
    IF  '${Control_Area}' == 'Control Area'
    Log To Console    ${Control_Area}
    Control_ID  
    ELSE
    Log To Console    Control Area Not Found  
    Control_ID  
    END
Control_ID
    ${Control_ID}    Get Text    locator=(//th[contains(@class,'MuiTableCell-root MuiTableCell-head')])[2]
    IF  '${Control_ID}' == 'Control ID'
    Log To Console    ${Control_ID}
    Control_Name
    ELSE
    Log To Console    Control ID Not Found
    Control_Name
    END
Control_Name
    ${Control_Name}    Get Text    locator=(//th[contains(@class,'MuiTableCell-root MuiTableCell-head')])[3]
    IF  '${Control_Name}' == 'Control Name'
    Log To Console    ${Control_Name}
    Classification
    ELSE
    Log To Console    Control Name Not Found
    Classification
    END
Classification
    ${Classification}    Get Text    locator=(//th[contains(@class,'MuiTableCell-root MuiTableCell-head')])[4]
    IF  '${Classification}' == 'Classification'
    Log To Console    ${Classification}
    Created_On
    ELSE
    Log To Console    Classification Not Found
    Created_On
    END
Created_On
    ${Created_On}    Get Text    locator=(//th[contains(@class,'MuiTableCell-root MuiTableCell-head')])[5]
    IF  '${Created_On}' == 'Created On'
    Log To Console    ${Created_On}
    Last_updated_on
    ELSE
    Log To Console    Created On Not Found
    Last_updated_on
    END
Last_updated_on
    ${Last_updated_on}    Get Text    locator=(//th[contains(@class,'MuiTableCell-root MuiTableCell-head')])[6]
    IF  '${Last_updated_on}' == 'Last updated on'
    Log To Console    ${Last_updated_on}
    Last_updated_by
    ELSE
    Log To Console    Last updated on Found
    Last_updated_by
    END
Last_updated_by
    ${Last_updated_by}    Get Text    locator=(//th[contains(@class,'MuiTableCell-root MuiTableCell-head')])[7]
    IF  '${Last_updated_by}' == 'Last updated by'
    Log To Console    ${Last_updated_by}
    Status
    ELSE
    Log To Console    Last updated by Not Found
    Status
    END
status
    ${Status}    Get Text    locator=(//th[contains(@class,'MuiTableCell-root MuiTableCell-head')])[8]
    IF  '${Status}' == 'Status'
    Log To Console    ${Status}
    Search
    ELSE
    Log To Console    Last updated by Not Found
    Search
    END
Search
    Input Text    id:addRolesSearch    aruna
    Sleep    10
    ${eye} =    Run Keyword And Return Status    element should be visible    xpath:(//img[@aria-label='View'])[1]
    Log To Console    eye${eye}
    IF  ${eye} == True
        View_icon
    ELSE IF  ${eye} == False 
        SeleniumLibrary.Press Keys    id:addRolesSearch    CTRL+a  BACKSPACE  
        Input Text    id:addRolesSearch    vamsee
        Sleep    3
        View_icon
        ELSE
        Log To Console    two id's not found
        END
View_icon
    Wait Until Element Is Visible    xpath:(//img[@alt='View'])[1]    timeout=10s
    Click Element    xpath:(//img[@alt='View'])[1]
    Sleep    3
    Wait Until Element Is Visible    locator=//h1[normalize-space()='Configuration']
    ${Configuration}    Get Text    locator=//h1[normalize-space()='Configuration']
    Sleep    5
    IF  '${Configuration}' == 'Configuration'
    Click Element    xpath://h1[normalize-space()='Configuration']
    Sleep    5
    ${Configurations_text}    Get Text    locator=(//div[contains(@class,'MuiCollapse-wrapper MuiCollapse-vertical')]//div)[1]
    Sleep    5
    log_congif
    ELSE
    Log To Console    Configuration not found
    log_congif
    END
log_congif
    Wait Until Element Is Visible    locator=//h1[normalize-space(text())='Logs']
    ${log}    Get Text    locator=//h1[normalize-space(text())='Logs']
    Sleep    5
    IF  '${log}' == 'Logs'
    Click Element    locator=//h1[normalize-space(text())='Logs']
    Sleep    3
    Input Text    id:logsInput    vamsee
    Sleep    2
    Click Element    locator=//img[@alt='clode']
    Edit Configuration
    ELSE
    Log To Console    log not found
    Click Element    locator=//img[@alt='clode']
    Edit Configuration
    Sleep    5
    END
Edit Configuration
    ${Edit} =    Run Keyword And Return Status    element should be visible    xpath:(//img[@alt='Edit'])[1]
    Log To Console    Edit${Edit}
    IF  ${Edit} == True
    Click Element    xpath:(//img[@alt='Edit'])[1]
    Sleep    3
    SeleniumLibrary.Press Keys    id:controlArea    CTRL+a    BACKSPACE 
    Input Text    id:controlArea    Workflow
    Sleep    3
    SeleniumLibrary.Press Keys    id:controlId    CTRL+a    BACKSPACE 
    Input Text    id:controlId    MON-001
    Sleep    3
    SeleniumLibrary.Press Keys    id:controlName    CTRL+a    BACKSPACE 
    Input Text    id:controlName    Workflow - Failure
    Sleep    2
    SeleniumLibrary.Press Keys    id:classification    CTRL+a    BACKSPACE 
    Input Text    id:classification    Monitoring
    Sleep    3
    Click Element    xpath://button[normalize-space(text())='Save']
    Sleep    3
    ${notify} =    Run Keyword And Return Status    element should be visible    xpath:(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[3]
    Log To Console    Edit${notify}
    IF  ${notify} == True
    ${notify}    Get Text    locator=(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[3]
    Sleep    2
    ELSE
    Log To Console     A popup appears confirming a successful update after editing. not coming
    END
    Delete
    ELSE
    Log To Console    Edit icon not found
    Delete
    END
Delete
    ${Delete} =    Run Keyword And Return Status    element should be visible    xpath:(//img[@aria-label='Delete'])[1]
    Log To Console    Delete${Delete}
    IF  ${Delete} == True
    Click Element    xpath:(//img[@aria-label='Delete'])[1]
    Sleep    2
    Input Text    id:deleteRole    Not needed so delete
    Sleep    2
    Click Element    locator=//button[normalize-space(text())='Cancel']
    confirm_delete
    ELSE
    Log To Console    Delete not found
    END
confirm_delete
    Click Element    xpath:(//img[@aria-label='Delete'])[1]
    Sleep    2
    Input Text    id:deleteRole    Not needed so delete
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Delete']
    Sleep    2
    ${notify}    Run Keyword And Return Status    element should be visible    xpath:(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[3]
    Log To Console    Delete${notify}
    IF  ${notify} == True
    ${notify}    Get Text    locator=(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[3]
    Sleep    2
    ELSE
    Log To Console     A popup appears confirming a successful update after editing. not coming
    END



