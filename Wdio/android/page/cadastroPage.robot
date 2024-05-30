*** Settings ***

Resource    ../base.robot

*** Variables ***

${ABA_LOGIN}            xpath=//android.widget.TextView[@text="Login"]
${CADASTRO_USER}        xpath=//android.widget.TextView[@text="Sign up"]
${CAMPO_EMAIL}          xpath=//android.widget.EditText[@content-desc="input-email"]
${CAMPO_PASSWORD}       xpath=//android.widget.EditText[@content-desc="input-password"]
${CAMPO_PASSWORD2}      xpath=//android.widget.EditText[@content-desc="input-repeat-password"]
${BTN_CADASTRO}         xpath=//android.view.ViewGroup[@content-desc="button-SIGN UP"]
${CADASTRO_SUCESSO}     xpath=//android.widget.TextView[@resource-id="android:id/message"]
${EMAIL_INVALIDO}       xpath=//android.widget.TextView[@text="Please enter a valid email address"]
${SENHA_INCORRETA}      xpath=//android.widget.TextView[@text="Please enter at least 8 characters"]
${SENHA_INCORRETA2}     xpath=//android.widget.TextView[@text="Please enter the same password"]





*** Keywords ***

Dado que estou na tela de cadastro
    Aguarda e clica    ${ABA_LOGIN}
    Aguarda e clica    ${CADASTRO_USER}

Quando preencho o formulario de cadastro
    [Arguments]    ${login}    ${password}
    Input Text        ${CAMPO_EMAIL}      ${login}    
    Input Text        ${CAMPO_PASSWORD}    ${password}
    Input Text        ${CAMPO_PASSWORD2}   ${password}
    Click Element     ${BTN_CADASTRO} 

Entao o usuario e cadastrado com sucesso
    Wait Until Element Is Visible   ${CADASTRO_SUCESSO}
    Element Should Contain Text     ${CADASTRO_SUCESSO}    You successfully signed up!

Entao devo visualizar o aviso sobre email incorreto
    Wait Until Element Is Visible   ${EMAIL_INVALIDO}
    Element Should Contain Text     ${EMAIL_INVALIDO}    Please enter a valid email address

Entao devo visualizar o aviso sobre a senha fora do padrao desejado
    Wait Until Element Is Visible    ${SENHA_INCORRETA}
    Element Should Contain Text      ${SENHA_INCORRETA}    Please enter at least 8 characters
    Wait Until Element Is Visible    ${SENHA_INCORRETA2}
    Element Should Contain Text      ${SENHA_INCORRETA2}   Please enter the same password

