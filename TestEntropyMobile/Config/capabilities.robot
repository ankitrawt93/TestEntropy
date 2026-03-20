# Created by ankit at 20/03/26
*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${PLATFORM_NAME}        Android
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.androidsample.generalstore
${APP_ACTIVITY}         com.androidsample.generalstore.MainActivity
${AUTOMATION_NAME}      UiAutomator2

*** Keywords ***
