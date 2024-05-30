*** Settings ***
Resource    ../base.robot

Test Setup       Abrir o aplicativo
Test Teardown    Fechar o aplicativo

*** Test Cases ***
Login com sucesso
    Dado que estou na tela de login
    Quando preencho as informacoes de login    breno@automacao.com.br    123456789
    Entao devo visualizar a tela de login com sucesso

Tentativa de logar com email invalido
    Dado que estou na tela de login
    Quando preencho as informacoes de login    breno@auto   123456789
    Entao devo visualizar o aviso sobre email incorreto

Tentativa de logar com senha invalida
    Dado que estou na tela de login
    Quando preencho as informacoes de login    breno@automacao.com.br   1234
    Entao visualizo o aviso que a senha esta invalida
    
Teste rapido
    Teste nubank
