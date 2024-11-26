*** Settings ***
Library     SeleniumLibrary
Library    DateTime

*** Variables ***
${App_list}    SAP HANA


*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
Submit Anugal username and password
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${angvar('user_id')}
    SeleniumLibrary.Input password    id:password    ${angvar('password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    20
    
    Wait Until Element Is Visible    xpath:(//button[@type='button']//img)[1]    60s

Emergency Access Request for Firefighter Onboarding   
    Click Element    xpath://button[contains(.,'Admin')]
    Sleep    3
    Click Element    xpath://div[normalize-space(text())='Master Data']
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Add Owner']    60s
    Click Element    xpath://div[normalize-space(text())='FireFighter Onboarding']
    Sleep    2
    Click Element    xpath://button[normalize-space(text())='Add Firefighter']
    Sleep    4
    Input Text    id:addRolesSearch    ${App_list}
    Wait Until Element Is Visible    xpath://button[contains(.,'SAP HANA')]    60s
    Click Element    xpath://button[contains(.,'SAP HANA')]
    Sleep    3
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    5
    Click Element    xpath://button[contains(.,'DEV')]
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    5
    Click Element    xpath:(//div[@class='MuiBox-root css-0']//button)[1]
    Sleep    1
    Click Element    xpath:(//div[@role='combobox'])[1]
    Sleep    2
    Click Element    xpath://li[@data-value='userID']
    Sleep    1
    Click Element    xpath:(//div[@role='combobox'])[2]
    Sleep    2
    Click Element    xpath://li[@data-value='isEqualTo']
    Sleep    1
    Input Text    xpath://input[@placeholder='Enter User Name']    FF_*
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Execute']
    Sleep    3
    
    Execute Javascript    window.scrollTo(0, 500)
    Wait Until Element Is Visible    xpath://p[normalize-space(text())='FF_SEC']    60s
    Click Element    xpath://p[normalize-space(text())='FF_SEC']
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    Execute Javascript    window.scrollTo(0, 500)
    Click Element    xpath://button[contains(.,'Testing')]
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@title='prabaharan.m@basiscloudsolutions.com'])[1]    60s   
    
    Click Element    xpath:(//div[@title='prabaharan.m@basiscloudsolutions.com'])[1]
    Sleep    1
    Capture Page Screenshot
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@title='godwin.s@basiscloudsolutions.com'])[1]    60s
    
    Click Element    xpath:(//div[@title='godwin.s@basiscloudsolutions.com'])[1]
    Sleep    1
    Capture Page Screenshot
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    Input Text    xpath://textarea[@placeholder='Enter Description....']    For Test
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Save']
    Sleep    1
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='SAP HANA Added Successfully']    60s
    Click Element    xpath://button[@title='Close']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://td[normalize-space(text())='Testing']    60s
    Click Element    xpath:(//input[@type='checkbox'])[1]
    Sleep    1
    Wait Until Element Is Visible    xpath:(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')]//div)[2]    60s
    Click Element    xpath://button[normalize-space(text())='Confirm']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://div[normalize-space(text())='Sccessfully Provisioned Updated']    60s
    Click Element    xpath://button[@title='Close']
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    (//button[@type='button']//img)[1]

Emergency Access Request
    Click Element    xpath:(//button[@type='button']//img)[1]
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://div[normalize-space(text())='Emergency Access Request']    60s
    Click Element    xpath://div[normalize-space(text())='Emergency Access Request']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://div[@aria-expanded='false']    60s
    Click Element    xpath://div[@aria-expanded='false']
    Sleep    1
    Click Element    xpath://li[@data-value='Testing']
    Sleep    1
    Input Text    xpath://input[@placeholder='Search...']    Malay
    Sleep    1

    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    Click Element    xpath://div[@class='MuiAccordionSummary-expandIconWrapper css-1fx8m19']
    Sleep    1
    Click Element    xpath://div[normalize-space(text())='SAP HANA']
    Sleep    1
    Click Element    xpath://img[@alt='toggleIcon']
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2

    # ${valid_from}=    Get Current Date    result_format=%d-%m-%Y
    
    # ${valid_to}=    Get Current Date    result_format=%d-%m-%Y    increment=7 day

    # Input Text    xpath:(//input[@type='date'])[1]    ${valid_from}
    # Sleep    1
    # Input Text    xpath:(//input[@type='date'])[2]    ${valid_to}
    # Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    2
    Input Text    xpath://textarea[@placeholder='Leave your comments']    Test@1
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Next']
    Sleep    1
    Click Element    xpath://button[normalize-space(text())='Submit']
    Sleep    1
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://div[@role='dialog']    60s
    Click Element    xpath://div[@data-testid='close-button']
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[contains(@class,'MuiPaper-root MuiPaper-elevation')])[2]    60s




Finish TestCase
    Close All Browsers 