# Created by ankit at 20/03/26
*** Settings ***
Documentation    Test suite for the General Store application shopping flow.
Resource         ../Resources/Common/Common.robot
Resource         ../Resources/App/Shopping_test_App.robot
Resource         ../Config/capabilities.robot
Library             AppiumLibrary

# This ensures the app opens automatically before the test starts
Test Setup       Setup Mobile Session
Test Teardown    Close Application

*** Test Cases ***
Verify App is opening and User Can Fill Form And Start Shopping
    Shopping_test_App.App is opened
    Shopping_test_App.User should be able to fill name and click on lets shop
    Shopping_test_App.User is landing on products page
