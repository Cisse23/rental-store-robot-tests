*** Settings ***
Resource    rentalstore.resource
Library    String


*** Variables ***
${user_name}    new user
${user_password}    new password

*** Test Cases ***
Create New Randomized User
    Open RentalStore Website
    Open Sign up Page
    ${random_number}    Generate Random String    3    chars=[NUMBERS]
    Sign up New RentalStore User    Kikka    ${random_number}nen    Kikka${random_number}    kikka.${random_number}@maili.fi    kikka${random_number}


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
    Sleep    5