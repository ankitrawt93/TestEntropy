*** Settings ***
Documentation    Test suite for the General Store application shopping flow.

Resource         ../Resources/Common/Common.robot
Resource         ../Resources/App/Shopping_test_App.robot

Suite Setup      Start Device
Suite Teardown   Close Mobile Session

Test Setup       Open Mobile Application
Test Teardown    Clean Up And Close


*** Test Cases ***

Verify App is opening, User Can Fill Form And lands on product page
    Shopping_test_App.App should be opened
    Shopping_test_App.User should be able to fill form and click on lets shop
    Shopping_test_App.User should be landing on products page


# Verify user is able to add 2 items in cart
#     Shopping_test_App.App should be opened
#     Shopping_test_App.User should be able to fill form and click on lets shop
#     Shopping_test_App.User should be landing on products page    
#     Shopping_test_App.User should be able to click on add to cart for first 2 products and the cart count should be 2
