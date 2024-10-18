*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    
    
Submit Anugal username and password
    Wait until element is visible    ${angvar('user_text_box')}
    Sleep    10
   
    Input text    id:emailId        abarna.s@basiscloudsolutions.com
    Input password    id:password    2GdJytwi
    Click element    xpath://button[text()='Login']
   
    # Click Element    xpath:(//div[@class='MuiStack-root css-1ed5314']//button)[2]
    # Sleep    5
    # Input Text   xpath://*[@id="i0116"]    malayranjan.s@basiscloudsolutions.com
    # Sleep    3
    # Click Element    xpath://*[@id="idSIButton9"]

    # Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    # Input Text    xpath://*[@id="i0118"]    Malay@Ranjan!@#
    # Click Element    xpath://*[@id="idSIButton9"]
    # Sleep    2
    # Click Element    xpath://*[@id="idBtn_Back"]
    # Sleep    5

    Maximize Browser Window
    Sleep    20

Create User_id
    Click Element    xpath://span[text()='Admin']
    Sleep    2
    Click Element    xpath://div[text()='User Administration']
    Sleep    2
    Click Element    xpath://button[text()='Add User']
    Sleep    4
    Click Element    id:mui-component-select-userType
    Sleep    1
    Click Element    xpath://li[@data-value='User']
    Sleep    1
    Click Element    id:demo-multiple-checkbox
    Sleep    1
    Click Element    xpath://span[normalize-space(text())='End User']
    Sleep    1
    Click Element    xpath://div[contains(@class,'MuiBackdrop-root MuiBackdrop-invisible')]
    Sleep    1
    Input Text    name:firstName    Malay
    Sleep    1
    Input Text    name:lastName    Sahu
    Sleep    1
    Input Text    name:userId    Malays
    Sleep    1
    Input Text    name:email    malayranjan.s@basiscloudsolutions.com
    Sleep    1
    Input Text    name:validFrom    11-06-2024
    Sleep    1
    Input Text    name:validTo    11-06-2025
    Sleep    1
    Input Text    xpath://input[@id='timeZone']    Asia/kolkata
    Sleep    1
    Press Keys    xpath://input[@id='timeZone']    ARROW_DOWN
    Sleep    1
    Press Keys    xpath://input[@id='timeZone']    ENTER
    
    Click Element    xpath://button[normalize-space(text())='Add']
    # Sleep    10
    
View the User id
    Wait Until Keyword Succeeds    2minute    10s    Click Element    xpath:(//span[@aria-label='view'])[1]
    Sleep    2
    Click Element    xpath:(//div[@role='button'])[1]
    Sleep    2
    Click Element    xpath:(//div[@role='button'])[2]
    Sleep    2
       
    Press Keys    xpath://div[contains(@class,'MuiBackdrop-root MuiModal-backdrop')]    ESCAPE
    Sleep    1
    
Edit the User id
    Click Element    xpath:(//span[@aria-label='edit'])[1]
    Sleep    1
    Input Text    name:firstName    Ranjan  
    Sleep    2
    Click Element    xpath://button[text()='Save']
    Sleep    5

Delete user id
    Click Element    xpath:(//span[@aria-label='delete'])[1]
    Sleep    2
    Input Text    name:deleteRole    malayranjan.s@basiscloudsolutions.com   
    Sleep    2
    Click Element    xpath://button[text()='Delete']
    Sleep    2

Finish TestCase
    Close All Browsers    








