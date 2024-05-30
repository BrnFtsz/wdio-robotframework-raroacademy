*** Settings ***
Resource    ../base.robot

Test Setup       Abrir o aplicativo
Test Teardown    Fechar o aplicativo

*** Test Cases ***
Teste swipe
    Dado que estou na tela de swipe
    Entao verifico os elementos
