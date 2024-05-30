*** Settings ***

Resource    ../base.robot

*** Variables ***
${BTN_LOGIN}        xpath=//android.view.ViewGroup[@content-desc="button-LOGIN"]


*** Keywords ***

Dado que estou na tela de login
    Click Element    ${ABA_LOGIN}

Quando preencho as informacoes de login
    [Arguments]    ${login}    ${password}
    Wait Until Element Is Visible    ${CAMPO_EMAIL}
    Input Text    ${CAMPO_EMAIL}        ${login}
    Input Text    ${CAMPO_PASSWORD}      ${password}
    Click Element    ${BTN_LOGIN}

Entao devo visualizar a tela de login com sucesso
    Wait Until Element Is Visible    ${CADASTRO_SUCESSO}
    Element Should Contain Text    ${CADASTRO_SUCESSO}    You are logged in!

Entao visualizo o aviso que a senha esta invalida
    Wait Until Element Is Visible    ${SENHA_INCORRETA}
    Element Should Contain Text      ${SENHA_INCORRETA}    Please enter at least 8 characters


Login varias vezes
    [Arguments]    ${login}    ${password}
    Dado que estou na tela de login
    Quando preencho as informacoes de login    ${login}    ${password}
    Verifica se o login foi feito com sucesso ou nao
    Close Application
    Abrir o aplicativo

Verifica se o login foi feito com sucesso ou nao
    FOR    ${index}    IN RANGE    1    10
    ${INCORRETA}=    Run Keyword And Return Status   Element Should Be Visible  ${SENHA_INCORRETA}
    ${STATUS}=    Run Keyword And Return Status    Element Should Be Visible    ${CADASTRO_SUCESSO}
        IF    '${STATUS}' == '${true}'
            Entao devo visualizar a tela de login com sucesso
        ELSE IF    '${INCORRETA}' =='${true}'
            Entao visualizo o aviso que a senha esta invalida
        END
    END


Teste nubank
    Wait Until Element Is Visible    //android.widget.Button[4]
    Click Element    //android.widget.Button[4]
    Wait Until Element Is Visible    //android.view.View[contains(@content-desc,"Sem custo")]    
    Element Attribute Should Match    //android.view.View[contains(@content-desc,"Sem custo")]   content-desc    Pix    true