*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
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
FFID_Status 
    Click Element    xpath://span[normalize-space()='Admin']
    Sleep    4
    Execute Javascript    window.scrollBy(0, 500)
    Sleep    3
    Wait Until Element Is Visible    locator=//p[normalize-space()='Admin Reporting']    timeout=10s
    Click Element    xpath://p[normalize-space()='Admin Reporting']
    Sleep    5
    ${filter}    Run Keyword And Return Status     element should be visible    xpath://p[normalize-space(text())='Create a new filter set']
    IF  ${filter} == True  
    Click Element    xpath://p[normalize-space(text())='Create a new filter set']
    New_Conditions
    ELSE    
    Log To Console    Filter set not Found
    END
New_Conditions
    Wait Until Element Is Visible    locator=//button[contains(.,'New Conditions')]        timeout=10s
    Click Element    xpath://button[contains(.,'New Conditions')]
    Wait Until Element Is Visible    locator=(//div[contains(@class,'MuiSelect-select MuiSelect-outlined')])[2]    timeout=10s
    Click Element    xpath:(//div[contains(@class,'MuiSelect-select MuiSelect-outlined')])[2]
    Sleep    3
    ${status}    Run Keyword And Return Status     element should be visible    xpath://li[@data-value='status']
    IF  ${status} == True  
    Click Element    xpath://li[@data-value='status']
    Sleep    2
    status
    ELSE    
    Log To Console    Status not Found
    END
status
    Wait Until Element Is Visible    locator=(//div[contains(@class,'MuiSelect-select MuiSelect-outlined')])[3]     timeout=10s
    Click Element    xpath:(//div[contains(@class,'MuiSelect-select MuiSelect-outlined')])[3]
    Sleep    2
    Click Element    xpath://li[normalize-space(text())='Is']
    Sleep    3
    Click Element    id:filterDropdownInput
    Sleep    2
    Click Element    xpath://li[normalize-space(text())='Pending']
    Sleep    2
    ${Execute}    Run Keyword And Return Status     element should be visible    xpath://p[normalize-space(text())='Execute']
    IF  ${Execute} == True  
    Click Element    xpath://p[normalize-space(text())='Execute']
    Execute
    ELSE    
    Log To Console    Execute not Found
    END
Execute
    Scroll Element Into View    locator=//div[@class='MuiDataGrid-row MuiDataGrid-row--firstVisible']//button[@type='button'][normalize-space()='View']
    Sleep    3
    Wait Until Element Is Visible    locator=//div[@class='MuiDataGrid-row MuiDataGrid-row--firstVisible']//button[@type='button'][normalize-space()='View']    timeout=10s
    Click Element    xpath://div[@class='MuiDataGrid-row MuiDataGrid-row--firstVisible']//button[@type='button'][normalize-space()='View']
    Sleep    2
    Wait Until Element Is Visible    locator=//button[normalize-space(text())='Take Approver Role']    timeout=15s
    Click Element    xpath://button[normalize-space(text())='Take Approver Role']
    Sleep    2
    ${Approve}    Run Keyword And Return Status     element should be visible    xpath://li[normalize-space()='Approve']
    IF  ${Approve} == True  
    Click Element    xpath://li[normalize-space()='Approve']
    Approval
    ELSE    
    Log To Console   Approve not Found
    END
Approval
    Click Element    xpath://span[normalize-space()='Approval']
    Sleep    5
    Click Element    xpath://button[normalize-space()='View']
    Sleep    5
    Click Element    xpath://input[@value='ANG-MF-100344']
    Sleep    5
    Click Element    xpath://button[normalize-space()='Next']
    Sleep    15
    Anugal_library.Reload Page
    Sleep    25
    Click Element    xpath://span[normalize-space(text())='Status']
    Sleep    3
    Click Element    xpath:(//button[@type='button'][normalize-space()='View'])[1]
    Sleep    3
 






