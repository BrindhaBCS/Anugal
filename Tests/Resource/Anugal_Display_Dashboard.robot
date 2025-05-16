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
    
Display_Dashboard
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    3
    Click Element    xpath://p[normalize-space(text())='Self Monitoring']
    Sleep    2
    Wait Until Element Is Visible    locator=//p[normalize-space(text())='Users']    timeout=5s
    ${users}    Get Text    locator=//p[normalize-space(text())='Users']
    IF  '${users}' == 'Users'
    ${gettext}    Get Text    locator=(//div[@class='recharts-responsive-container']//div)[1]
    Requests
    ELSE
    Requests
    END
Requests
    Sleep    4
    ${Requests}    Get Text    locator=//p[normalize-space()='Requests']
    IF  '${Requests}' == 'Requests'
    ${get_text}    Get Text    locator=(//div[@class='recharts-responsive-container']//div)[3]
    Over_all_Health
    ELSE
    Over_all_Health
    END
    Sleep    4
Over_all_Health
    ${Over_all_Health}    Get Text    locator=//p[normalize-space(text())='Over all Health']
    IF  '${Over_all_Health}' == 'Over all Health'
    ${get_text}    Get Text    locator=//p[normalize-space()='Good']
    Log To Console    ${get_text}
    END 
Incidents   
    ${Incidents}    Get Text    locator=//div[normalize-space(text())='Incidents']
    IF  '${Incidents}' == 'Incidents'
    ${total_incidents}    Get Text    locator=(//h2[contains(@class,'MuiTypography-root MuiTypography-h2')])[1]
    ${open}    Get Text    locator=//p[normalize-space(text())='Open']
    ${open_percentage}    Get Text    locator=//div[contains(@class, 'MuiBox-root')]//p[contains(normalize-space(), '%')]
    Sleep    2
    ${inprogress}    Get Text    locator=//p[normalize-space(text())='In Progress']
    ${inprogress_percentage}    Get Text    locator=(//p[@class='MuiTypography-root MuiTypography-body1 css-ipkznc'][contains(normalize-space(), '%')])[2]
    Sleep    2
    ${complete}    Get Text    locator=//p[normalize-space(text())='Completed']
    ${complete_percentage}    Get Text    locator=(//p[@class='MuiTypography-root MuiTypography-body1 css-ipkznc'][contains(normalize-space(), '%')])[3]
    Sleep    2
    ${hold}    Get Text    locator=//p[normalize-space(text())='On Hold']
    ${hold_percentage}    Get Text    locator=(//p[@class='MuiTypography-root MuiTypography-body1 css-ipkznc'][contains(normalize-space(), '%')])[4]
    Sleep    3
    Priority
    ELSE
    Priority
    END
Priority
    ${Priority}    Get Text    locator=(//div[@class='MuiDataGrid-columnHeaderTitleContainerContent']//div)[1]
    IF  '${Priority}' == 'Priority'
    Log To Console    ${Priority}
    Incident_ID  
    ELSE
    Log To Console    Priority Not Found  
    Incident_ID  
    END
Incident_ID
    ${Incident_ID}    Get Text    locator=(//div[@class='MuiDataGrid-columnHeaderTitleContainerContent']//div)[2]
    IF  '${Incident_ID}' == 'Incident ID'
    Log To Console    ${Incident_ID}
    Incident_Name
    ELSE
    Log To Console    Incident ID Not Found
    Incident_Name
    END
Incident_Name
    ${Incident_Name}    Get Text    locator=(//div[@class='MuiDataGrid-columnHeaderTitleContainerContent']//div)[3]
    IF  '${Incident_Name}' == 'Incident Name'
    Log To Console    ${Incident_Name}
    Status
    ELSE
    Log To Console    Incident Name Not Found
    Status
    END
Status
    ${Status}    Get Text    locator=(//div[@class='MuiDataGrid-columnHeaderTitleContainerContent']//div)[4]
    IF  '${Status}' == 'Status'
    Log To Console    ${Status}
    view_all
    ELSE
    Log To Console    status status Not Found
    view_all
    END
view_all
    Click Element    xpath:(//button[@type='button'][normalize-space()='View All'])[1]
    Sleep    3
    Wait Until Element Is Visible    locator=//button[normalize-space()='Incident']    timeout=15
    Click Element    xpath://*[name()='svg' and @data-testid='ArrowBackIosIcon']
    Sleep    3
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    locator=//p[normalize-space()='Self Monitoring']    timeout=5
    Click Element    xpath://p[normalize-space()='Self Monitoring']
    Sleep    2


Alerts
    Wait Until Element Is Visible    locator=//div[normalize-space(text())='Alerts']    timeout=10s
    ${Alerts}    Get Text    locator=//div[normalize-space(text())='Alerts']
    Sleep    5
    IF  '${Alerts}' == 'Alerts'
    ${total_count}  Get Text    locator=(//h2[contains(@class,'MuiTypography-root MuiTypography-h2')])[3]
    ${Un_Acknowledged}    Get Text    locator=//p[normalize-space(text())='Un Acknowledged']
        IF  '${Un_Acknowledged}' == 'Un Acknowledged'
        ${total_count}    Get Text    locator=(//p[contains(normalize-space(), '%')])[5]
        Log To Console    ${total_count} 
        ${Acknowledged}    Get Text    locator=//p[normalize-space(text())='Acknowledged']
            IF    '${Acknowledged}' == 'Acknowledged'
            ${total_counts}    Get Text    locator=(//p[contains(normalize-space(), '%')])[6]
            Log To Console    ${total_counts}
                ELSE
                Log To Console    Alerts Diplay cound not Found
                END
            END
    END
Prioritys
    ${Priority}    Get Text    locator=(//div[@class='MuiDataGrid-columnHeaderTitleContainerContent']//div)[5]
    IF  '${Priority}' == 'Priority'
    Log To Console    ${Priority}
    Alert_ID  
    ELSE
    Log To Console    Priority Not Found  
    Alert_ID  
    END
Alert_ID
    ${Alert_ID}    Get Text    locator=//div[normalize-space(text())='Alert ID']
    IF  '${Alert_ID}' == 'Alert ID'
    Log To Console    ${Alert_ID}
    Alert_name
    ELSE
    Log To Console    Alert ID Not Found
    Alert_name
    END
Alert_name
    ${Alert Name}    Get Text    locator=//div[normalize-space(text())='Alert Name']
    IF  '${Alert_Name}' == 'Alert Name'
    Log To Console    ${Alert_Name}
    status2
    ELSE
    Log To Console    Alert Name Not Found
    status2
    END
status2
    ${status}    Get Text    locator=(//button[@field='status'])[2]
    IF  '${status}' == 'status'
    Log To Console    ${status}
    view_all2
    ELSE
    Log To Console    Alert Details Not Found
    view_all2
    END
view_all2
    Click Element    xpath:(//button[@type='button'][normalize-space()='View All'])[2]
    Sleep    3
    Wait Until Element Is Visible    locator=//button[normalize-space()='Incident']    timeout=15
    Click Element    xpath://*[name()='svg' and @data-testid='ArrowBackIosIcon']
    Sleep    3
    Execute Javascript    window.scrollBy(0, 500)
    Wait Until Element Is Visible    locator=//p[normalize-space()='Self Monitoring']    timeout=5
    Click Element    xpath://p[normalize-space()='Self Monitoring']
    Sleep    2
job
    Execute Javascript    window.scrollBy(0, 500)
    Sleep    5
    Wait Until Element Is Visible    locator=//div[normalize-space(text())='Job']    timeout=10s
    ${Running}    Get Text    locator=(//*[name()='g'][@class='recharts-layer recharts-cartesian-axis-tick'])[1]
    ${Finished}    Get Text    locator=(//*[name()='g'][@class='recharts-layer recharts-cartesian-axis-tick'])[2]
    ${Failed}    Get Text    locator=(//*[name()='g'][@class='recharts-layer recharts-cartesian-axis-tick'])[3]
    ${Scheduled}    Get Text    locator=(//*[name()='g'][@class='recharts-layer recharts-cartesian-axis-tick'])[4]
    IF    '${Running}' == 'Running'
    ${count}    Get Text    locator=(//*[name()='text'][@name='Running'])[1]
    ${Finishcount}    Get Text    locator=(//*[name()='text'][@name='Finished'])[1]
    ${failed_count}    Get Text    locator=(//*[name()='text'][@name='Failed'])[1]
    ${scheduled}    Get Text    locator=(//*[name()='text'][@name='Scheduled'])[1]
    ELSE
    Log To Console    message=count not found
    END
Workflow
    Execute Javascript    window.scrollBy(0, 500)
    Sleep    5
    Wait Until Element Is Visible    locator=//div[normalize-space(text())='Workflow']    timeout=10s
    ${Running}    Get Text    locator=(//*[name()='g'][@class='recharts-layer recharts-cartesian-axis-tick'])[10]
    ${Finished}    Get Text    locator=(//*[name()='g'][@class='recharts-layer recharts-cartesian-axis-tick'])[11]
    ${Failed}    Get Text    locator=(//*[name()='g'][@class='recharts-layer recharts-cartesian-axis-tick'])[12]
    ${Scheduled}    Get Text    locator=(//*[name()='g'][@class='recharts-layer recharts-cartesian-axis-tick'])[13]
    IF    '${Running}' == 'Running'
    ${count}    Get Text    locator=(//*[name()='text'][@name='Running'])[2]
    ${Finishcount}    Get Text    locator=(//*[name()='text'][@name='Finished'])[2]
    ${failed_count}    Get Text    locator=(//*[name()='text'][@name='Failed'])[2]
    ${scheduled}    Get Text    locator=(//*[name()='text'][@name='Scheduled'])[2]
    ELSE
    Log To Console    message=count not found
    END
Connection_Health
    Execute Javascript    window.scrollBy(0, 1000)
    Sleep    5
    Wait Until Element Is Visible    locator=//div[normalize-space(text())='Connection Health']    timeout=10s
    ${Connections}    Get Text    locator=//h2[normalize-space()='Connections']
    IF    '${Connections}' == 'Connections'
    ${Reached}    Get Text    locator=(//div[@class='MuiBox-root css-0'])[12]
    ${Failed}    Get Text    locator=(//div[@class='MuiBox-root css-0'])[13]
    ELSE
    Log To Console    message= Connections not found
    END

    
