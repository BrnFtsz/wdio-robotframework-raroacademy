*** Settings ***

Resource    apiResource.robot


*** Test Cases ***
Teste criacao de usuario na API ServerRest
    Criar usuario na api ServerRest    201
    Verifica a resposta


Verificar retorno da Api GET
    Recebe os usuarios do endpoint GET    200
    Valida campo GET
