*** Settings ***
Resource    ../RentalStoreResources/rentalstore.resource
Library    String
Test Setup    Open RentalStore Website
Test Teardown    Close Browser


*** Variables ***
${user_name}    new user
${user_password}    new password

*** Test Cases ***
User Can Open Sign up Page
    [Tags]    smoke
    Open Sign up Page

User Can Create New Randomized User
    Open Sign up Page
    ${random_number}    Generate Random String    3    chars=[NUMBERS]
    Sign up New RentalStore User    Kikka    ${random_number}nen    Kikka${random_number}    kikka.${random_number}@maili.fi    kikka${random_number}

User Can't Signup With Existing Username
    Open Sign up Page
    Sign up New RentalStore User    timmy    timmy    timmy    t@immy.mail    timmy
    ${alert_text}=    Get Text    css=div.alert.alert-danger
    Should Contain    ${alert_text}    Signup failed

*** Keywords ***
Open Sign up Page
    Click    //*[@id="signup"]

Sign up New RentalStore User
    [Arguments]    ${first_name}    ${last_name}    ${user_name}    ${user_email}    ${$user_password}
    Type Text    //*[@id="id_first_name"]    ${first_name}
    Type Text    //*[@id="id_last_name"]    ${last_name}
    Type Text    //*[@id="id_username"]    ${user_name}
    Type Text    //*[@id="id_email"]    ${user_email}
    Type Secret    //*[@id="id_password1"]    secret=$user_password
    Type Secret    //*[@id="id_password2"]    secret=$user_password
    Click Submit
