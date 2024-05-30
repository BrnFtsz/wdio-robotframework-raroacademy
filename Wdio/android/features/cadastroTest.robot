*** Settings ***
Resource    ../base.robot

Test Setup       Abrir o aplicativo
Test Teardown    Fechar o aplicativo
*** Variables ***


*** Test Cases ***

Cadastrar usuario com sucesso
    Dado que estou na tela de cadastro
    Quando preencho o formulario de cadastro    breno@automacao.com    12345678
    Entao o usuario e cadastrado com sucesso    

Tentativa de cadastrar usuario com email incorreto
    Dado que estou na tela de cadastro
    Quando preencho o formulario de cadastro    breno@automacao    12345678
    Entao devo visualizar o aviso sobre email incorreto

Tentativa de cadastrar usuario com senha incorreto
    Dado que estou na tela de cadastro
    Quando preencho o formulario de cadastro    breno@automacao.com    1234
    Entao devo visualizar o aviso sobre a senha fora do padrao desejado

Tentar logar varias vezes
    [Template]    Login varias vezes
    FOR    ${counter}    IN RANGE    1    
        breno.freitas@automacao.com    12345678
        tatiane@automacao.com          1234
        rarolabs@automacao.com         12345678
        tatiane5@automacao.com          1234
        tatian2e@automacao.com          1234
        rarolabs@automacao.com         12345678
    END