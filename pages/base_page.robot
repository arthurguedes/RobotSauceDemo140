*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    cart_page.robot
Resource    inventory_item_page.robot
Resource    inventory_page.robot
Resource    login_page.robot

*** Variables ***
${timeout}    5000ms
${url}    https://www.saucedemo.com
${browser}    Chrome
${date}

*** Keywords ***
Abrir navegador
    Register Keyword To Run On Failure    Tirar Screenshot
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10000ms
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

Fechar navegador
    Sleep    500ms
    Close Browser

Clicar no carrinho
    Click Element    css=[data-test="shopping-cart-link"]
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    ${timeout}

Realizar Logout
    Click Element    id=react=burger-menu-btn
    Click Link    id=logout_sidebar_link
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

Obter Data e hora
    ${date} =    Get Current Date
    ${date} =    Convert Date    {date}    result_format=%Y.%m.%d_%H.%M.%S

Tirar Screenshot    
    [Arguments]    ${screenshot_name}
    ${date} =    Get Current Date
    ${date} =    Convert Date    {date}    result_format=%Y.%m.%d_%H.%M.%S
    Capture Page Screenshot    screenshots/${TEST_NAME}/${date}/${screenshot_name}.jpg







