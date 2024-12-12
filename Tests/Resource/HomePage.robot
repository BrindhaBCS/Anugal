*** Settings ***
Library    SeleniumLibrary
Library    kellanova.py

*** Variables ***
${con_1}    Our Food
${con_2}    Recipes
${con_3}    where to buy
${con_4}    Contact Us

${EXPECTED_TEXT}    Cookies On Our Website
${OK_BUTTON_XPATH}    //button[@id='onetrust-accept-btn-handler']
${BANNER_XPATH}       //div[@role='alertdialog' and @aria-describedby='onetrust-policy-text']//h3

${BUY_BUTTON}    //a[@aria-label='click to see where to buy']

*** Keywords ***
Start TestCase
    delete specific files in folder    ${angvar('vm_path_dir')}
    Log    Opening browser
    Open Browser    ${angvar('clubcracker_url')}    ${angvar('clubcracker_browser')}
    Maximize Browser Window
    Handle Pop-up
    Sleep    2
    Log    Browser opened successfully
Homepage Menu
    # Step 1: Wait until the element is visible
    Wait Until Element Is Visible    xpath:(//div[@class='content_wrapper'])[3]    60s
    Sleep    2
    ${Logo_1}=    Run Keyword And Return Status    Element Should Be Visible    xpath://a[@class='header-logo track']//img[1]
    ${menu_1}=    Run Keyword And Return Status    Element Should Be Visible    xpath://a[text()='${con_1}']
    ${menu_2}=    Run Keyword And Return Status    Element Should Be Visible    xpath://a[text()='${con_2}']
    ${menu_3}=    Run Keyword And Return Status    Element Should Be Visible    xpath://span[text()='${con_3}']
    ${menu_4}=    Run Keyword And Return Status    Element Should Be Visible    xpath://span[text()='${con_4}']
    IF  ${Logo_1}
        Log    "Logo is Visible"
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
    END

    # OUR FOOD
    ${OurProduct_topmenu}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//ul[@class='topmenu']//a)[1]    60s
    IF    ${OurProduct_topmenu}
        Click Element    xpath:(//ul[@class='topmenu']//a)[1]
        Sleep    2
        ${is_products_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@class='products-list-product']    60s
        IF    ${is_products_list_visible}
            Log To Console    "Successfully navigated to Products Items."
        ELSE
            Log To Console    "Products list not visible after navigation."
        END
    ELSE
        Log To Console    "Products link not visible."
    END

    # Recipes Navigation
    
    ${Recipes_topmenu}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//ul[@class='topmenu']//a)[2]    60s
    IF    ${Recipes_topmenu}
        Click Element    xpath:(//ul[@class='topmenu']//a)[2]
        Sleep    2
        ${is_recipes_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@class='recipe-list']    60s
        IF    ${is_recipes_list_visible}
            Log To Console    "Successfully navigated to Recipes section."
        ELSE
            Log To Console    "Recipes list not visible after navigation."
        END
    ELSE
        Log To Console    "Recipes link not visible."
    END

    # Where to Buy
    
    ${WheretoBuy_topmenu}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//a[@class='link--where-to-buy track'])[1]    60s
    IF    ${WheretoBuy_topmenu}
        Click Element    xpath:(//a[@class='link--where-to-buy track'])[1]
        Sleep    2
        ${is_buy_select_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://label[@for='__ps-sku-selector-0_0']/following-sibling::select[1]    60s
        IF    ${is_buy_select_visible}
            Click Element    xpath://span[@data-ps-shift-tab='[data-ps-tab=".ps-lightbox-close"]']
            Sleep    2
            Log To Console    "Successfully navigated 'Where to Buy' section."
        ELSE
            Log To Console    "Select box not visible in 'Where to Buy' section."
        END
    ELSE
        Log To Console    "Buy button not visible."
    END

    # Contact Us
    # Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    ${is_contact_us_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://span[normalize-space(text())='Contact Us']    60s
    IF    ${is_contact_us_visible}
        Click Element    xpath://span[normalize-space(text())='Contact Us']
        Sleep    2
        ${is_contact_section_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//section[@class='section--in-viewport'])[2]    10s
        IF    ${is_contact_section_visible}
            Log To Console    "Successfully navigated to Contact Us section."
        ELSE
            Log To Console    "Contact Us section not visible after navigation."
        END
    ELSE
        Log To Console    "Contact Us link not visible."
    END

    Click Element    xpath://a[@class='header-logo track']//img[1]
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@class='rich-text'])[1]    60s
    Sleep    2


    ${product_page} =    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[@class='content_wrapper'])[3]
    IF    ${product_page}
        # Scroll Element Into View    xpath://h2[text()='Our Food']/following-sibling::div
        Execute Javascript    window.scrollTo(0, 600)
        Sleep    2
        Log    "Scrolled down successfully"
        Sleep    1

        ${product_count}=    Get Element Count    xpath://div[@class='products-list-product']
        Log    Total products found: ${product_count}

    
        ${Product_image} =    Run Keyword And Return Status    Element Should Be Visible    xpath://h2[text()='Our Food']/following-sibling::div
        IF    ${Product_image}
            Wait Until Element Is Visible    xpath://h2[text()='Our Food']/following-sibling::div    60s
            Log    "Product image element is visible."
            
            ${screenshot} =    Run Keyword And Return Status    Element Should Be Visible    xpath://h2[text()='Our Food']/following-sibling::div
            IF    ${screenshot}
                Capture Element Screenshot    xpath://h2[text()='Our Food']/following-sibling::div
                Sleep    2
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

Homepage CTA
    Go To    https://www.clubcrackers.com/en_US/home.html
    Sleep    2
    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://img[@alt='Club Crackers']    60s
    Sleep    2

    # 1ST_CTA
    ${is_img_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath://img[@alt='Club Crackers']
    
    IF    ${is_img_visible}
        Click Element    xpath://img[@alt='Club Crackers']
        Sleep    2
        Wait Until Element Is Visible    xpath:(//div[@class='content_wrapper'])[3]    60s
        Click Element    xpath:(//a[@class='button-cta track'])[1]
        Sleep    2
        Wait Until Element Is Visible     xpath://a[contains(@class,'button-cta button-cta-red')]    60s
        Sleep    2
        Capture Page Screenshot
    ELSE
        Log    "WARN:Club Crackers Image is not visible" 
    END
    
    #2nd_CTA
    Click Element    xpath://img[@alt='Club Crackers']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@class='content_wrapper'])[3]    60s
    Click Element    xpath://button[@data-controls='next']
    Sleep    2

    ${2nd_CTA}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[contains(@class,'hero-slide hero-slide--need')]//div)[1]
    IF    ${2nd_CTA}
        
        Click Element    xpath:(//a[@class='button-cta track'])[2]
        Sleep    2
        Wait Until Element Is Visible     xpath://a[contains(@class,'button-cta button-cta-red')]    60s
        Sleep    2
        Capture Page Screenshot
    ELSE
        Log    "WARN:Club Crackers Image is not visible" 
    END
    
    #3RD_CTA
    Click Element    xpath://img[@alt='Club Crackers']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@class='content_wrapper'])[3]    60s
    Click Element    xpath://button[@data-controls='next']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[contains(@class,'hero-slide hero-slide--need')]//div)[1]    60s
    Click Element    xpath://button[@data-controls='next']
    Sleep    2

    ${3RD_CTA}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[@id='tns1-item2']//div)[1]    50s
    IF    ${3RD_CTA}
       
        Click Element    xpath:(//a[@class='button-cta track'])[3]
        Sleep    2
        Wait Until Element Is Visible     xpath://a[contains(@class,'button-cta button-cta-red')]    60s
        Sleep    2
        Capture Page Screenshot
    ELSE
        Log    "WARN:Club Crackers Image is not visible" 
    END

    # 4th_CTA
    Click Element    xpath://img[@alt='Club Crackers']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@class='content_wrapper'])[3]    60s
    Click Element    xpath://button[@data-controls='next']
    Sleep    2
    Click Element    xpath://button[@data-controls='next']
    Sleep    2
    Click Element    xpath://button[@data-controls='next']
    Sleep    2

    ${4th_CTA}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[contains(@class,'hero-slide hero-slide--mfs')]//div)[1]
    IF    ${4th_CTA}
        
        Click Element    xpath:(//a[@class='button-cta track'])[4]
        Sleep    2
        Wait Until Element Is Visible     xpath://a[contains(@class,'button-cta button-cta-red')]    60s
        Sleep    2
        Capture Page Screenshot
    ELSE
        Log    "WARN:Club Crackers Image is not visible" 
    END

    #5th_CTA
    Click Element    xpath://img[@alt='Club Crackers']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@class='content_wrapper'])[3]    60s
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@class='promotions-featured-row']//a[1]
    Sleep    2
    ${5th_CTA}=    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@class='promotions-featured-row']//a[1]
    IF    ${5th_CTA}
        
        Click Element    xpath:(//span[@class='button-cta'])[1]
        Sleep    2
        Wait Until Element Is Visible     xpath://div[@class='recipe-list']    60s
        Capture Page Screenshot
    ELSE
        Log    "WARN:Club Crackers Image is not visible" 
    END

    #6th_CTA
    Click Element    xpath://img[@alt='Club Crackers']
    Sleep    2
    Wait Until Element Is Visible    xpath:(//div[@class='content_wrapper'])[3]    60s
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[@class='promotions-featured-row']//a[2]
    Sleep    2
    ${6th_CTA}=    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@class='promotions-featured-row']//a[2]
    IF    ${6th_CTA}
        
        Click Element    xpath:(//span[@class='button-cta'])[2]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${Insta}=    Run Keyword And Return Status    Element Should Be Visible    xpath:/(//div[@class='_ab1y _ab1z']//div)[1]
        IF    ${Insta}
            Capture Page Screenshot
            Wait Until Element Is Visible     xpath:(//div[@class='_ab1y _ab1z']//div)[1]    60s
        ELSE
            Capture Page Screenshot
            Log    "Instagram page is not visible"
        END
        Switch Window    main
    ELSE
        Log    "WARN:Club Crackers Image is not visible" 
    END

Homepage Footer
     
    Go To    https://www.clubcrackers.com/en_US/home.html
    Sleep    2
    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://img[@alt='Club Crackers']    60s
    Sleep    2

    # Home Navigation
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    ${is_footer_home_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[@data-tracking='footer|nav|footer-home']    60s
    IF    ${is_footer_home_visible}
        Click Element    xpath://a[@data-tracking='footer|nav|footer-home']
        Sleep    2
        ${is_club_img_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://img[@alt='Club Crackers']    60s
        IF    ${is_club_img_visible}
            Capture Page Screenshot
            Log To Console    "Successfully navigated to Home section."
        ELSE
            Log To Console    "Club Crackers image not visible after navigation."
        END
    ELSE
        Log To Console    "Footer Home link not visible."
    END

    # Recipes Navigation
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    ${is_recipes_link_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//a[@data-tracking='menu-nav|nav|recipes-link'])[2]    60s
    IF    ${is_recipes_link_visible}
        Click Element    xpath:(//a[@data-tracking='menu-nav|nav|recipes-link'])[2]
        Sleep    2
        ${is_recipes_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@class='recipe-list']    60s
        IF    ${is_recipes_list_visible}
            Capture Page Screenshot
            Log To Console    "Successfully navigated to Recipes section."
        ELSE
            Log To Console    "Recipes list not visible after navigation."
        END
    ELSE
        Log To Console    "Recipes link not visible."
    END

    # Products Navigation
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    ${is_footer_products_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[@data-tracking='footer|nav|footer-products']    60s
    IF    ${is_footer_products_visible}
        Click Element    xpath://a[@data-tracking='footer|nav|footer-products']
        Sleep    2
        ${is_products_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@class='products-list-product']    60s
        IF    ${is_products_list_visible}
            Capture Page Screenshot
            Log To Console    "Successfully navigated to Products section."
        ELSE
            Log To Console    "Products list not visible after navigation."
        END
    ELSE
        Log To Console    "Products link not visible."
    END

    # Where to Buy
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    ${is_buy_btn_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id:where-to-buy    60s
    IF    ${is_buy_btn_visible}
        Click Element    id:where-to-buy
        Sleep    2
        ${is_buy_select_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://label[@for='__ps-sku-selector-0_0']/following-sibling::select[1]    60s
        IF    ${is_buy_select_visible}
            Capture Page Screenshot
            Click Element    xpath://span[@data-ps-shift-tab='[data-ps-tab=".ps-lightbox-close"]']
            Sleep    2
            Log To Console    "Successfully checked 'Where to Buy' section."
        ELSE
            Log To Console    "Select box not visible in 'Where to Buy' section."
        END
    ELSE
        Log To Console    "Buy button not visible."
    END

    # Site Map
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    ${is_sitemap_link_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[normalize-space(text())='Site Map']    10s
    IF    ${is_sitemap_link_visible}
        Click Element    xpath://a[normalize-space(text())='Site Map']
        Sleep    2
        ${is_sitemap_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//div[contains(@class,'sitemapV2 aem-GridColumn')])[2]    60s
        IF    ${is_sitemap_list_visible}
            Capture Page Screenshot
            Log To Console    "Successfully navigated to Site Map section."
        ELSE
            Log To Console    "Site Map list not visible after navigation."
        END
    ELSE
        Log To Console    "Site Map link not visible."
    END

    # Contact Us
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    ${is_contact_us_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[@data-tracking='footer|nav|footer-contact-us']    60s
    IF    ${is_contact_us_visible}
        Click Element    xpath://a[@data-tracking='footer|nav|footer-contact-us']
        Sleep    2
        ${is_contact_section_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//section[@class='section--in-viewport'])[2]    10s
        IF    ${is_contact_section_visible}
            Capture Page Screenshot
            Log To Console    "Successfully navigated to Contact Us section."
        ELSE
            Log To Console    "Contact Us section not visible after navigation."
        END
    ELSE
        Log To Console    "Contact Us link not visible."
    END

    


    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    Sleep    2
    Wait Until Element Is Visible    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]    60s
    Sleep    2

    
    # Navigate to Social Link 1
    ${social_link_1}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@id='sociallinks']//a[1]    10s
    IF    ${social_link_1}
        Click Element    xpath://div[@id='sociallinks']//a[1]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${facebook}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//input[@name='email'])[2]    10s
        IF    ${facebook}
            Capture Page Screenshot
            Log To Console    "Email input is visible"
            Wait Until Element Is Visible    xpath:(//input[@name='email'])[2]    60s
            Click Element    xpath://div[@aria-label='Close']
            Sleep    2
        ELSE
            Log To Console    "Email input not visible"
        END
        Switch Window    main
        Sleep    2
    ELSE
        Log To Console    "Social Link 1 not visible"
    END

    # Navigate to Social Link 2
    ${social_link_2}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//div[@id='sociallinks']//a)[2]    10s
    IF    ${social_link_2}
        Click Element    xpath:(//div[@id='sociallinks']//a)[2]
        Sleep    5
        Switch Window    new
        Sleep    3
        ${Instagram}=    Run Keyword And Return Status    Element Should Be Visible    xpath://span[text()='See more from clubcrackersus']
        IF    ${Instagram}
            Capture Page Screenshot
            Wait Until Element Is Visible     xpath://span[text()='See more from clubcrackersus']    60s
            Log    "Instagram page is visible"
        ELSE
            Log    "Instagram page is not visible"
        END
        
        Switch Window    main
        Sleep    2
    ELSE
        Log To Console    "Social Link 2 not visible"
    END

    # Navigate to Social Link 3
    ${social_link_3}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//div[@id='sociallinks']//a)[3]    10s
    IF    ${social_link_3}
        Click Element    xpath:(//div[@id='sociallinks']//a)[3]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${youtube}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@id='page-header-banner-sizer']/yt-image-banner-view-model[1]/img[1]    10s
        IF    ${youtube}
            Capture Page Screenshot
            Log To Console    "YouTube banner is visible"
        ELSE
            Log To Console    "YouTube banner not visible"
        END
        Switch Window    main
        Sleep    2
    ELSE
        Log To Console    "Social Link 3 not visible"
    END

    # Navigate to Pinterest
    ${social_link_4}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//a[@data-tracking='socialLinks|linkout|pinterest'])[2]    10s
    IF    ${social_link_4}
        Click Element    xpath:(//a[@data-tracking='socialLinks|linkout|pinterest'])[2]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${pinterest}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://img[@alt='Club Crackers']    10s
        IF    ${pinterest}
            Capture Page Screenshot
            Log To Console    "Pinterest image is visible"
        ELSE
            Log To Console    "Pinterest image not visible"
        END
        Switch Window    main
        Sleep    2
    ELSE
        Log To Console    "Pinterest link not visible"
    END

    # Navigate to Twitter
    ${social_link_5}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//a[@data-tracking='socialLinks|linkout|twitter'])[2]    10s
    IF    ${social_link_5}
        Click Element    xpath:(//a[@data-tracking='socialLinks|linkout|twitter'])[2]
        Sleep    2
        Switch Window    new
        ${twitter}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//div[@data-viewportview='true']//div)[1]    10s
        IF    ${twitter}
            Log To Console    "Twitter viewport is visible."
            Wait Until Element Is Visible    xpath:(//div[@data-viewportview='true']//div)[1]    60s
            Capture Page Screenshot
            # Click Element    xpath:(//button[@type='button']//div)[1]
            Sleep    2
        ELSE
            Log To Console    "Twitter viewport not visible"
        END
        Switch Window    main
        Sleep    2
    ELSE
        Log To Console    "Twitter link not visible"
    END

    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    Wait Until Element Is Visible    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]    60s

    

    # Step 1: Validate and click the first link
    Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[1]    60s
    ${Link_1}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[1]
    IF    ${Link_1}    
        Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[1]
        Sleep    2
        Wait Until Element Is Visible    xpath://div[@role='alertdialog']    60s
        Capture Page Screenshot
        Click Element    xpath://button[@aria-label='Close']
        Sleep    2
        Log To Console    First link is visible
    ELSE    
        Log To Console    First link is not visible
    END
    # Step 2: Validate and click the second link
    Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[2]    60s
    ${Link_2}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[2]
    IF    ${Link_2}    
        Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[2]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${privacy_notice}=    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@id='otnotice-4fccfc07-c99f-4fed-96dd-27de30836495']/div[1]
        IF  ${privacy_notice}
            # Wait Until Element Is Visible    xpath://div[@id='otnotice-4fccfc07-c99f-4fed-96dd-27de30836495']/div[1]    60s
            Sleep    1
            Capture Page Screenshot
            
            Sleep    2
            Log To Console    Second link is visible
        END
        Switch Window    main
        Sleep    2
        
    ELSE    
        Log To Console    Second link is not visible
    END

    # Step 3: Validate and click the third link
    Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[3]    60s
    ${Link_3}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[3]
    IF    ${Link_3}    
        Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[3]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${us_privacy}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//section[@class='otnotice-section'])[1]
        IF  ${us_privacy}
            # Wait Until Element Is Visible    xpath:(//section[@class='otnotice-section'])[1]    60s
            Sleep    2
            Capture Page Screenshot
            Log To Console    Third link is visible
        END
        Switch Window    main
        Sleep    2
        
    ELSE    
        Log To Console    Third link is not visible
    END

    # Step 4: Validate and click the fourth link
    Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[4]    60s
    ${Link_4}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[4]
    IF    ${Link_4}    
        Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[4]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${Terms_of_use}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[@class='otnotice']//div)[1]
        IF  ${Terms_of_use}
            # Wait Until Element Is Visible    xpath:(//div[@class='otnotice']//div)[1]    60s
            Sleep    2
            Capture Page Screenshot
            
            Log To Console    Fourth link is visible
            
        END
        Switch Window    main
        Sleep    2
        
    ELSE    
        Log To Console    Fourth link is not visible
    END
    # Step 5: Validate and click the fifth link
    Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[5]    60s
    ${Link_5}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[5]
    IF    ${Link_5}    
        Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[5]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${Accessibility}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[@class='otnotice']//div)[1]
        IF  ${Accessibility}
            # Wait Until Element Is Visible    xpath:(//div[@class='otnotice']//div)[1]    60s
            Sleep    2
            Capture Page Screenshot
            
            Log To Console    Fifth link is visible
        END
        Switch Window    main
        Sleep    2
        
    ELSE    
        Log To Console    Fifth link is not visible
    END
    # Step 6: Validate and click the sixth link
    Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[6]    60s
    ${Link_6}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[6]
    IF    ${Link_6}   
        Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[6]
        Sleep    2
        Switch Window    new
        Sleep    2
        ${Persnoal_information}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[@class='otnotice']//div)[1]
        IF  ${Persnoal_information}
            Wait Until Element Is Visible    xpath:(//div[@class='otnotice']//div)[1]    60s
            Sleep    2
            Capture Page Screenshot
            
            Log To Console    Sixth link is visible
        END
        Switch Window    main
        Sleep    2
        
    ELSE    
        Log To Console    Sixth link is not visible
    END
    Copy Images    ${OUTPUT_DIR}    ${angvar('vm_path_dir')}
    Sleep	1

Handle Pop-up
    Wait Until Page Contains Element    ${BANNER_XPATH}    timeout=10
    ${actual_text}=    Get Text    ${BANNER_XPATH}
    Should Be Equal As Strings    ${actual_text}    ${EXPECTED_TEXT}
    Click Element    ${OK_BUTTON_XPATH}