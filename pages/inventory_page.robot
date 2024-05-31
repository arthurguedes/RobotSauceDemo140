*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${titulo_secao}    css=.title

*** Keywords ***
Clicar no produto
    [Arguments]    ${product_name}
    ${imagem_produto}    css=img[alt="${product_name}"]
    

