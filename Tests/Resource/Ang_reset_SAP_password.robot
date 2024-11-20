*** Settings ***
Library     SeleniumLibrary
Library    String
# Library    Anugal_library.py
Library    SAP_Tcode_Library.py
Library    Process


*** Variables ***
${random_password}    
${password_length}



*** Keywords ***
Start TestCase
    # Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
Submit Anugal username and password
    Wait until element is visible    ${angvar('user_text_box')}    60s
    
    SeleniumLibrary.Input text    ${angvar('user_text_box')}        ${angvar('user_id')}
    SeleniumLibrary.Input password    ${angvar('password_text_box')}    ${angvar('password')}
    SeleniumLibrary.Click element    ${angvar('Login_anugal_button')}
    Maximize Browser Window
    Wait Until Keyword Succeeds    2 minute    5s    Wait Until Element Is Visible    xpath://img[@alt='IGA']    
    # Wait Until Element Is Visible    xpath://img[@alt='IGA']    60s

Anugal_password_reset
    
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='My Systems']
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='My Systems']
    Wait Until Element Is Visible    xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[3]    60s
    SeleniumLibrary.Click Element    xpath:(//div[contains(@class,'MuiButtonBase-root MuiAccordionSummary-root')])[3]
    Sleep    10
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='DEV - 001']    60s  
    Capture Page Screenshot  
    SeleniumLibrary.Select Checkbox    xpath://input[@type='checkbox']
    Sleep    2


    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Reset']
    Sleep    2
    Wait Until Element Is Visible    xpath://div[@role='dialog']    60s
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Confirm request']
    Sleep    2
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='The password was changed']    60s
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    1
    

    
    Execute Javascript    window.open('https://outlook.office365.com/mail/inbox/')
    Switch Window    new
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://*[@id="i0116"]
    SeleniumLibrary.Input Text   xpath://*[@id="i0116"]    malayranjan.s@basiscloudsolutions.com
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]

    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    SeleniumLibrary.Input Text    xpath://*[@id="i0118"]    Malay@Ranjan12
    SeleniumLibrary.Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    SeleniumLibrary.Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    5


    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://span[normalize-space(text())='New mail']
    SeleniumLibrary.Click Element    xpath:(//div[contains(@class,'C2IG3 LPIso')]//span)[1]
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//div[@class='XG5Jd TszOG'])[1]
    Sleep    4
    ${password}    Get Text    xpath:(//span[@lang='EN-US'])[3]
    Sleep    2

    ${parts}=    Split String    ${password}    :    max_split=1
    ${password1}=    Strip String    ${parts}[1]
    Log    Password is:${password1}
    # Set Global Variable    ${password1}
   
    Start Process     ${wvar('SAP_SERVER')}    
    Sleep    2
    Connect To Session
    Open Connection    ${wvar('SAP_connection')}    
    SAP_Tcode_Library.Input Text    wnd[0]/usr/txtRSYST-MANDT    ${wvar('Client_Id')}
    SAP_Tcode_Library.Input Text    wnd[0]/usr/txtRSYST-BNAME    ${wvar('User_Name')}    
    SAP_Tcode_Library.Input Password   wnd[0]/usr/pwdRSYST-BCODE    ${password1}
    Send Vkey    0
    Sleep    5


New password Generate
    ${random_password}    Generate Random String    ${password_length}    [NUMBERS][LETTERS]
    Log    ${random_password}
    # Set Global Variable    ${random_password}

    SAP_Tcode_Library.Input Text    wnd[1]/usr/pwdRSYST-NCODE    ${random_password}
    Sleep    1
    SAP_Tcode_Library.Input Text    wnd[1]/usr/pwdRSYST-NCOD2    ${random_password}
    Sleep    1
    SAP_Tcode_Library.Click Element    wnd[1]/tbar[0]/btn[0]
    Sleep    2
    SAP_Tcode_Library.Run Transaction    /nex
    Sleep    2

    


Finish TestCase
    Close All Browsers
