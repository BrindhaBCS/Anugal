*** Settings ***
Library     SeleniumLibrary
# Library    pyautogui
# Library    keyboard_actions.py
# Library    SAP_Tcode_Library.py
# Library    OperatingSystem
# Library    Process
Library    Anugal_library.py




*** Keywords ***
Start TestCase
    # Log    Opening browser
    Open Browser    ${wvar('url')}    ${wvar('browser')}    #options=${global_browser_options}
    
Submit Anugal username and password
    Wait until element is visible    ${wvar('user_text_box')}    60s
    
    SeleniumLibrary.Input text    ${wvar('user_text_box')}        ${wvar('user_id')}
    SeleniumLibrary.Input password    ${wvar('password_text_box')}    ${wvar('password')}
    SeleniumLibrary.Click element    ${wvar('Login_anugal_button')}
    Maximize Browser Window
    
    Wait Until Element Is Visible    xpath://img[@alt='IGA']    60s

SAP_login_EAM_lunchpad
    SeleniumLibrary.Click Element    xpath://button[contains(.,'My Apps')]
    Wait Until Element Is Visible    xpath://div[normalize-space(text())='EAM Launchpad']    60s
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='EAM Launchpad']
    Sleep    4
    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Log In']    60S
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Log In']
    Sleep    1
    SeleniumLibrary.Click Element    xpath://div[@aria-expanded='false']
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//li[@role='option'])[1]
    Sleep    1
    SeleniumLibrary.Input Text    id:outlined-basic    5678
    Sleep    1
    SeleniumLibrary.Input Text    xpath://textarea[@placeholder='Activity']    demo
    Sleep    1
    SeleniumLibrary.Input Text    xpath://textarea[@placeholder='Comments...']    testing
    Sleep    1
    SeleniumLibrary.Click Element    xpath:/html/body/div[2]/div[3]/div/div[5]/button
    Sleep    2
    

    Anugal_library.Press Keys    TAB
    Sleep    1
    Anugal_library.Press Keys    TAB
    Sleep    1
    Anugal_library.Press Keys    TAB
    Sleep    1
    Anugal_library.Press Keys    ENTER
    Sleep    1
    SeleniumLibrary.Click Element    xpath:/html/body/div[2]/div[3]/div/div[5]/button
    Sleep    4
    Anugal_library.Press Keys    TAB
    Sleep    1
    Anugal_library.Press Keys    TAB
    Sleep    1
    Anugal_library.Press Keys    ENTER
    Sleep    10
    
    
    Anugal_library.Run Transaction    /nsu01
    Sleep    2
    
    Anugal_library.Input Text	wnd[0]/usr/ctxtSUID_ST_BNAME-BNAME	Anugal
	Sleep	2

    Anugal_library.Run Transaction    /nsu10
    Sleep    2

    Anugal_library.Run Transaction    /nex
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Log Out']
    Sleep    2
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath://button[normalize-space(text())='Log In']    60s  
    Sleep    2

Finish TestCase
    Close All Browsers