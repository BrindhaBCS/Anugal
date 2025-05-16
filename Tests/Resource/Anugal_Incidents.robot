*** Settings ***
Library     SeleniumLibrary
Resource    ../Web/Support_Web.robot
 
*** Keywords *** 
System_login
    Log    Opening browser
    Open Browser    ${angvar('anug_url')}    ${angvar('anug_browser')}
    Maximize Browser Window
    Sleep    5
    Click Element    xpath://span[normalize-space(text())='Azure']
    Sleep    10
    Input Text   xpath://*[@id="i0116"]    ${angvar('anug_Mail_id')}
    Sleep    2
    Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    Input Text    xpath://*[@id="i0118"]    ${angvar('anug_Mail_password')}
    Sleep    2
    Click Element    xpath://*[@id="idSIButton9"]
    Sleep    15
    Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    15
    Execute JavaScript    document.body.style.zoom="50%"

System_Logout
    Close Browser

Incidents
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    3
    Click Element    xpath://p[normalize-space(text())='Self Monitoring']
    Sleep    5
    Click Element    xpath:(//button[@type='button'][normalize-space()='View All'])[1]
    Sleep    5
Priority
    ${Priority}    Get Text    locator=//th[normalize-space()='Priority']
    IF  '${Priority}' == 'Priority'
    Log To Console    ${Priority}
    Incident_ID  
    ELSE
    Log To Console    Priority Not Found  
    Incident_ID  
    END
Incident_ID
    ${Incident_ID}    Get Text    locator=//th[normalize-space()='Incident ID']
    IF  '${Incident_ID}' == 'Incident ID'
    Log To Console    ${Incident_ID}
    Incident_Name
    ELSE
    Log To Console    Incident ID Not Found
    Incident_Name
    END
Incident_Name
    ${Incident_Name}    Get Text    locator=//th[normalize-space()='Incident Name']
    IF  '${Incident_Name}' == 'Incident Name'
    Log To Console    ${Incident_Name}
    Status
    ELSE
    Log To Console    Incident Name Not Found
    Status
    END
Status
    ${Status}    Get Text    locator=//th[normalize-space()='Status']
    IF  '${Status}' == 'Status'
    Log To Console    ${Status}
    Assignee
    ELSE
    Log To Console    Status Not Found
    Assignee
    END
Assignee
    ${Assignee}    Get Text    locator=//th[normalize-space()='Assignee']
    IF  '${Assignee}' == 'Assignee'
    Log To Console    ${Assignee}
    Created_Date
    ELSE
    Log To Console    Status Not Found
    Created_Date
    END
Created_Date
    ${Created_Date}    Get Text    locator=//th[normalize-space()='Created Date']
    IF  '${Created_Date}' == 'Created Date'
    Log To Console    ${Created_Date}
    Last_Updated_On
    ELSE
    Log To Console    Created Date Not Found
    Last_Updated_On
    END
Last_Updated_On
    ${Last_Updated_On}    Get Text    locator=//th[normalize-space()='Last Updated On']
    IF  '${Last_Updated_On}' == 'Last Updated On'
    Log To Console    ${Last_Updated_On}
    Last_Updated_By
    ELSE
    Log To Console    Created On Not Found
    Last_Updated_By
    END
Last_Updated_By
    ${Last_Updated_By}    Get Text    locator=//th[normalize-space()='Last Updated By']
    IF  '${Last_Updated_By}' == 'Last Updated By'
    Log To Console    ${Last_Updated_By}
    search
    ELSE
    Log To Console    Created On Not Found
    search
    END
search
    Input Text    id:search    hema
    Sleep    2
    ${isvisble}    Run Keyword And Return Status    Element Should Be Visible    xpath://img[@aria-label='View']
    IF  '${isvisble}' == 'True'
        Click Element    xpath://img[@aria-label='View']
        Sleep    2
        Execute JavaScript    window.scrollBy(0, -500)
        Sleep    2
        Click Element    xpath://h1[normalize-space()='Incident']
        Sleep    2
        Click Element    xpath://h1[normalize-space()='Incident']
        Sleep    2
        Click Element    xpath://h1[normalize-space()='Report']
        Sleep    2
        Click Element    xpath://h1[normalize-space()='Report']
        Sleep    2
        SeleniumLibrary.Press Keys    id:recipients    CTRL+a    BACKSPACE
        Sleep    2
        Input Text    id:recipients   hemalatha.r@businesscoresolutions.com
        Sleep    2
    ELSE IF    '${isvisble}' == 'False'
    SeleniumLibrary.Press Keys    id:search    CTRL+a    BACKSPACE
    Sleep    2
    Input Text    id:search    iva 
    Sleep    2
    Wait Until Element Is Visible        xpath://img[@aria-label='View']    15s
    Click Element    xpath://img[@aria-label='View']
    Sleep    2
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    2
    Click Element    xpath://h1[normalize-space()='Incident']
    Sleep    2
    Click Element    xpath://h1[normalize-space()='Incident']
    Sleep    2
    Click Element    xpath://h1[normalize-space()='Report']
    Sleep    2
    Click Element    xpath://h1[normalize-space()='Report']
    Sleep    2
    SeleniumLibrary.Press Keys    id:recipients    CTRL+a    BACKSPACE
    Sleep    2
    Input Text    id:recipients    ivabose97@gmail.com
    Sleep    2
    ELSE
        Log To Console    User Search not Found
    END
    Click Element    id:mui-component-select-status
    Sleep    2
    Click Element    xpath://li[@data-value='In Progress']
    Sleep    2
    ${visible}    Run Keyword And Return Status    Element Should Be Visible    xpath://button[normalize-space(text())='Cancel']
    IF  '${visible}' == 'True'
        Click Element    id:mui-component-select-status
        Sleep    2
        Click Element    xpath://li[normalize-space()='Completed']
        Sleep    2
        SeleniumLibrary.Press Keys    id:recipients    CTRL+a    BACKSPACE
        Sleep    2
        Input Text    id:recipients    hemalatha.r@businesscoresolutions.com
        Sleep    2
    ${visible}    Run Keyword And Return Status    Element Should Be Visible    xpath://button[normalize-space(text())='Cancel']
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Cancel']
    Sleep    2
    Click Element    xpath://img[@aria-label='View']
    Sleep    2
    ELSE IF    '${visible}' == 'False' 
        Click Element    id:mui-component-select-status
        Sleep    2
        Click Element    xpath://li[normalize-space()='On Hold']
        Sleep    2
        SeleniumLibrary.Press Keys    id:recipients    CTRL+a    BACKSPACE
        Sleep    2
        Input Text    id:recipients    hemalatha.r@businesscoresolutions.com
        Sleep    2
        ${visible}    Run Keyword And Return Status    Element Should Be Visible    xpath://button[normalize-space()='Apply']
        Click Element    xpath://button[normalize-space()='Apply']
    ELSE
        Log To Console    Apply not working
        Click Element    xpath://*[name()='svg' and @data-testid='CancelIcon']
        
    END
    ${visible}    Run Keyword And Return Status    Element Should Be Visible    xpath://h1[normalize-space(text())='Logs']
    IF  '${visible}' == 'True'
    Execute JavaScript    window.scrollBy(0, 1000)
    Sleep    3
    Click Element    xpath://h1[normalize-space(text())='Logs']
    Sleep    2
    Input Text    id:logsInput    Shanmuga Piriya Muthuraman
    Sleep    2
    END

