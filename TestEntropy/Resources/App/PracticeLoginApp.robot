# Created by ankit at 26/02/26
*** Settings ***
Resource  ../PO/LandingPage.robot

Resource  ../PO/LoginPage.robot
Resource  ../TestDataDir/TestData.robot

*** Keywords ***

User is landing on test Login page
   LandingPage.Load
   LandingPage.Verify PTA Page is Loaded

User logs in with Valid credentials
   LoginPage.Login      ${ValidCredentials}
   LoginPage.Verify Successfully login

User logs in with Invalid username
   LoginPage.Login      ${InvalidCredentialsWrongUsername}
   LoginPage.Verify wrong username error

User logs in with Invalid password
   LoginPage.Login      ${InvalidCredentialsWrongPassword}
   LoginPage.Verify wrong password error