# Created by ankit at 20/03/26
*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${PLATFORM_NAME}        Android
${DEVICE_NAME}          emulator-5554
${AUTOMATION_NAME}      UiAutomator2
${APP}                  ${EXECDIR}/../TestEntropy/TestEntropyMobile/APKs/General-Store.apk
${APP_PACKAGE}          com.androidsample.generalstore