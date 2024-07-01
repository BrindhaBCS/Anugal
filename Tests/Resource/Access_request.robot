*** Settings ***
Library     SeleniumLibrary
Library    DateTime

*** Keywords ***
Start TestCase
    Log    Opening browser
    Open Browser    ${angvar('url')}    ${angvar('browser')}    
    
Submit Anugal username and password
    Wait until element is visible    ${angvar('user_text_box')}
    Sleep    10
   
    Click Element    xpath:(//div[@class='MuiStack-root css-1ed5314']//button)[2]
    Sleep    5
    Input Text   xpath://*[@id="i0116"]    malayranjan.s@basiscloudsolutions.com
    Sleep    3
    Click Element    xpath://*[@id="idSIButton9"]

    Wait Until Element Is Visible    xpath://*[@id="i0118"]    60s
    Input Text    xpath://*[@id="i0118"]    Malay@Ranjan!@#
    Click Element    xpath://*[@id="idSIButton9"]
    Sleep    2
    Click Element    xpath://*[@id="idBtn_Back"]
    Sleep    5

    Maximize Browser Window
    Sleep    20

Access_Request
    Click Element    xpath:(//img[@class='css-0'])[1]
    Sleep    2
    Click Element    xpath://li[text()='Access Request']
    Sleep    5
    Input Text    xpath://input[@role='combobox']    MALAYRANJAN
    Sleep    1
    Click Element    xpath://button[text()='Next']
    Sleep    2
    Click Element    id:mui-component-select-category
    Sleep    2
    Click Element    xpath://li[@data-value='application']
    Sleep    2
    Click Element    xpath:(//div[@role='combobox'])[2]
    Sleep    1
    Click Element    xpath://li[text()='Symphony']
    Sleep    1
    Click Element    id:mui-component-select-application
    Sleep    1
    Click Element    xpath://li[@data-value='SAP']
    Sleep    1
    Click Element    id:mui-component-select-configurationId
    Sleep    1
    Click Element    xpath://li[text()='SAP DEVELOPMENT-DEV']
    Sleep    1
    Click Element    xpath://button[text()='Search']
    Sleep    5
    
    # Click Element    xpath://div[text()='Symphony,IGA']
    # Sleep    2
    # Click Element    xpath://div[@title='SAP_BC_SRV_ARL_ADMIN_OLD']
    # Sleep    2
    Click Element    xpath://div[@title='/BCS/SYMPHONY_AZURE']
    Sleep    2
    Click Element    xpath://a[normalize-space()='Add']
    Sleep    1

    Click Element    ${angvar('DATE_INPUT_from')}
    Sleep    1

    # Clear the date input field
    Press Keys    ${angvar('DATE_INPUT_from')}    CTRL+a    BACKSPACE
    Sleep    2
    Capture Page Screenshot


    # Get the current date
    ${current_date}    Get Current Date    result_format=%Y-%m-%d
    ${valid_from}    Get Current Date    result_format=%d-%m-%Y    increment=+2d
    # Press Keys    ${DATE_INPUT_XPATH}    CTRL+a    ${valid_from}  
    # Sleep    2 
    Capture Page Screenshot

    

    # Split the current date into components
    ${current_year}    Evaluate    str('${current_date}').split('-')[0]
    ${current_month}   Evaluate    str('${current_date}').split('-')[1]
    ${current_day}     Evaluate    str('${current_date}').split('-')[2]

    # Log the split components
    Log    Current Year: ${current_year}
    Log    Current Month: ${current_month}
    Log    Current Day: ${current_day}
    Press Keys   ${angvar('DATE_INPUT_from')}     ARROW_RIGHT  ARROW_RIGHT     ${current_year}    ARROW_LEFT  ARROW_LEFT  ${current_day}  ${current_month}
    Sleep    5
    Capture Page Screenshot
    ${Target_date}    Add Time To Date    ${current_date}    ${angvar('days_to_add')} days    result_format=%Y-%m-%d
    ${Target_year}    Evaluate    str('${Target_date}').split('-')[0]
    ${Target_month}   Evaluate    str('${Target_date}').split('-')[1]
    ${Target_day}     Evaluate    str('${Target_date}').split('-')[2]
    
    Log    Current Year: ${Target_year}
    Log    Current Month: ${Target_month}
    Log    Current Day: ${Target_day}

    Press Keys    ${angvar('DATE_INPUT_to')}    CTRL+a    BACKSPACE
    Sleep    2
    Capture Page Screenshot


    Press Keys   ${angvar('DATE_INPUT_to')}     ARROW_RIGHT  ARROW_RIGHT     ${Target_year}    ARROW_LEFT  ARROW_LEFT  ${Target_day}  ${Target_month}
    Sleep    5
    Capture Page Screenshot
    
    Click Element    xpath://button[text()='Next']
    Sleep    1
    Input Text    xpath://textarea[@placeholder='Leave your comments']    Check
    Sleep    2
    Click Element    xpath://button[text()='Next']
    Sleep    1
    Click Element    xpath://button[text()='Submit']
    Sleep    8
    Click Element    xpath://div[@data-testid='close-button']
    Sleep    5

Check status
    Click Element    xpath://button[text()='View more']
    Sleep    5
    Click Element    xpath:(//button[text()='View'])[1]
    Sleep    5
    Click Element    xpath://button[text()='Status']
    Sleep    2
    Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[3]
    Sleep    2
    # Click Element    xpath:(//button[contains(@class,'MuiButtonBase-root MuiButton-root')])[2]
    # Sleep    2
    





    


        