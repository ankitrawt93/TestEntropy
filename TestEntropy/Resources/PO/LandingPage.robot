*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Load
    Go To                       ${START_URL}


Verify Page is Loaded
    Wait Until Element Is Visible    id=main-navbar   timeout=10s

Verify Swag labs Page is Loaded
    Wait until page contains    Swag Labs

Verify PTA Page is Loaded
    Wait until page contains    Test login

Verify Evon address page is loaded
    Wait until page contains    Evon Technologies Pvt. Ltd. © 2026. All Rights Reserved.




