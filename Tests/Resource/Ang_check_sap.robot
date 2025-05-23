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