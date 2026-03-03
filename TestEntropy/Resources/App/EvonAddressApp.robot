*** Settings ***

Resource    ../PO/LandingPage.robot
Resource    ../PO/EvonAddressPage.robot
Resource    ../Common/Utility.robot


*** Keywords ***
Load Evon page
    LandingPage.Load
    LandingPage.verify Evon address page is loaded

Submit All Addresses from a CSV
     [Arguments]                ${file_path_csv}
     ${records}=                   Utility.Read CSV File                   ${file_path_csv}
     FOR    ${row}      IN      @{records}[1:]     #As the 0th index row is header, start reading from 1st index
     EvonAddressPage.Submit The Evon Address Form And Verify Submission
     ...  ${row}[0]
     ...  ${row}[1]
     ...  ${row}[2]
     ...  ${row}[3]
     ...  ${row}[4]
     ...  ${row}[5]
     ...  ${row}[6]
     END

Submit All Addresses from a Json
    [Arguments]                ${file_path_json}

    ${data}=                    Utility.Read Json file                   ${file_path_json}
    ${records}=                 Set Variable    ${data}[addresses]
    FOR    ${user}      IN      @{records}
    EvonAddressPage.Submit The Evon Address Form And Verify Submission
         ...  ${user}[name]
         ...  ${user}[street]
         ...  ${user}[city]
         ...  ${user}[state]
         ...  ${user}[zip]
         ...  ${user}[country]
         ...  ${user}[phone]
         END
