*** Settings ***
Library     SeleniumLibrary
Library    DateTime

*** Variables ***
${Env}    DEV Symphony

*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
Submit Anugal username and password
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${angvar('approval_user_id')}
    SeleniumLibrary.Input password    id:password    ${angvar('approval_password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    20
    
    Wait Until Element Is Visible    xpath:(//button[@type='button']//img)[1]    60s

Approval_request
    Click Element    xpath://span[normalize-space(text())='Approval']
    Wait Until Keyword Succeeds    1 minute    5s    Wait until element is visible    xpath:(//td[contains(@class,'MuiTableCell-root MuiTableCell-body')]//button)[1]
    Sleep    2
    Input Text    xpath:(//input[@placeholder='Search'])[2]    ${angvar('request_id')}
    Wait until element is visible    xpath://button[normalize-space(text())='View']    60s
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='View'] 
    Sleep    2
    Wait Until Element Is Visible    xpath://p[normalize-space(text())='${Env}']    60s
    Sleep    2
    Click Element    xpath://input[@value='selectAll']
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Approve']    60s
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Approve']
    Sleep    1
    Input Text    xpath://textarea[1]    Approved
    Sleep    2
    Click Element    xpath://button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary css-c3k44h']
    Sleep    1
    wait until keyword succeeds    2 minute    5s    Wait Until Element Is Visible    xpath:(//td[contains(@class,'MuiTableCell-root MuiTableCell-body')]//button)[1]
    Sleep    2    

Finish TestCase
    Close All Browsers