*** Settings ***
Documentation  This is an ADDRESS submission form
Resource            ../Resources/Common/Common.robot  # for Setup & Teardown
Resource            ../Resources/App/PracticeLoginApp.robot
Resource            ../Resources/App/EvonAddressApp.robot

Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***
${START_URL} =                          http://54.161.107.30/index.php?option=com_sppagebuilder&view=page&id=199
${file_path_csv} =                          ${EXECDIR}/addresses.csv
${file_path_json} =                          ${EXECDIR}/addresses.json

#Before running these testcases make sure you have both CSV and Json files in your project root folder

*** Test Cases ***
Fill the form with all addresses from a csv file
    EvonAddressApp.Load Evon page
    EvonAddressApp.Submit All Addresses from a CSV         ${file_path_csv}


Fill the form with all addresses from a Json file
    EvonAddressApp.Load Evon page
    EvonAddressApp.Submit All Addresses from a Json         ${file_path_json}

