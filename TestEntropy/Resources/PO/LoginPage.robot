# Created by ankit at 26/02/26
*** Settings ***
Resource    ..//App/PracticeLoginApp.robot
Library  SeleniumLibrary

*** Keywords ***

Login
    [Arguments]    ${credentials}
    Input Text And Wait    id=username    ${credentials}[Username]
    Input Text And Wait    id=password    ${credentials}[Password]
    Click And Wait                  id=submit


Verify Successfully login
    Wait until page contains        Logged In Successfully

Verify wrong password error
    Wait until page contains        Your password is invalid!

Verify wrong username error
    Wait until page contains        Your username is invalid!

*** Keywords ***
Click And Wait
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    15s
    Wait Until Element Is Enabled    ${locator}    15s
    Click Element                    ${locator}

Input Text And Wait
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}    15s
    Clear Element Text               ${locator}
    Input Text                       ${locator}    ${value}

open
    [Arguments]    ${element}
    Go To          ${element}

click
    Wait Until Element Is Visible    ${element}
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

#selectAndWait
#    [Arguments]        ${element}  ${value}
#    Select From List   ${element}  ${value}
#
#select
#    [Arguments]        ${element}  ${value}
#    Select From List   ${element}  ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}
