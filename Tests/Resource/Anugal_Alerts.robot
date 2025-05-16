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


system_Logout
    Close Browser

Alerts
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    3
    Click Element    xpath://p[normalize-space(text())='Self Monitoring']
    Sleep    5
    Click Element    xpath:(//button[@type='button'][normalize-space()='View All'])[2]
    Sleep    15
    Execute JavaScript    window.scrollBy(0, -500)
    Sleep    3
Priority
    ${Priority}    Get Text    locator=//th[normalize-space()='Priority']
    IF  '${Priority}' == 'Priority'
    Log To Console    ${Priority}
    Alert_ID  
    ELSE
    Log To Console    Priority Not Found  
    Alert_ID  
    END
Alert_ID
    ${Alert_ID}    Get Text    locator=//th[normalize-space()='Alert ID']
    IF  '${Alert_ID}' == 'Alert ID'
    Log To Console    ${Alert_ID}
    Alert_name
    ELSE
    Log To Console    Alert ID Not Found
    Alert_name
    END
Alert_name
    ${Alert Name}    Get Text    locator=//th[normalize-space()='Alert Name']
    IF  '${Alert_Name}' == 'Alert Name'
    Log To Console    ${Alert_Name}
    Alert_Details
    ELSE
    Log To Console    Alert Name Not Found
    Alert_Details
    END
Alert_Details
    ${Alert_Details}    Get Text    locator=//th[normalize-space()='Alert Details']
    IF  '${Alert_Details}' == 'Alert Details'
    Log To Console    ${Alert_Details}
    Status
    ELSE
    Log To Console    Alert Details Not Found
    Status
    END
Status
    ${Status}    Get Text    locator=//th[normalize-space()='Status']
    IF  '${Status}' == 'Status'
    Log To Console    ${Status}
    Acknowledged_by
    ELSE
    Log To Console    Status Not Found
    Acknowledged_by
    END
Acknowledged_by
    ${Acknowledged_by}    Get Text    locator=//th[normalize-space()='Acknowledged by']
    IF  '${Acknowledged_by}' == 'Acknowledged by'
    Log To Console    ${Acknowledged_by}
    Created_On
    ELSE
    Log To Console    Acknowledged by Not Found
    Created_On
    END
Created_On
    ${Created_On}    Get Text    locator=//th[normalize-space()='Created On']
    IF  '${Created_On}' == 'Created On'
    Log To Console    ${Created_On}
    search
    ELSE
    Log To Console    Created On Not Found
    search
    END
search
    Input Text    id:search    hema
    Sleep    2
    ${isvisble}    Run Keyword And Return Status    Element Should Be Visible    Click Element    xpath://img[@aria-label='View']
    IF  '${isvisble}' == 'True'
        Click Element    xpath://img[@aria-label='View']
    ELSE
    SeleniumLibrary.Press Keys    id:search    CTRL+a    BACKSPACE
    Sleep    2
    Input Text    id:search    testing for job status 001
    Sleep    2
    Wait Until Element Is Visible        xpath://img[@aria-label='View']    15s
    Click Element    xpath://img[@aria-label='View']
    END
    Click Element    xpath://button[normalize-space(text())='Comments']
    Sleep    2
    ${comments}    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[contains(@class,'MuiFormControl-root MuiTextField-root')]//div)[3]
    IF    '${comments}' == 'True'   
    # Input Text    xpath:(//div[contains(@class,'MuiFormControl-root MuiTextField-root')]//div)[3]    WriteTest
    # Sleep    2
    Click Element    xpath://span[@class='MuiButton-icon MuiButton-startIcon MuiButton-iconSizeMedium css-cveorv']//*[name()='svg']
    Sleep    2
    END
    Click Element    xpath://button[normalize-space()='Alert Details']
    Sleep    3
    Wait Until Element Is Visible    locator=//div[@role='presentation']//*[contains(text(), 'Acknowledged') or contains(text(), 'Un Acknowledged')]    timeout=10s
    ${status}    Get Text    locator=//div[@role='presentation']//*[contains(text(), 'Acknowledged') or contains(text(), 'Un Acknowledged')]
    IF    '${status}' == 'Un Acknowledged'
    Click Element    id:mui-component-select-status
    Sleep    2
    Click Element    xpath://li[text()='Acknowledged']
    Sleep    2
    Click Element    xpath://h1[normalize-space()='Logs']
    Sleep    2
    Input Text    id:logsInput    vamsee
    Sleep    3
    Click Element    xpath://button[normalize-space()='Apply']
    Sleep    3
    ${message}    Get Text    locator=//div[normalize-space(text())='ANG-SM-ALT-101495 Alert Updated Successfully']
    Log To Console    ${message}
    Sleep    2
    Click Element    xpath://*[name()='svg' and @data-testid='CloseIcon']
    ELSE    
        Log To Console    not Working update 
        Sleep    3
        Click Element    xpath://h1[normalize-space()='Logs']
        Sleep    2
        Input Text    id:logsInput    vamsee
        Sleep    3
        Click Element    xpath://button[normalize-space()='Apply']
        Sleep    3  
        Wait Until Element Is Visible    locator=//div[@role='alert']    timeout=10s
        ${notification}    Get Text    locator=//div[@role='alert']
        Log To Console    ${notification}
    END
    Click Element    xpath://div[normalize-space(text())='Dashboard']
    Sleep    4
    Click Element    xpath://span[normalize-space()='My Access']
    Sleep    4
