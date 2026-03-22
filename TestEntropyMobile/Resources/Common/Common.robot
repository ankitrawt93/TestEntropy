*** Settings ***
Library    AppiumLibrary
Resource   ../../Config/capabilities.robot
Library    Process
Library    Collections
Library    String
Library    OperatingSystem

*** Keywords ***

# -------------------------
# Start Device (Emulator or Real Device)
# -------------------------
Start Device
    Run Keyword If    '${DEVICE_TYPE}'=='emulator'    Start Emulator
    ...    ELSE    Log To Console    Using Real Device: ${DEVICE_NAME}

# -------------------------
# Start Emulator (Dynamic AVD)
# -------------------------
Start Emulator
    Log To Console    Starting Mobile Emulator Setup
    ${avd}=    Get First AVD
    Start Emulator Process    ${avd}
    Wait For Emulator
    Set Suite Variable    ${DEVICE_NAME}    ${avd}   # update DEVICE_NAME dynamically
    Set Suite Variable    ${AVD}            ${avd}   # update AVD dynamically

# -------------------------
# Open Mobile Application
# -------------------------
Open Mobile Application
    Log To Console    Opening Mobile Application
    Run Keyword If    '${DEVICE_TYPE}'=='emulator'
    ...    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    automationName=${AUTOMATION_NAME}
    ...    avd=${AVD}
    ...    noReset=false
    ...    ELSE
    ...    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    automationName=${AUTOMATION_NAME}
    ...    udid=${UDID}
    ...    noReset=true

# -------------------------
# Clean Up
# -------------------------
Clean Up And Close
    Log To Console    Cleaning up Mobile Session
    Terminate Application    ${APP_PACKAGE}
    Close Application
    Run Keyword If    '${DEVICE_TYPE}'=='emulator'    Close Emulator

# -------------------------
# Emulator Helpers
# -------------------------
Get First AVD
    ${result}=    Run Process    emulator    -list-avds    shell=True
    ${lines}=     Split To Lines    ${result.stdout}
    ${avd}=       Set Variable    ${lines}[0]    # first available emulator
    Log To Console    Using Emulator: ${avd}
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

Close Emulator
    Log To Console    Closing Emulator
    Run Process    adb    -s    ${DEVICE_NAME}    emu    kill


Close Mobile Session
    Log To Console    Closing Appium Session
    # Close Application
    Run Process    adb    -s    emulator-5554    emu    kill  