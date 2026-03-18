*** Settings ***

Resource    ../PO/LandingPage.robot
Resource    ../PO/EvonAddressPage.robot
Resource    ../Common/Utility.robot

*** Keywords ***
Load Evon Form page
    LandingPage.Load
    LandingPage.verify Evon address page is loaded

Submit All Addresses from a CSV
     [Arguments]                ${file_path_csv}
     ${records}=                Utility.Read CSV File                   ${file_path_csv}
     ${index}=                  Set Variable    1
     FOR    ${row}      IN      @{records}[1:]     #As the 0th index row is header, start reading from 1st index
     EvonAddressPage.Fill all the Evon address forms
     ...  ${index}
     ...  ${row}[0]
     ...  ${row}[1]
     ...  ${row}[2]
     ...  ${row}[3]
     ...  ${row}[4]
     ...  ${row}[5]
     ...  ${row}[6]
     ${index}=    Evaluate    ${index} + 1
     END
     EvonAddressPage.Click Submit All Forms and verify success message

Submit All Addresses from a Json
    [Arguments]                 ${file_path_json}
    ${data}=                    Utility.Read Json file                   ${file_path_json}
    ${records}=                 Set Variable    ${data}[addresses]
    ${index}=                   Set Variable    1
    FOR    ${user}              IN      @{records}
    EvonAddressPage.Fill all the Evon address forms
    ...    ${index}
    ...  ${user}[name]
    ...  ${user}[street]
    ...  ${user}[city]
    ...  ${user}[state]
    ...  ${user}[zip]
    ...  ${user}[country]
    ...  ${user}[phone]
    ${index}=    Evaluate    ${index} + 1
    END
    EvonAddressPage.Click Submit All Forms and verify success message
