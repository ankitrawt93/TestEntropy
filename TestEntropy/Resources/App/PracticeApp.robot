# Created by ankit at 26/02/26
*** Settings ***

Resource            ../PO/RegisterPage.robot
Resource            ../PO/LandingPage.robot
Resource            ../TestDataDir/TestData.robot

*** Keywords ***

User is landing on register page
    LandingPage.load
    LandingPage.Verify Page is Loaded

User is able to complete registration
    RegisterPage.Register
