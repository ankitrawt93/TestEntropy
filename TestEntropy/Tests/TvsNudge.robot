*** Settings ***
Documentation  This is for TVS MX site for Nudge form submission using Scalar variable type
Resource            ../Resources/Common/Common.robot  # for Setup & Teardown
Resource            ../Resources/App/NudgeApp.robot  # for lower level keywords in test cases
Resource            ../Resources/TestDataDir/TestData.robot


Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***
${START_URL} =      http://uat-mexico.tvsmotor.net
#${START_URL} =      http://mexico.tvsmotor.com

*** Test Cases ***

User lands on home page and submits nudge form
    [Tags]  Nudge
    NudgeApp.Nudge Form Fill


