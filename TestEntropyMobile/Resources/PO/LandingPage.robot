# Created by ankit at 20/03/26
*** Settings ***
Library  AppiumLibrary


*** Keywords ***
Page should be loaded properly
    Wait Until Element Is Visible    id=com.androidsample.generalstore:id/toolbar_title    10s

Fill name and click on lets shop
    [Arguments]    ${NAME}
    ${el1} =    Set Variable     id=com.androidsample.generalstore:id/nameField
    Input Text    ${el1}    ${NAME}
    ${el2} =    Set Variable     id=com.androidsample.generalstore:id/btnLetsShop
    Click Element    ${el2}

