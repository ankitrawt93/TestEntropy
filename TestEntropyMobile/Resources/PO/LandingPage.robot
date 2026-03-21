# Created by ankit at 20/03/26
*** Settings ***
Library  AppiumLibrary


*** Keywords ***
Page should be loaded properly
    Wait Until Element Is Visible    id=com.androidsample.generalstore:id/toolbar_title    10s

Fill name, form and click on lets shop
    [Arguments]    ${GENERAL_NAME}    ${GENERAL_COUNTRY_NAME} 
    Click Element    id=android:id/text1
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("${GENERAL_COUNTRY_NAME}"))   
    Input Text    id=com.androidsample.generalstore:id/nameField   ${GENERAL_NAME}  
    Click Element       id=com.androidsample.generalstore:id/btnLetsShop

