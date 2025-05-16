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
    
OverAll_Health
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Click Element    xpath://div[normalize-space(text())='Self Monitoring']
    Sleep    5
    ${overall_health}    Get Value    xpath:(//div[@class='recharts-wrapper'])[3]
    Log To Console    ${overall_health}
    IF  '${overall_health}' == 'Good'
    Log To Console    Status Good
    ELSE 
    Log To Console    Status not Good
    Sleep    2
    END