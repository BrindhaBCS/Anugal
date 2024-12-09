*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Start TestCase
    Open Browser    ${wvar('clubcracker_url')}    ${wvar('clubcracker_browser')}
    Maximize Browser Window

HomePage_menu_image_loading
    
    # Step 1: Wait until the element is visible
    Wait Until Element Is Visible    xpath:(//div[@class='content_wrapper'])[3]    60s
    Sleep    2
    ${menu_1}=    Run Keyword And Return Status    Element Should Be Visible    xpath://a[text()='Our Food']
    ${menu_2}=    Run Keyword And Return Status    Element Should Be Visible    xpath://a[text()='Recipes']
    ${menu_3}=    Run Keyword And Return Status    Element Should Be Visible    xpath://span[text()='where to buy']
    ${menu_4}=    Run Keyword And Return Status    Element Should Be Visible    xpath://span[text()='Contact Us']
    
    IF    ${menu_1}
        Log    "Our Food is visible."
        IF    ${menu_2} 
            Log    "Recipes is also visible."
            IF    ${menu_3}
                Log    "Where to Buy is also visible."
                IF    ${menu_4}
                    Log    "Contact Us is also visible."
                ELSE
                    Log    "Contact Us is NOT visible."
                END
            ELSE
                Log    "Where to Buy is NOT visible."
            END
        ELSE
            Log    "Recipes is NOT visible."
        END
    ELSE
        Log    "Our Food is NOT visible."
    END
    
    ${scroll_page} =    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[@class='content_wrapper'])[3]
    IF    ${scroll_page}
        Execute Javascript    window.scrollTo(0, 500)
        Log    "Scrolled down successfully."
        Sleep    1
        
        ${Product_image} =    Run Keyword And Return Status    Element Should Be Visible    xpath://h2[text()='Our Food']/following-sibling::div
        IF    ${Product_image}
            Wait Until Element Is Visible    xpath://h2[text()='Our Food']/following-sibling::div    60s
            Log    "Product image element is visible."
            
            ${screenshot} =    Run Keyword And Return Status    Element Should Be Visible    xpath://h2[text()='Our Food']/following-sibling::div
            IF    ${screenshot}
                Capture Element Screenshot    xpath://h2[text()='Our Food']/following-sibling::div
                Log    "Screenshot captured successfully."
            ELSE
                Log    "Failed to capture screenshot as the product image element is not visible."
                Capture Page Screenshot
            END
        ELSE
            Log    "Product image element is not visible. Skipping screenshot capture."
            Capture Page Screenshot
        END
    ELSE
        Log    "Content wrapper is not visible. Cannot scroll."
        Capture Page Screenshot
    END
    Sleep    2