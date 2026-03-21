# Created by ankit at 20/03/26
*** Settings ***
Resource    ../PO/LandingPage.robot
Resource    ../PO/ProductsPage.robot
Resource  ../TestDataDir/TestData.robot


*** Keywords ***
App should be opened
    LandingPage.Page should be loaded properly

User should be able to fill form and click on lets shop
    LandingPage.Fill name, form and click on lets shop   ${GENERAL_NAME}    ${GENERAL_COUNTRY_NAME} 

User should be landing on products page
    ProductsPage.Product page loaded properly

User should be able to click on add to cart for first 2 products and the cart count should be 2
    ${actual_count}=    ProductsPage.User clicks on add to cart for first 2 products and check cart count is 2
    Should Be Equal As Strings    ${actual_count}    2    msg=Cart count mismatch!
    
