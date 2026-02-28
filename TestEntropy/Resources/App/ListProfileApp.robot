# Created by ankit at 27/02/26
*** Settings ***
Resource    ../TestDataDir/TestData.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/SauceLogin.robot

*** Keywords ***
User is landing on login page
        LandingPage.load
        LandingPage.Verify Swag labs Page is Loaded

User is able to load all profiles
        [Arguments]    ${user}
            SauceLogin.Login with different profile    ${user}