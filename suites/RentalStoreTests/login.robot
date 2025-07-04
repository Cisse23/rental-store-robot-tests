*** Settings ***
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource
Test Setup    Open RentalStore Website

*** Test Cases ***
User Can Sign In With Valid Credentials
    [Tags]    smoke    critical
    [Documentation]    User Should be able to Sign in with valid username and password. 
    ...    Logout button will be visible after Sign in is succesful.
    Login To RentalStore    ${test_user}    ${test_password}
    Click Logout

User Can NOT Sign In With Wrong Username
    [Documentation]        If a user tries to log in with a username that does not exist, 
    ...    user will no be logged in and The Log in button will still be visible in the navigation bar. 
    [Tags]    critical
    Login To RentalStore    Timon    ${test_password}
    Click Login

User Can NOT Sign In With Wrong Password
    [Tags]    critical
    [Documentation]        If a user tries to log in using a valid username, but the wrong password, 
    ...    user will no be logged in and The Log in button will still be visible in the navigation bar. 
    Login To RentalStore    ${test_user}    Pumba
    Click Login