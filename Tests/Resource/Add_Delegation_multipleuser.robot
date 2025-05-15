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

add delegation for multiple user
    Wait Until Keyword Succeeds    1 minute    5s     Wait Until Element Is Visible    xpath://h1[text()='My Team']
    SeleniumLibrary.Click Element    xpath://h1[normalize-space()='My Team']//*[name()='svg']
    Wait Until Keyword Succeeds    1 minute    5s    Wait Until Element Is Visible    xpath:(//div[@class='react-flow__renderer']//div)[1] 
    SeleniumLibrary.Click Element    xpath://div[normalize-space(text())='Delegate']
    Sleep    2
    SeleniumLibrary.Click Element    xpath://button[normalize-space(text())='Add Delegation']
    Wait Until Element Is Visible    xpath://input[@placeholder='Enter Username']    30s
    SeleniumLibrary.Click Element    xpath://input[@placeholder='Enter Username']
    Sleep    3
    SeleniumLibrary.Input Text    xpath://input[@role='combobox']    ${user_name_1}
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ARROW_DOWN
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ENTER
    Sleep    3
    SeleniumLibrary.Input Text    xpath://input[@role='combobox']    ${user_name_2}
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ARROW_DOWN
    SeleniumLibrary.Press Keys    xpath://input[@role='combobox']    ENTER
    Sleep    3
    

    ${Valid_from}    Get Current Date    result_format=%m-%d-%Y    increment=1 day
    ${valid_to}    Get Current Date    result_format=%m-%d-%Y    increment=2 day

    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[1]    ${Valid_from}
    Sleep    1
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[2]    ${valid_to}
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//button[@type='button'][normalize-space()='Role'])[1]
    Sleep    1
    SeleniumLibrary.Click Element    xpath:(//button[@type='button'][normalize-space()='Firefighter Owner'])[1]
    Sleep    1
    # SeleniumLibrary.Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[4]
    # Sleep    1

    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[3]    ${Valid_from}
    Sleep    2
    SeleniumLibrary.Input Text    xpath:(//input[@type='date'])[4]    ${valid_to}
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//button[@type='button'][normalize-space()='Role'])[2]
    Sleep    2
    SeleniumLibrary.Click Element    xpath:(//button[@type='button'][normalize-space()='Firefighter Owner'])[2]
    Sleep    3
    # SeleniumLibrary.Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[7]
    # Sleep    1

    

    SeleniumLibrary.Click Element    xpath:(//button[@type='button'][normalize-space()='Add'])[2]
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@direction='down']//div)[2]    30s
    ${pop_up}    Get Text    xpath:(//div[@direction='down']//div)[2]
    Log    ${pop_up}
    Log To Console    **gbStart**add_delegation_for_multiple_user**splitKeyValue**${pop_up}**gbEnd**
    SeleniumLibrary.Click Element    xpath://button[@title='Close']
    Sleep    2


Finish TestCase
    Close Browser