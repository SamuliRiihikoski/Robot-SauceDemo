*** Settings ***
Resource            resource.robot

Suite Setup         Prepare Browser
#Suite Teardown      Close Browser 

Test Setup          Open Obstacle
Test Teardown       Verify Solved

*** Test Cases ***

TWINS
    [Tags]  12952
    Wait Until Page Contains Element    xpath=(//a[@id="id"])[2]
    Click Element                       xpath=(//a[@id="id"])[2]
    Verify Solved

Math
    [Tags]  32403
    ${first}     Get Text    id=no1
    ${second}     Get Text    id=no2
    ${operator}   Get Text    id=symbol1
    ${result}     Evaluate    ${first}${operator}${second}
    Input Text      id=result       ${result}

Wait a moment
    [Tags]  33678
    Click Button    id=one
    Wait Until Element Is Enabled   id=two      2 minutes
    Click Button    id=two

table search
    [Tags]  41036   EI-VALMIS   #Xpath ei jostain syystä toimi automaatiossa
    ${result}   Run Keyword And Return Status   table should contain    randomTable     15    
    Input Text   id=resulttext   ${result}