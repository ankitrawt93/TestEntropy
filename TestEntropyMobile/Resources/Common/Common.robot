*** Settings ***
Library  AppiumLibrary
Resource    ../../Config/capabilities.robot

*** Variables ***


*** Keywords ***
Setup Mobile Session
    Log to console    Starting Appium Session
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    ...    noReset=false

