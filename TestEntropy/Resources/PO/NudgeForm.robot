*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Fill Nudge form and submit

    Click And Wait     id=footer-enquiry
    Wait Until Element Is Visible    id=nudge-chat-bot-wrap    15s
    Click And Wait    xpath=//li[.//input[@value='Motorcycle']]
    Wait Until Keyword Succeeds    10s    1s
        ...    Click Element    xpath=//ul[@class='vehicle-list']//li[.//input[@type='radio']]
    Wait Until Keyword Succeeds    10s    1s
        ...    Click Element    xpath=//ul[@class='nudge-chat-bot-listing vehicle-planning']//li[.//input[@type='radio']]
    Wait Until Keyword Succeeds    10s    1s
        ...    Click Element    xpath=//ul[@class='nudge-chat-bot-listing payment-mode']//li[.//input[@type='radio']]
    Input Text And Wait    name=customerName    ${NAME}
    Input Text And Wait    id=chat-bot-nudge-mobile    ${MOBILE}
    Input Text And Wait    id=chat-bot-nudge-email    ${EMAIL}
    Input Text And Wait    id=locationNudge    ${LOCATION}
    Wait Until Keyword Succeeds    10s    1s
                ...    Click Element   xpath=//div[@id='autocomplete-list-nudge']/div/div
    Wait Until Keyword Succeeds    10s    1s
                ...    Click Element    id=service-dealer-dropdown-nudge
    Wait Until Keyword Succeeds    10s    1s
            ...    Click Element    xpath=//div[@id='autocomplete-list-nudge-dealer']/div/div/div[2]
    Click And Wait    id=tnc
            Wait Until Keyword Succeeds    10s    1s
            ...    Click Element   xpath=//button[contains(@class,'submit')]

Verify nudge submission
    Wait Until Keyword Succeeds    10s    1s
    ...    Click Element   xpath=//button[contains(@class,'btn close')]

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
