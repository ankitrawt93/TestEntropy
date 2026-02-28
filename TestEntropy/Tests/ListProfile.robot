# Created by ankit at 27/02/26
*** Settings ***
Documentation  This is a user profile verification testcase which will pick users from list of users

Resource            ../Resources/Common/Common.robot  # for Setup & Teardown
Resource            ../Resources/App/ListProfileApp.robot
Resource            ../Resources/TestDataDir/TestData.robot

#used inside the testcase for multirun
#Test Setup          Common.Begin Web Test
#Test Teardown       Common.End Web Test

*** Variables ***
${START_URL} =                          https://www.saucedemo.com/

*** Test Cases ***
Login with all profiles
    [Tags]      Multiprofiles
    FOR    ${user}    IN    @{USERS}
        # Continues to next user even if this one fails
        Run Keyword And Continue On Failure    Run User Scenario    ${user}
    END

*** Keywords ***
Run User Scenario
    [Arguments]    ${user}
    Common.Begin Web Test
    ListProfileApp.User is landing on login page
    ListProfileApp.User is able to load all profiles    ${user}
    Log    ${user}
    # This teardown is CRITICAL to prevent browser crashes
    [Teardown]    Common.End Web Test
