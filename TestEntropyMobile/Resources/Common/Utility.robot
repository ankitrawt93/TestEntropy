*** Settings ***
Library    OperatingSystem
Library    Collections
Library    String
Library    JSONLibrary
Library    OperatingSystem

*** Keywords ***
Read CSV File
    [Arguments]    ${file_path_csv}
    ${content}=    Get File    ${file_path_csv}
    ${lines}=    Split To Lines    ${content}
    ${data}=    Create List

    FOR    ${line}    IN    @{lines}
        ${row}=    Split String    ${line}    ,
        Append To List    ${data}    ${row}
    END
    RETURN    ${data}

Read JSON File
    [Arguments]    ${file_path_json}
    ${json_data}=    Load JSON From File    ${file_path_json}
    RETURN   ${json_data}
