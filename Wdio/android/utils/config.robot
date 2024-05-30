*** Settings ***

Resource    ../base.robot

*** Variables ***
${ANDROID_PLATFORMVERSION}              11  
${APP_PACKAGE}                          com.ricardodalarme.nubank_clone
${APP_ACTIVITY}                        .MainActivity
${ANDROID_AUTOMATION_NAME}             UIAutomator2
${PLATFORM_NAME}                       Android
${APPIUM_URL}                          http://127.0.0.1:4723            

*** Keywords ***

Abrir o aplicativo
    Open Application    ${APPIUM_URL}    automationName=${ANDROID_AUTOMATION_NAME}     platformName=${PLATFORM_NAME}    
    ...    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    platformVersion=${ANDROID_PLATFORMVERSION}

Fechar o aplicativo
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications