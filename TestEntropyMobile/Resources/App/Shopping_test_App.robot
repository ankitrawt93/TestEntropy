# Created by ankit at 20/03/26
*** Settings ***
Resource    ../PO/LandingPage.robot
Resource    ../PO/ProductsPage.robot
Resource  ../TestDataDir/TestData.robot


*** Keywords ***
App is opened
    LandingPage.Page should be loaded properly

User should be able to fill name and click on lets shop
    LandingPage.Fill name and click on lets shop    ${NAME}

User is landing on products page
    ProductsPage.Products Page should be loaded properly