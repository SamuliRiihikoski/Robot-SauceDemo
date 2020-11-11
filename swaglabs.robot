*** Settings ***
Library     SeleniumLibrary     run_on_failure=Nothing

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      Chrome
${DRIVER}         rf-env/WebDriverManager/chrome/86.0.4240.22/chromedriver_win32/chromedriver.exe
${DELAY}          0

*** Test Cases ***
Test
    Prepare Browser
    Login   standard_user   secret_sauce
    Add Product     jacket
    Open Shopping Cart
    Checkout
    

*** Keywords ***
Prepare Browser
    Open Browser    ${URL}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Login
    [Arguments]     ${username}     ${password}
    Wait Until Page Contains Element    id=user-name
    Input Text      id=user-name        ${username} 
    Input Text      id=password         ${password}
    Click Button    id=login-button

Add Product
    [Arguments]     ${product}
    Wait Until Page Contains Element        xpath=//div[@class='inventory_item' and contains(.,'${product}')]//button
    Click Element           xpath=//div[@class='inventory_item' and contains(.,'${product}')]//button

Open Shopping Cart
    Wait Until Page Contains Element    xpath=//div[@id='shopping_cart_container']//a
    Click Element    xpath=//div[@id='shopping_cart_container']//a

Checkout
    Wait Until Page Contains Element    xpath=//div[@id='cart_contents_container']//a
    Click Element   xpath=//div[@id='cart_contents_container']//a[contains(.,'CHECKOUT')]
