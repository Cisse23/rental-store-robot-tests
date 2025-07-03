*** Settings ***
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource


*** Test Cases ***
User Can Sign In With Valid Credentials
    [Tags]    smoke
    Open RentalStore Website
    Login To RentalStore    ${test_user}    ${test_password}
    Click Logout

User Can NOT Sign In With Wrong Username
    Open RentalStore Website
    Login To RentalStore    Timon    ${test_password}
    Click Login

User Can NOT Sign In With Wrong Password
    Open RentalStore Website
    Login To RentalStore    ${test_user}    Pumba
    Click Login