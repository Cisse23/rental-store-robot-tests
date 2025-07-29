*** Settings ***
Resource    ../RentalStoreResources/rentalstore.resource
Library    String
Library    ../../libs/RandomNameLibrary.py
Test Setup    Open RentalStore Website
Test Teardown    Close Browser


*** Variables ***
${user_name}    new user
${user_password}    new password

*** Test Cases ***
User Can Open Sign Up Page
    [Tags]    smoke
    [Documentation]        This test checks if the Signup page can be opened 
    Open Sign up Page

User Can Create New Randomized User With RandomNameLibrary
    [Tags]    critical
    [Documentation]        This test uses randomized data to create a user that hopefully hasn't been created before
    ${random_firstname}    Get random firstname
    ${random_lastname}    Get random lastname
    ${random_number}    Get random number    3
    ${username}    Get Username    ${random_firstname}    3    ${random_lastname}    4
    Open Sign up Page
    Sign Up New RentalStore User    ${random_firstname}    ${random_lastname}    ${username}    ${random_firstname}.${random_lastname}@ema.il    ${random_firstname}${random_number}

User Can't Signup With Existing Username
    [Tags]    critical
    [Documentation]        This test ensures that the same username can't be used to create another user. 
    ...    Signup will fail, and an alert will be shown on the page.
    Open Sign up Page
    Sign up New RentalStore User    timmy    timmy    timmy    tim@my.mail    timmy
    ${alert_text}=    Get Text    css=div.alert.alert-danger
    Should Contain    ${alert_text}    Signup failed


*** Keywords ***
Open Sign Up Page
    [Documentation]        Click navbar element "signup" to open the Sign up page
    Click    //*[@id="signup"]

Sign Up New RentalStore User
    [Documentation]        Fill in all fields in the Sign up form
    [Arguments]    ${first_name}    ${last_name}    ${user_name}    ${user_email}    ${$user_password}
    Type Text    //*[@id="id_first_name"]    ${first_name}
    Type Text    //*[@id="id_last_name"]    ${last_name}
    Type Text    //*[@id="id_username"]    ${user_name}
    Type Text    //*[@id="id_email"]    ${user_email}
    Type Secret    //*[@id="id_password1"]    secret=$user_password
    Type Secret    //*[@id="id_password2"]    secret=$user_password
    Click Submit

User Can Create New Randomized User
    [Tags]    critical
    [Documentation]        This test is retired. This test uses randomized data to create a user that hopefully hasn't been created before
    Open Sign up Page
    ${random_number}    Generate Random String    3    chars=[NUMBERS]
    Sign up New RentalStore User    Kikka    ${random_number}nen    Kikka${random_number}    kikka.${random_number}@maili.fi    kikka${random_number}
