*** Settings ***
Library     SeleniumLibrary
Library    Anugal_library.py
Library    DateTime

*** Variables ***

${user_name_1}    Dhanasekaran Gunasekaran
${user_name_2}    Anitha Sridhar
${outlook}    https://outlook.office365.com/mail/inbox/


*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    #options=${global_browser_options}
    
    Wait Until Keyword Succeeds    2 minute    5s   Wait until element is visible    xpath://button[contains(.,'Azure')]
    # Sleep    10
    Maximize Browser Window
    SeleniumLibrary.Input text    id:emailId        ${angvar('user_id')}
    Input password    id:password    ${angvar('password')}
    SeleniumLibrary.Click element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    5
    

Delete_add delegation for multiple user
    Wait Until Keyword Succeeds    1 minute    5s     Wait Until Element Is Visible    xpath://h1[text()='My Team']
    SeleniumLibrary.Click Element    xpath://h1[normalize-space()='My Team']//*[name()='svg']
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@class='react-flow__renderer']//div)[1] 
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='Delegate']
    Sleep    2
    
    SeleniumLibrary.Input Text    xpath://input[@placeholder='Search...']    ${user_name_1}
    Wait Until Element Is Visible    xpath://img[@alt='Delete']    40s
    SeleniumLibrary.Click Element    xpath://img[@alt='Delete']
    Sleep    3
    SeleniumLibrary.Click Element    xpath:(//input[@type='checkbox'])[1]
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Delete']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    30s
    ${pop_up}    Get Text    xpath:(//div[@direction='down']//div)[2]
    Log    ${pop_up}
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2

Finish TestCase
    Close Browser
