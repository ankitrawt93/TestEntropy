# Created by ankit at 26/02/26
*** Settings ***
Documentation  This is a simple registration form testcase using Dictionaly variable type
Resource            ../Resources/App/PracticeApp.robot
Resource            ../Resources/Common/Common.robot
Resource            ../Resources/TestDataDir/TestData.robot

Library             String
Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***
${START_URL} =                          https://practice.expandtesting.com/register

*** Test Cases ***

User is able to Register
    PracticeApp.User is landing on register page
    PracticeApp.User is able to complete registration


