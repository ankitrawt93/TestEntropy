*** Settings ***
Documentation  This is a simple login testcase using Dictionary variable type
Resource            ../Resources/Common/Common.robot  # for Setup & Teardown
Resource            ../Resources/App/PracticeLoginApp.robot

Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***
${START_URL} =                          https://practicetestautomation.com/practice-test-login/

*** Test Cases ***
Login with valid credential
    PracticeLoginApp.User is landing on test Login page
    PracticeLoginApp.User logs in with Valid credentials

Login with invalid username
    PracticeLoginApp.User is landing on test Login page
    PracticeLoginApp.User logs in with Invalid username

Login with invalid password
    PracticeLoginApp.User is landing on test Login page
    PracticeLoginApp.User logs in with Invalid password
