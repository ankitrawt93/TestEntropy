*** Settings ***
Library    AppiumLibrary
Resource   ../../Config/capabilities.robot
Library    Process
Library    Collections
Library    String
Library    OperatingSystem


*** Keywords ***

Start Emulator
    Log To Console    Starting Mobile Setup
    ${avd}=    Get First AVD
    Start Emulator Process    ${avd}
    Wait For Emulator

Open Mobile Application
    Log To Console    Opening Mobile Application
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=Android Emulator
    ...    app=${APP}
    ...    automationName=${AUTOMATION_NAME}
    ...    noReset=false

 Clean Up And Close
    Terminate Application    ${APP_PACKAGE} 
    Close Application   

Get First AVD
    ${result}=    Run Process    emulator    -list-avds    shell=True
    ${lines}=     Split To Lines    ${result.stdout}
    ${avd}=       Set Variable    ${lines}[0]
    Log To Console    Using AVD: ${avd}
    RETURN    ${avd}

Start Emulator Process
    [Arguments]    ${avd}
    Log To Console    Starting Emulator: ${avd}
    Start Process    emulator    -avd    ${avd}

Wait For Emulator
    Log To Console    Waiting for device connection
    Run Process    adb    wait-for-device

    Log To Console    Checking Android boot
    Wait Until Keyword Succeeds    90s    3s    Boot Check

Boot Check
    ${result}=    Run Process    adb    shell    getprop    sys.boot_completed
    Should Contain    ${result.stdout}    1

Close Mobile Session
    Log To Console    Closing Appium Session
    # Close Application
    Run Process    adb    -s    emulator-5554    emu    kill
