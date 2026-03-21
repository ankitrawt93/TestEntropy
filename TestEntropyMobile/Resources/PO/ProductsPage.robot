# Created by ankit at 21/03/26
*** Settings ***
Library  AppiumLibrary


*** Keywords ***
Product page loaded properly
    Sleep    1s
    Wait Until Element Is Visible    id=com.androidsample.generalstore:id/toolbar_title    10s

User clicks on add to cart for first 2 products and check cart count is 2
    Click Element    android=new UiSelector().resourceId("com.androidsample.generalstore:id/productAddCart").instance(0)
    Sleep    1s
    Click Element    android=new UiSelector().resourceId("com.androidsample.generalstore:id/productAddCart").instance(1)
    Sleep    2s
    ${cart_count}=    Get Text    id=com.androidsample.generalstore:id/counterText
    RETURN    ${cart_count}
  