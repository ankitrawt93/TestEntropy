# Created by ankit at 21/03/26
*** Settings ***
Library  AppiumLibrary


*** Keywords ***
Products Page should be loaded properly
    Sleep    3s
    Wait Until Element Is Visible    id=com.androidsample.generalstore:id/toolbar_title    10s