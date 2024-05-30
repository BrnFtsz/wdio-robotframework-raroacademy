*** Settings ***

Library    RequestsLibrary
Library    FakerLibrary
Library    Collections

*** Keywords ***

Criar usuario na api ServerRest
    [Arguments]    ${status_code_esperado}
    ${email}    FakerLibrary.Email
    ${body}    Create Dictionary    nome=Fulano da Silva    email=${email}    password=123456    administrador=true
    Criar a sessao na api
    ${resposta}    POST On Session    ServeRest    url=/usuarios    json=${body}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
Criar a sessao na api
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Verifica a resposta
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key     ${RESPOSTA}    _id


Recebe os usuarios do endpoint GET
    [Arguments]    ${status_code}
    Criar a sessao na api
    ${resposta}    GET On Session    ServeRest    url=/usuarios
    Set Test Variable    ${GET}    ${resposta.json()}

Valida campo GET
    Dictionary Should Contain Key    ${GET}    quantidade
    Dictionary Should Contain Key    ${GET}    usuarios

  