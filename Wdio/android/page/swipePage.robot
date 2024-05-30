*** Settings ***

Resource    ../base.robot


*** Variables ***
${SWIPE}             xpath=//android.widget.TextView[@text="Swipe"]
${GITHUB}            xpath=//android.widget.TextView[@text="FULLY OPEN SOURCE"]
${BALAOZIN}          xpath=//android.widget.TextView[@text="GREAT COMMUNITY"]
${JAVA_SCRIPT}       xpath=//android.widget.TextView[@text="JS.FOUNDATION"]
${YOUTUBE}           xpath=//android.widget.TextView[@text="SUPPORT VIDEOS"]
${MOTOR}             xpath=//android.widget.TextView[@text="EXTENDABLE"]
${3WAY}              xpath=//android.widget.TextView[@text="COMPATIBLE"]



*** Keywords ***

Dado que estou na tela de swipe
    Click Element    ${SWIPE} 


Entao verifico os elementos
   Wait Until Element Is Visible     ${GITHUB}
   Element Should Contain Text       ${GITHUB}    FULLY OPEN SOURCE
   Swipe By Percent    80    60    60    5    1500
   Wait Until Element Is Visible     ${BALAOZIN}
   Element Should Contain Text       ${BALAOZIN}   GREAT COMMUNITY
   Swipe By Percent    80    60    60    5    1500
   Wait Until Element Is Visible     ${JAVA_SCRIPT}
   Element Should Contain Text       ${JAVA_SCRIPT}   JS.FOUNDATION
   Swipe By Percent    80    60    60    5    1500
   Wait Until Element Is Visible     ${YOUTUBE}
   Element Should Contain Text       ${YOUTUBE}   SUPPORT VIDEOS
   Swipe By Percent    80    60    60    5    1500
   Wait Until Element Is Visible     ${MOTOR}
   Element Should Contain Text       ${MOTOR}   EXTENDABLE
   Swipe By Percent    80    60    60    5    1500
   Wait Until Element Is Visible     ${3WAY} 
   Element Should Contain Text       ${3WAY}    COMPATIBLE