*** Settings ***
Library     SeleniumLibrary
Library    Anugal_Keys_library.py
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
    Sleep    4
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
