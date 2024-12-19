*** Settings ***
Library    SeleniumLibrary
Library    Collections
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
    ${Home_page_details}    Create List
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
                        ${CONTACT_US_MESSAGE}    Set Variable    Contact Us is NOT visible.
                        Log    ${CONTACT_US_MESSAGE}
                        Append To List    ${Home_page_details}    ${CONTACT_US_MESSAGE}
                    END
                ELSE
                    ${WHERE_TO_BUY_MESSAGE}    Set Variable    Where to Buy is NOT visible.
                    Log    ${WHERE_TO_BUY_MESSAGE}
                    Append To List    ${Home_page_details}    ${WHERE_TO_BUY_MESSAGE}
                END
            ELSE
                ${RECIPES_MESSAGE}    Set Variable    Recipes is NOT visible.
                Log    ${RECIPES_MESSAGE}
                Append To List    ${Home_page_details}    ${RECIPES_MESSAGE}
            END
        ELSE
            ${OUR_FOOD_MESSAGE}    Set Variable    Our Food is NOT visible.
            Log    ${OUR_FOOD_MESSAGE}
            Append To List    ${Home_page_details}    ${OUR_FOOD_MESSAGE}
        END
    ELSE

        ${LOGO_MESSAGE}    Set Variable    Logo is NOT visible.
        Log    ${LOGO_MESSAGE}
        Append To List    ${Home_page_details}    ${LOGO_MESSAGE}
    END
    

    #OUR FOOD
    ${OurProduct_topmenu}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//ul[@class='topmenu']//a)[1]    60s
    # ${Clicked_menu}    Create List
    IF    ${OurProduct_topmenu}
        Click Element    xpath:(//ul[@class='topmenu']//a)[1]
        Sleep    2
        ${is_products_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@class='products-list-product']    60s
        IF    ${is_products_list_visible}
            Log To Console    "Successfully navigated to Products Items."
        ELSE
            ${product_list}    Set Variable    Products list not visible after navigation.
            Log     ${product_list}
            Append To List    ${Home_page_details}    ${product_list}
        END
    ELSE
        ${product_link}    Set Variable    Products link not visible.
        Log To Console    ${product_link}
        Append To List    ${Home_page_details}    ${product_link}
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
            ${recipes_product}    Set Variable    Recipes list not visible after navigation
            Log    ${recipes_product}
            Append To List    ${Home_page_details}    ${recipes_product}
            
        END
    ELSE
        ${recipes_link}    Set Variable    Recipes link not visible
        Log    ${recipes_link}
        Append To List    ${Home_page_details}    ${recipes_link}
        
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
            ${Where to Buy}    Set Variable    Select box not visible in 'Where to Buy' section
            Log    ${Where to Buy}
            Append To List    ${Home_page_details}    ${Where to Buy}
            
        END
    ELSE
        ${Where to Buy_button}    Set Variable    Buy button not visible
        Log    ${Where to Buy_button}
        Append To List    ${Home_page_details}    ${Where to Buy_button}
        
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
            ${Contact Us_button}    Set Variable    Contact Us section not visible after navigation
            Log    ${Contact Us_button}
            Append To List    ${Home_page_details}    ${Contact Us_button}
            
        END
    ELSE
        ${Contact Us_link}    Set Variable    Contact Us link not visible
        Log    ${Contact Us_link}
        Append To List    ${Home_page_details}    ${Contact Us_link}
        
    END
    Log    ${Home_page_details}
    Set Global Variable    ${Home_page_details}
    Log To Console    **gbStart**check_menu**splitKeyValue**${Home_page_details}**gbEnd**

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
            ${prod_img}    Set Variable    WARN:Product image element is not visible
            Log    ${prod_img}
            Append To List    ${Home_page_details}    ${prod_img}
            
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
    ${all_CTA}    Create List
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
        ${first_CTA}    Set Variable    WARN:explore_sweet_hawaiian is not Visible
        Log    ${first_CTA}
        Append To List    ${all_CTA}    ${first_CTA}
         
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
        ${second _CTA}    Set Variable    WARN:Explore original is not visible
        Log    ${second _CTA}
        Append To List    ${all_CTA}    ${second _CTA}
         
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
        ${third_CTA}    Set Variable    WARN:2nd Explore original is not visible
        Log    ${third_CTA}
        Append To List    ${all_CTA}    ${third_CTA}
         
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
        ${forth_CTA}    Set Variable    WARN:Explore minis is not visible
        Log    ${forth_CTA}
        Append To List    ${all_CTA}    ${forth_CTA}
         
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
        ${fifth_CTA}    Set Variable    WARN:Checkout our recipes is not visible
        Log    ${fifth_CTA}
        Append To List    ${all_CTA}    ${fifth_CTA}
         
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
        Sleep    5
        
        Switch Window    main
    ELSE
        ${sixth_CTA}    Set Variable    WARN:keep up with club on instagram is not visible
        Log    ${fifth_CTA}
        Append To List    ${all_CTA}    ${sixth_CTA}
         
    END
    Log    ${all_CTA}
    Set Global Variable    ${all_CTA}
    Log To Console    **gbStart**check_CTA**splitKeyValue**${all_CTA}**gbEnd**
Homepage Footer
     
    Go To    https://www.clubcrackers.com/en_US/home.html
    Sleep    2
    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://img[@alt='Club Crackers']    60s
    Sleep    2

    # Home Navigation
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    ${is_footer_home_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[@data-tracking='footer|nav|footer-home']    60s
    ${footer_page}    Create List
    IF    ${is_footer_home_visible}
        Click Element    xpath://a[@data-tracking='footer|nav|footer-home']
        Sleep    2
        ${is_club_img_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://img[@alt='Club Crackers']    60s
        IF    ${is_club_img_visible}
            Capture Page Screenshot
            Log To Console    "Successfully navigated to Home section."
        ELSE
            ${club_image}    Set Variable    WARN:Club Crackers image not visible after navigation
            Log    ${club_image}
            Append To List    ${footer_page}    ${club_image}
            
        END
    ELSE
        ${home}    Set Variable    Footer Home link not visible
        Log    ${home}
        Append To List    ${footer_page}    ${home}
        
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
            ${recipes_list}    Set Variable    Recipes list not visible after navigation.
            Log    ${recipes_list}
            Append To List    ${footer_page}    ${recipes_list}
            
        END
    ELSE
        ${Recipes}    Set Variable    Recipes link not visible
        Log    ${Recipes}
        Append To List    ${footer_page}    ${Recipes}
        
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
            ${products_list}    Set Variable    Products list not visible after navigation
            Log    ${products_list}
            Append To List    ${footer_page}   ${products_list}
            
        END
    ELSE
        ${Products}    Set Variable    Products link not visible
        Log    ${Products}
        Append To List    ${footer_page}    ${Products}
        
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
            ${buy_select}    Set Variable    Select box not visible in 'Where to Buy' section
            Log    ${buy_select}
            Append To List    ${footer_page}    ${buy_select}
            
        END
    ELSE
        ${where_to_buy}    Set Variable    Where to Buy button not visible
        Log    ${where_to_buy}
        Append To List    ${footer_page}    ${where_to_buy}
        
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
            ${sitemap_list}    Set Variable    Site Map list not visible after navigation
            Log    ${sitemap_list}
            Append To List    ${footer_page}    ${sitemap_list}
            
        END
    ELSE
        ${site map}    Set Variable    Site Map link not visible
        Log    ${site map}
        Append To List    ${footer_page}    ${site map}
        
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
            ${contact_section}    Set Variable    Contact Us section not visible after navigation
            Log    ${contact_section}
            Append To List    ${footer_page}    ${contact_section}
            
        END
    ELSE
        ${Contact_Us}    Set Variable    Contact Us link not visible
        Log    ${Contact_Us}
        Append To List    ${footer_page}    ${Contact_Us}
        
    END
    


    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    Sleep    2
    Wait Until Element Is Visible    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]    60s
    Sleep    2

    
    # Navigate to Social Link 1
    ${social_link_1}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@id='sociallinks']//a[1]    10s
    # ${footer_social}    Create List
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
            ${f_email}    Set Variable    Email input not visible
            Log    ${f_email}
            Append To List    ${footer_page}    ${f_email}
            
        END
        Switch Window    main
        Sleep    2
    ELSE
        ${f_book}    Set Variable    Facebook link not visible
        Log    ${f_book}
        Append To List    ${footer_page}    ${f_book}
        
    END

    # Navigate to Social Link 2
    ${social_link_2}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//div[@id='sociallinks']//a)[2]    10s
    IF    ${social_link_2}
        Click Element    xpath:(//div[@id='sociallinks']//a)[2]
        Sleep    5
        Switch Window    new
        Sleep    7
        
        Switch Window    main
        Sleep    2
    ELSE
        ${insta}    Set Variable    instagram link not visible
        Log    ${insta}
        Append To List    ${footer_page}    ${insta}
        
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
            ${youtube_ban}    Set Variable    YouTube banner not visible
            Log    ${youtube_ban}
            Append To List    ${footer_page}    ${youtube_ban}
            
        END
        Switch Window    main
        Sleep    2
    ELSE
        ${y_tube}    Set Variable    youtube link not visible
        Log    ${y_tube}
        Append To List    ${footer_page}    ${y_tube}
        
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
            ${pint_img}    Set Variable    Pinterest image not visible
            Log    ${pint_img}
            Append To List    ${footer_page}    ${pint_img}
            
        END
        Switch Window    main
        Sleep    2
    ELSE
        ${pint}    Set Variable    Pinterest link not visible
        Log    ${pint}
        Append To List    ${footer_page}    ${pint}
        
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
            ${twit_view}    Set Variable    Twitter viewport not visible
            Log    ${twit_view}
            Append To List    ${footer_page}    ${twit_view}
            
        END
        Switch Window    main
        Sleep    2
    ELSE
        ${twit}    Set Variable    Twitter link not visible
        Log    ${pint}
        Append To List    ${footer_page}    ${pint}
        
    END
    

    Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
    Wait Until Element Is Visible    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]    60s

    

    # Step 1: Validate and click the first link
    Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[1]    60s
    ${Link_1}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[1]
    # ${footer_all_link}    Create List
    IF    ${Link_1}    
        Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[1]
        Sleep    2
        Wait Until Element Is Visible    xpath://div[@role='alertdialog']    60s
        Capture Page Screenshot
        Click Element    xpath://button[@aria-label='Close']
        Sleep    2
        Log To Console    First link is visible
    ELSE   
        ${cookies}    Set Variable    Cookie Preferences is not visible
        Log    ${cookies}
        Append To List    ${footer_page}    ${cookies} 
        
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
            Run Keyword And Ignore Error    Wait Until Keyword Succeeds    30s   2s    Click Element    locator=id:onetrust-accept-btn-handler
            Sleep    1
            Capture Page Screenshot
            
            Sleep    2
            Log To Console    Second link is visible
        END
        Switch Window    main
        Sleep    2
        
    ELSE    
        ${P_notice}    Set Variable    Privacy Notice is not visible
        Log    ${P_notice}
        Append To List    ${footer_page}    ${P_notice}
        
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
        ${privacy}    Set Variable    US Privacy is not visible
        Log    ${privacy}
        Append To List    ${footer_page}    ${privacy}
        
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
        ${terms_use}    Set Variable    Terms of Use is not visible
        Log    ${terms_use}
        Append To List    ${footer_page}    ${terms_use}
        
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
        ${Accessibility_link}    Set Variable    Accessibility is not visible
        Log    ${Accessibility_link}
        Append To List    ${footer_page}    ${Accessibility_link}
        
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
        ${Privacy Choices}    Set Variable    Your Privacy Choices is not visible
        Log    ${Privacy Choices}
        Append To List    ${footer_page}    ${Privacy Choices}
        
    END
    Log    ${footer_page}
    Set Global Variable    ${footer_page}
    Log To Console    **gbStart**Footer_total_link**splitKeyValue**${footer_page}**gbEnd**
    Copy Images    ${OUTPUT_DIR}    ${angvar('vm_path_dir')}

Handle Pop-up
    Wait Until Page Contains Element    ${BANNER_XPATH}    timeout=10
    ${actual_text}=    Get Text    ${BANNER_XPATH}
    Should Be Equal As Strings    ${actual_text}    ${EXPECTED_TEXT}
    Click Element    ${OK_BUTTON_XPATH}