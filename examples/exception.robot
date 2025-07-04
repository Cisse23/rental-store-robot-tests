*** Settings ***
Library    Browser
Resource    example.resource
Test Template    Login Test
Test Setup       Open Rentalstore Login Page
Test Teardown    Close browser


*** Test Cases ***
Test Login                             ${USER}    ${PASSWORD}    ${TRUE}
Test Login With Invalid Credentials    ${USER}    salasana       ${FALSE}


*** Keywords ***
Login And Return Status
    [Arguments]    ${username}    ${password}
    Type Text    id=id_username    ${username}
    Type Text    id=id_password    ${password}
    Click    //button[@type="submit"]
    TRY
        Wait For Elements State    id=logout    timeout=3
        VAR    ${status}    ${TRUE}
    EXCEPT    TimeoutError*    type=GLOB
        VAR    ${status}    ${FALSE}
    END
    RETURN    ${status}

Login Test
    [Arguments]    ${user}    ${password}    ${expected_result}
    ${status}    Login And Return Status    ${user}    ${password}
    Should Be Equal    ${status}    ${expected_result}

Open Rentalstore Login Page
    Open Rentalstore
    Go To    ${URL}/login
 