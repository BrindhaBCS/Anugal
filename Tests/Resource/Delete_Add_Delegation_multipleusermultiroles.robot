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
    
    

Delete_add delegation for multiple user multiple roles
    Wait Until Keyword Succeeds    1 minute    5s     Wait Until Element Is Visible    xpath://h1[text()='My Team']
    SeleniumLibrary.Click Element    xpath://h1[normalize-space()='My Team']//*[name()='svg']
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@class='react-flow__renderer']//div)[1] 
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='Delegate']
    Sleep    3
    SeleniumLibrary.Input Text    xpath://input[@placeholder='Search...']    ${user_name_1}
    Sleep    1
    Wait Until Element Is Visible    xpath://img[@aria-label='Delete']    40s
    SeleniumLibrary.Click Element    xpath://img[@aria-label='Delete']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Delete']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    40s
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2


    SeleniumLibrary.Press Keys    xpath://input[@placeholder='Search...']    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text    xpath://input[@placeholder='Search...']    ${user_name_2}
    Sleep    1
    Wait Until Element Is Visible    xpath://img[@aria-label='Delete']    40s
    SeleniumLibrary.Click Element    xpath://img[@aria-label='Delete']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Delete']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    40s
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2

Finish TestCase
    Close Browser
