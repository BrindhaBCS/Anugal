*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    kellanova.py
Library    string
Library    Collections

*** Variables ***
${URL}    ${angvar('clubcracker_url')}
${Browser}    ${angvar('clubcracker_browser')}

*** Keywords ***
Browser
    Open Browser    url=${URL}    browser=${Browser}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
Response_check
    ${Response_check}    Create List
    ${response_code}=    Execute JavaScript    return fetch("${URL}").then(response => response.status)
    Should Be Equal As Numbers    ${response_code}    200
    Log    Response Code: ${response_code}
    IF  '${response_code}' == '200'
        Log To Console    message=The application has successfully processed the request and returned a response with status code 200....
    ELSE
        ${AA}    Set Variable    WARN:The application did not load properly and returned an unexpected result..
        Log To Console    message=${AA}
        Append To List    ${Response_check}    ${AA}
        
    END
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    1 minute    2s    Click Element    locator=id:onetrust-accept-btn-handler

    Wait Until Keyword Succeeds    1 minute    2s    Click Element    locator=id:onetrust-accept-btn-handler
    ${Get_Cookies}    Get Cookies
    Set Global Variable    ${Response_check}
Page_title
    ${page_title}    Create List
    ${status}    Title_match
    IF  '${status}' == 'True'
        Log To Console    message=The title of the web application should match the expected value to ensure consistency, accuracy, and proper navigation within the interface.....
    ELSE
        ${AB}    Set Variable    WARN:The application does not match the expected title..
        Log To Console    message=${AB}
        Append To List    ${page_title}    ${AB}
    END
    Set Global Variable    ${page_title}
Our_Food_Menu
    ${Our_Food_Menu}    Create List
    ${ourfood}    Run Keyword And Return Status    Page Should Contain Element    locator=xpath://a[text()="Our Food"]
    IF  '${ourfood}' == 'True'
        Execute JavaScript  window.scrollBy(0, 800)
        Sleep    1
        Click Element    locator=xpath://a[text()="Our Food"]
        Sleep    1
        #productverfication 
        ${product_count}=    Get Element Count    xpath://div[@class='products-list-product']
        Log    Total products found: ${product_count}
        FOR    ${index}    IN RANGE    1    ${product_count + 1}
            ${a}    Run Keyword And Return Status    Page Should Contain Element    locator=xpath:(//div[@class='product-list-title bvValues'])[${index}]
            IF  '${a}' == 'True'
                Scroll Element Into View    locator=xpath:(//div[@class='product-list-title bvValues'])[${index}]
                Click Element    locator=xpath:(//div[@class='product-list-title bvValues'])[${index}]
                Capture Page Screenshot    filename=clube_crackers_29.png
                Sleep    1
                Go Back
                Sleep    1
            ELSE
                ${AC}    Set Variable    WARN:The productverfication element is currently not clickable due to page load or visibility issues...
                ${AC}    Log To Console    message=${AC}
                Append To List    ${Our_Food_Menu}    ${AC}
            END
        END

        #productimage verfication 
        Click Element    locator=xpath:(//div[@data-brandname='club_crackers'])[1]
        Sleep    1
        ${product_image}    Run Keyword And Return Status    Page Should Contain Image    locator=xpath:(//img[@alt='Club® Original Crackers'])[1]
        IF    '${product_image}' == 'True'
            #allproduct link verfication
            Capture Page Screenshot    filename=clube_crackers_30.png
            Click Element    locator=xpath://a[normalize-space(text())='All Products']
            Capture Page Screenshot    filename=clube_crackers_31.png
            Click Element    locator=xpath:(//div[@data-brandname='club_crackers'])[1]
            #description check
            ${descriptioncheck}    Run Keyword And Return Status    Page Should Contain Element    locator=xpath://p[@itemprop='description' and text()="Flaky and buttery with a hint of salt and a melt-in-your-mouth texture. Pair them with your favorite topping or not, because they're so good, you can leave the topping behind!"]
            Page Should Contain Element    locator=xpath://a[@aria-label='click to see where to buy']    message=Where to buy not cotains under that description..
            Capture Page Screenshot    filename=clube_crackers_32.png
            IF    '${descriptioncheck}' == 'True'
                #review_over
                Mouse Over    locator=xpath:(//button[@type='button'])[1]
                Capture Page Screenshot    filename=clube_crackers_33.png
                Mouse Out    locator=xpath:(//button[@type='button'])[1]

                #wheretobuy
                Click Element    locator=xpath://a[@aria-label='click to see where to buy']
                Wait Until Element Is Visible    locator=id:__ps-sku-selector-0_1    timeout=30s
                Page Should Contain Element    locator=id:__ps-sku-selector-0_1
                Page Should Contain Element    locator=id:__ps-sku-selector-1_1
                Capture Page Screenshot    filename=clube_crackers_34.png
                Sleep    1
                Input Text    locator=id:__ps-map-location-textbox_1    text=Orland Park, IL
                Sleep    1
                Click Element    locator=xpath://span[@aria-label='Search for this product by city or zip code.']
                Sleep    1
                Capture Page Screenshot    filename=clube_crackers_35.png
                Wait Until Element Is Visible    locator=xpath:(//span[contains(text(),'BUY NOW')])[1]    timeout=30s
                Sleep    2
                Scroll Element Into View    (//span[contains(text(),'BUY NOW')])[1]
                Sleep    2
                Click Element    locator=xpath:(//span[contains(text(),'BUY NOW')])[1]
                Sleep    1
                Capture Page Screenshot    filename=clube_crackers_36.png
                Switch Window    NEW
                Sleep    1
                Switch Window    main
                Sleep    3
                Click Element    locator=xpath:(//span[contains(text(),'VIEW ONLINE')])[1]
                Sleep    1
                Capture Page Screenshot    filename=clube_crackers_37.png
                Switch Window    NEW
                Sleep    1
                Switch Window    main
                Sleep    3
                Click Element    locator=xpath:(//span[contains(text(),'GET DIRECTIONS')])[2]
                Sleep    1
                Capture Page Screenshot    filename=clube_crackers_38.png
                Switch Window    NEW
                Sleep    1
                Switch Window    main
                Sleep    3
                Click Element    locator=xpath://span[@aria-label='Close the shop now shopping interface.']
                Sleep    1

                #Nutritionvalue
                Execute JavaScript  window.scrollBy(0, 700)
                Capture Page Screenshot    filename=clube_crackers_39.png
                Page Should Contain Element    locator=xpath://h2[normalize-space(text())='Nutrition']
                Page Should Contain Element    locator=xpath://h3[normalize-space(text())='Ingredients']
                Capture Page Screenshot    filename=clube_crackers_40.png

                #Sizeofpacket
                Scroll Element Into View    locator=id:gtin
                Click Element    locator=id:sizes
                Select From List By Index    id=sizes    1
                Sleep    1
                Capture Page Screenshot    filename=clube_crackers_41.png
                Click Element    locator=id:gtin

                #Nutrition Facts
                Switch Window    NEW
                Wait Until Keyword Succeeds    1 minute    2s    Click Element    locator=id:onetrust-accept-btn-handler
                Sleep    1
                Capture Page Screenshot    filename=clube_crackers_42.png
                Page Should Contain Element    locator=xpath://div[@class='product-header-netweight sub-header']
                Page Should Contain Element    locator=xpath://table[@class='nutrition-facts__table']
                Click Element    locator=xpath://div[normalize-space(text())='Ingredients']
                Capture Page Screenshot    filename=clube_crackers_43.png
                Sleep    1
                Click Element    locator=xpath://div[normalize-space(text())='Allergens']
                Capture Page Screenshot    filename=clube_crackers_44.png
                Sleep    1
                Click Element    locator=xpath://div[normalize-space(text())='About']
                Capture Page Screenshot    filename=clube_crackers_45.png
                Sleep    1
                Click Element    locator=xpath://div[normalize-space(text())='Company, Brand']
                Capture Page Screenshot    filename=clube_crackers_46.png
                Sleep    1
                Switch Window    main

                #review
                #shadow dom
                Scroll Element Into View    locator=xpath://div[@data-bv-show='reviews']
                Capture Page Screenshot    filename=clube_crackers_47.png
                Page Should Contain Element    locator=xpath://div[@data-bv-show='reviews']

                #people also tried
                Scroll Element Into View    locator=xpath://h2[normalize-space(text())='people also tried:']
                Page Should Contain Element    locator=xpath://h2[normalize-space(text())='people also tried:']
                Capture Page Screenshot    filename=clube_crackers_48.png
                Sleep    1

                # Execute JavaScript  window.scrollBy(0,600)
                Capture Page Screenshot    filename=clube_crackers_49.png
                Sleep    1
                Scroll Element Into View    locator=xpath:(//div[@class='product-list-title'])[1]
                Click Element    locator=xpath:(//div[@class='product-list-title'])[1]
                Capture Page Screenshot    filename=clube_crackers_50.png
                Sleep    1
                Go Back
                Sleep    1
                Scroll Element Into View    locator=xpath:(//div[@class='product-list-title'])[2]
                Click Element    locator=xpath:(//div[@class='product-list-title'])[2]
                Capture Page Screenshot    filename=clube_crackers_51.png
                Sleep    1
                Go Back
                Sleep    1
                Scroll Element Into View    locator=xpath:(//div[@class='product-list-title'])[3]
                Click Element    locator=xpath:(//div[@class='product-list-title'])[3]
                Capture Page Screenshot    filename=clube_crackers_52.png
                Sleep    1
                Go Back
                Sleep    1
                Execute JavaScript  window.scrollBy(0,100)
                Capture Page Screenshot    filename=clube_crackers_53.png
                Sleep    2    
                Wait Until Element Is Visible    locator=xpath://span[normalize-space()='Check Out Our Recipes!']    timeout=30s
                Page Should Contain Element    locator=xpath://span[normalize-space()='Check Out Our Recipes!']
                Capture Page Screenshot    filename=clube_crackers_54.png
                Sleep    1
                Wait Until Element Is Visible    locator=xpath://span[normalize-space()='Keep up with Club on Instagram!']    timeout=30s
                Click Element    locator=xpath://span[normalize-space()='Keep up with Club on Instagram!']
                Capture Page Screenshot    filename=clube_crackers_55.png
                Sleep    3
                Switch Window    main

                #Footer
                Execute JavaScript  window.scrollBy(0,600)
                Capture Page Screenshot
                Page Should Contain Element    locator=id:footerbvscipt    message=page doesnot contain this element
                Run Keyword And Return Status    Wait Until Element Is Visible    xpath://img[@alt='Club Crackers']    30s

                # Home Navigation
                Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
                ${is_footer_home_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[@data-tracking='footer|nav|footer-home']    30s
                IF    ${is_footer_home_visible}
                    Click Element    xpath://a[@data-tracking='footer|nav|footer-home']
                    Sleep    2
                    ${is_club_img_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://img[@alt='Club Crackers']    30s
                    IF    ${is_club_img_visible}
                        Capture Page Screenshot
                        Log To Console    "Successfully navigated to Home section."
                    ELSE
                        ${AD}    Set Variable    WARN:"Club Crackers image not visible after navigation."
                        Log To Console    message=${AD}
                        Append To List    ${Our_Food_Menu}    ${AD}
                    END
                ELSE
                    ${AE}    Set Variable    WARN:"Footer Home link not visible."
                    Log To Console    message=${AE}
                    Append To List    ${Our_Food_Menu}    ${AE}
                END

                # Recipes Navigation
                Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
                ${is_recipes_link_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//a[@data-tracking='menu-nav|nav|recipes-link'])[2]    30s
                IF    ${is_recipes_link_visible}
                    Click Element    xpath:(//a[@data-tracking='menu-nav|nav|recipes-link'])[2]
                    Sleep    2
                    ${is_recipes_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@class='recipe-list']    30s
                    IF    ${is_recipes_list_visible}
                        Capture Page Screenshot
                        Log To Console    "Successfully navigated to Recipes section."
                    ELSE
                        ${AF}    Set Variable    WARN:"Recipes list not visible after navigation."
                        Log To Console    message=${AF}
                        Append To List    ${Our_Food_Menu}    ${AF}
                    END
                ELSE
                    ${AG}    Set Variable    WARN:"Recipes link not visible."
                    Log To Console    message=${AG}
                    Append To List    ${Our_Food_Menu}    ${AG}
                END

                # Products Navigation
                Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
                ${is_footer_products_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[@data-tracking='footer|nav|footer-products']    30s
                IF    ${is_footer_products_visible}
                    Click Element    xpath://a[@data-tracking='footer|nav|footer-products']
                    Sleep    2
                    ${is_products_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://div[@class='products-list-product']    30s
                    IF    ${is_products_list_visible}
                        Capture Page Screenshot
                        Log To Console    "Successfully navigated to Products section."
                    ELSE
                        ${AH}    Set Variable    WARN:"Products list not visible after navigation."
                        Log To Console    message=${AH}
                        Append To List    ${Our_Food_Menu}    ${AH}
                    END
                ELSE
                    ${AI}    Set Variable    WARN:"Products link not visible."
                    Log To Console    message=${AI}
                    Append To List    ${Our_Food_Menu}    ${AI}
                END

                # Where to Buy
                Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
                ${is_buy_btn_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    id:where-to-buy    30s
                IF    ${is_buy_btn_visible}
                    Click Element    id:where-to-buy
                    Sleep    2
                    ${is_buy_select_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://label[@for='__ps-sku-selector-0_0']/following-sibling::select[1]    30s
                    IF    ${is_buy_select_visible}
                        Capture Page Screenshot
                        Click Element    xpath://span[@data-ps-shift-tab='[data-ps-tab=".ps-lightbox-close"]']
                        Sleep    2
                        Log To Console    "Successfully checked 'Where to Buy' section."
                    ELSE
                        ${AJ}    Set Variable    WARN:"Select box not visible in 'Where to Buy' section."
                        Log To Console    message=${AJ}
                        Append To List    ${Our_Food_Menu}    ${AJ}
                    END
                ELSE
                    ${AK}    Set Variable    WARN:"Buy button not visible."
                    Log To Console    message=${AK}
                    Append To List    ${Our_Food_Menu}    ${AK}
                END

                # Site Map
                Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
                ${is_sitemap_link_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[normalize-space(text())='Site Map']    10s
                IF    ${is_sitemap_link_visible}
                    Click Element    xpath://a[normalize-space(text())='Site Map']
                    Sleep    2
                    ${is_sitemap_list_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//div[contains(@class,'sitemapV2 aem-GridColumn')])[2]    30s
                    IF    ${is_sitemap_list_visible}
                        Capture Page Screenshot
                        Log To Console    "Successfully navigated to Site Map section."
                    ELSE
                        ${AL}    Set Variable    WARN:"Site Map list not visible after navigation."
                        Log To Console    message=${AL}
                        Append To List    ${Our_Food_Menu}    ${AL}
                    END
                ELSE
                    ${AM}    Set Variable    WARN:"Site Map link not visible."
                    Log To Console    message=${AM}
                    Append To List    ${Our_Food_Menu}    ${AM}
                END

                # Contact Us
                Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
                ${is_contact_us_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://a[@data-tracking='footer|nav|footer-contact-us']    30s
                IF    ${is_contact_us_visible}
                    Click Element    xpath://a[@data-tracking='footer|nav|footer-contact-us']
                    Sleep    2
                    ${is_contact_section_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//section[@class='section--in-viewport'])[2]    10s
                    IF    ${is_contact_section_visible}
                        Capture Page Screenshot
                        Log To Console    "Successfully navigated to Contact Us section."
                    ELSE
                        ${AN}    Set Variable    WARN:"Contact Us section not visible after navigation."
                        Log To Console    message=${AN}
                        Append To List    ${Our_Food_Menu}    ${AN}
                    END
                ELSE
                    ${AO}    Set Variable    WARN:"Contact Us link not visible."
                    Log To Console    message=${AO}
                    Append To List    ${Our_Food_Menu}    ${AO}
                END
                Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
                Sleep    2
                Wait Until Element Is Visible    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]    30s
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
                        Wait Until Element Is Visible    xpath:(//input[@name='email'])[2]    30s
                        Click Element    xpath://div[@aria-label='Close']
                        Sleep    2
                    ELSE
                        ${AP}    Set Variable    WARN:"Email input not visible"
                        Log To Console    message=${AP}
                        Append To List    ${Our_Food_Menu}    ${AP}
                    END
                    Switch Window    main
                    Sleep    2
                ELSE
                    ${AQ}    Set Variable    WARN:"Social Link 1 not visible"
                    Log To Console    message=${AQ}
                    Append To List    ${Our_Food_Menu}    ${AQ}
                END

                # Navigate to Social Link 2
                ${social_link_2}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath:(//div[@id='sociallinks']//a)[2]    10s
                IF    ${social_link_2}
                    Click Element    xpath:(//div[@id='sociallinks']//a)[2]
                    Sleep    5
                    Switch Window    new
                    Sleep    7
                    # ${Instagram}=    Run Keyword And Return Status    Element Should Be Visible    xpath://span[text()='See more from clubcrackersus']

                    # IF    ${Instagram}
                    #     Capture Page Screenshot
                    #     Wait Until Element Is Visible     xpath://span[text()='See more from clubcrackersus']    30s
                    # ELSE
                    #     ${AR}    Set Variable    WARN:"Instagram page is not visible"
                    #     Log To Console    message=${AR}
                    #     Append To List    ${Our_Food_Menu}    ${AR}
                    # END
                    
                    Switch Window    main
                    Sleep    2
                ELSE
                    ${AS}    Set Variable    WARN:"Social Link 2 not visible"
                    Log To Console    message=${AS}
                    Append To List    ${Our_Food_Menu}    ${AS}
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
                        ${AT}    Set Variable    WARN:"YouTube banner not visible"
                        Log To Console    message=${AT}
                        Append To List    ${Our_Food_Menu}    ${AT}
                    END
                    Switch Window    main
                    Sleep    2
                ELSE
                    ${AU}    Set Variable    WARN:"Social Link 3 not visible"
                    Log To Console    message=${AU}
                    Append To List    ${Our_Food_Menu}    ${AU}
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
                        ${AV}    Set Variable    WARN:"Pinterest image not visible"
                        Log To Console    message=${AV}
                        Append To List    ${Our_Food_Menu}    ${AV}
                    END
                    Switch Window    main
                    Sleep    2
                ELSE
                    ${AW}    Set Variable    WARN:"Pinterest link not visible"
                    Log To Console    message=${AW}
                    Append To List    ${Our_Food_Menu}    ${AW}
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
                        Wait Until Element Is Visible    xpath:(//div[@data-viewportview='true']//div)[1]    30s
                        Capture Page Screenshot
                        # Click Element    xpath:(//button[@type='button']//div)[1]
                        Sleep    2
                    ELSE
                        ${AX}    Set Variable    WARN:"Twitter viewport not visible"
                        Log To Console    message=${AX}
                        Append To List    ${Our_Food_Menu}    ${AX}
                    END
                    Switch Window    main
                    Sleep    2
                ELSE
                    ${AY}    Set Variable    WARN:"Twitter link not visible"
                    Log To Console    message=${AY}
                    Append To List    ${Our_Food_Menu}    ${AY}
                END

                Run Keyword And Ignore Error    Scroll Element Into View    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]
                Wait Until Element Is Visible    xpath://div[contains(@class,'footer aem-GridColumn')]//footer[1]    30s

                

                # Step 1: Validate and click the first link
                Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[1]    30s
                ${Link_1}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[1]
                IF    ${Link_1}    
                    Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[1]
                    Sleep    2
                    Wait Until Element Is Visible    xpath://div[@role='alertdialog']    30s
                    Capture Page Screenshot
                    Click Element    xpath://button[@aria-label='Close']
                    Sleep    2
                    Log To Console    First link is visible
                ELSE    
                    ${AZ}    Set Variable    WARN:First link is not visible
                    Log To Console    message=${AZ}
                    Append To List    ${Our_Food_Menu}    ${AZ}
                END

                # Step 2: Validate and click the second link
                Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[2]    30s
                ${Link_2}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[2]
                IF    ${Link_2}    
                    Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[2]
                    Sleep    2
                    Switch Window    new
                    Sleep    2
                    ${privacy_notice}=    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@id='otnotice-4fccfc07-c99f-4fed-96dd-27de30836495']/div[1]
                    IF  ${privacy_notice}
                        Run Keyword And Ignore Error    Wait Until Keyword Succeeds    30s   2s    Click Element    locator=id:onetrust-accept-btn-handler
                        # Wait Until Element Is Visible    xpath://div[@id='otnotice-4fccfc07-c99f-4fed-96dd-27de30836495']/div[1]    60s
                        Sleep    1
                        Capture Page Screenshot
                        
                        Sleep    2
                        Log To Console    Second link is visible
                    END
                    Switch Window    main
                    Sleep    2
                    
                ELSE    
                    ${BA}    Set Variable    WARN:Second link is not visible
                    Log To Console    message=${BA}
                    Append To List    ${Our_Food_Menu}    ${BA}
                END

                # Step 3: Validate and click the third link
                Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[3]    30s
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
                    ${BB}    Set Variable    WARN:Third link is not visible
                    Log To Console    message=${BB}
                    Append To List    ${Our_Food_Menu}    ${BB}
                END

                # Step 4: Validate and click the fourth link
                Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[4]    30s
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
                    ${BC}    Set Variable    WARN:Fourth link is not visible
                    Log To Console    message=${BC}
                    Append To List    ${Our_Food_Menu}    ${BC}
                END
                # Step 5: Validate and click the fifth link
                Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[5]    30s
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
                    ${BD}    Set Variable    WARN:Fifth link is not visible
                    Log To Console    message=${BD}
                    Append To List    ${Our_Food_Menu}    ${BD}
                END
                # Step 6: Validate and click the sixth link
                Wait Until Element Is Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[6]    30s
                ${Link_6}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//ul[@id='lowerfooterlinks']//a)[6]
                IF    ${Link_6}   
                    Click Element    xpath:(//ul[@id='lowerfooterlinks']//a)[6]
                    Sleep    2
                    Switch Window    new
                    Sleep    2
                    ${Persnoal_information}=    Run Keyword And Return Status    Element Should Be Visible    xpath:(//div[@class='otnotice']//div)[1]
                    IF  ${Persnoal_information}
                        Wait Until Element Is Visible    xpath:(//div[@class='otnotice']//div)[1]    30s
                        Sleep    2
                        Capture Page Screenshot
                        
                        Log To Console    Sixth link is visible
                    END
                    Switch Window    main
                    Sleep    2
                    
                ELSE    
                    ${BD}    Set Variable    WARN:Sixth link is not visible
                    Log To Console    message=${BD}
                    Append To List    ${Our_Food_Menu}    ${BD}
                END
            END
        ELSE
            ${BE}    Set Variable    WARN:Your product image will be missmatch..
            Log To Console    message=${BE}
            Append To List    ${Our_Food_Menu}    ${BE}
        END
    ELSE
        ${BF}    Set Variable    WARN:Our Food elements is missing on this page..
        Log To Console    message=${BF}
        Append To List    ${Our_Food_Menu}    ${BF}
    END
    Set Global Variable    ${Our_Food_Menu}
    Copy Images    ${OUTPUT_DIR}    ${angvar('vm_path_dir')}
        Sleep   1
    ${final}    Create List
    Append To List    ${final}    ${Response_check}
    Append To List    ${final}    ${page_title}
    Append To List    ${final}    ${Our_Food_Menu}
    Log To Console    **gbStart**OurfoodFailedoutput**splitKeyValue**${final}**gbEnd**
 
*** Keywords ***
Title_match
    ${Get_Window_Titles}    Get Window Titles
    ${condition}    Run Keyword And Return Status    Should Be Equal As Strings    first=${Get_Window_Titles}    second=['Buttery Crackers | Club® Crackers']
    [Return]    ${condition} 



