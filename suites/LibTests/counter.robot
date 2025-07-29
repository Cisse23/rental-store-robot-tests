*** Settings ***
Library    ../libs/Counter.py


*** Test Cases ***
Get Counter Initial Value
    ${value}    Get Counter Value
    Log To Console    ${value}

Increment Counter Seven Times
    FOR    ${number}    IN RANGE    7
        Increment Counter
    END

Get Counter Value Again
    ${value}    Get Counter Value
    Log To Console    ${value}

Reset Counter And Ensure Value Is Zero
    Reset Counter
    ${value}=    Get Counter Value
    Should Be Equal As Integers    ${value}    0
