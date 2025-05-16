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
    
User
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Execute JavaScript    window.scrollBy(0, 1000)
    Sleep    3
    Scroll Element Into View        locator=//p[normalize-space(text())='Audit Trail']
    Wait Until Element Is Visible    locator=//p[normalize-space(text())='Audit Trail']    timeout=10s
    Sleep    3
    Click Element    xpath://p[normalize-space(text())='Audit Trail']
    Sleep    2
    Wait Until Element Is Visible    id:search    timeout=10s
    Input Text    id:search    dhanasekaran
    Sleep    2
    Wait Until Element Is Visible    locator=(//div[@class='MuiDataGrid-cell MuiDataGrid-cell--textLeft']//img)[1]    timeout=10s
    Click Element    xpath:(//div[@class='MuiDataGrid-cell MuiDataGrid-cell--textLeft']//img)[1]
    Sleep    2
    Click Element    xpath://div[contains(@class,'MuiBackdrop-root MuiModal-backdrop')]
    Sleep    3
    Click Element    xpath://*[name()='svg' and @data-testid='ArrowBackIosIcon']
    Sleep    2
    Wait Until Element Is Visible    locator=//p[normalize-space(text())='Self Monitoring']    timeout=10s
    Click Element    xpath://p[normalize-space(text())='Self Monitoring']
    Sleep    2
    Wait Until Element Is Visible    locator=//p[normalize-space(text())='Users']    timeout=5s
    ${users}    Get Text    locator=//p[normalize-space(text())='Users']
    Sleep    3
    IF  '${users}' == 'Users'
    ${gettext}    Get Text    locator=(//div[@class='recharts-legend-wrapper'])[1]
    ELSE
    Log To Console    Data not found
    END
