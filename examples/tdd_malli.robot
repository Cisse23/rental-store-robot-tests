*** Settings ***
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource
Test Setup       Open RentalStore Website
Test Template    Login With Invalid Credentials Should Fail
Test Teardown    Close Page


*** Test Cases ***                USERNAME         PASSWORD
Invalid User Name                 invalid          ${test_password}
Invalid Password                  ${test_user}    invalid
Invalid User Name and Password    invalid          invalid
Empty User Name                   ${EMPTY}         ${test_password}
Empty Password                    ${test_user}    ${EMPTY}
Empty User Name and Password      ${EMPTY}         ${EMPTY}


*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Login To RentalStore    ${USERNAME}    ${PASSWORD}
    Click Login

