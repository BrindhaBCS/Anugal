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


system_Logout
    Close Browser

work_flow
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    5
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    3
    Wait Until Element Is Visible    locator=//p[normalize-space(text())='Self Monitoring']      timeout=10s
    Click Element    xpath://p[normalize-space(text())='Self Monitoring']
    Sleep    5
    Execute Javascript    window.scrollBy(0, 1000)
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
