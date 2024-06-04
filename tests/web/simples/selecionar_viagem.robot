*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${url}    https://www.blazedemo.com/
${browser}    Chrome
${timeout}    5000ms

*** Test Cases ***
Selecionar viagem
    Dado que acesso o site Blaze Demo
    Quando seleciono a cidade
    E seleciono o destino 
    E clico no botao Find Flights 
    Entao sou direcionado para pagina de viagens
    Quando clico em uma viagem
    Entao sou direcionado para pagina da viagem correspondente
    Quando clico em purchase fight  
    Entao sou direcionado para pagina de agradecimento



*** Keywords ***
Dado que acesso o site Blaze Demo
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    2000ms


Quando seleciono a cidade
    Select From List By Value    name=fromPort    Paris

E seleciono o destino 
    Select From List By Value    name=toPort    Dublin

E clico no botao Find Flights 
    Click Button    //input[@value='Find Flights']

Entao sou direcionado para pagina de viagens
    Wait Until Element Is Visible    class=btn btn-small

Quando clico em uma viagem
    Click Button    class=btn btn-small


Entao sou direcionado para pagina da viagem correspondente
    Wait Until Element Is Visible    id=inputName

Quando clico em purchase fight
    Click Button    class=btn btn-primary

Entao sou direcionado para pagina de agradecimento
    Wait Until Element Is Visible    class=table
