*** Settings ***
Library    ../../libs/CsvLibrary.py    testitiedosto.csv


*** Test Cases ***
Test Library Creating File
    Create Empty File

Test Adding Column
    Add Column    *** Test Cases ***
    Add Column    \${username}
    Add Column    \${password}

Test Adding Data
    Add Line    Correct Credential    timmy    timmy
    Add Line    Wrong Username    timon    timmy

Test Reading Data
    ${data}    Read Data
    Log To Console    \n${data}