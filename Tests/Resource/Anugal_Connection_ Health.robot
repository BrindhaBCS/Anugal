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

Connection_health
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    3
    Click Element    xpath://p[normalize-space(text())='Self Monitoring']
    Sleep    5
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

