*** Settings ***
Library    Browser

*** Variables ***
${url}    https://rentalstore.azurewebsites.net/

*** Keywords ***
Open RentalStore Website
    [Arguments]    ${browser}=chromium
    New Browser    ${browser}    headless=False
    # headless = browser operates in the background
    New Page    ${url}

Login To RentalStore
    [Arguments]    ${user}    ${password}
    Click    id=login
    Type Text    //*[@id="id_username"]    ${user}
    Type Secret    //*[@id="id_password"]    secret=$password
    Click    //*[@type="submit"]

Open RentalStore Website and Login
    [Arguments]    ${user}    ${password}
    New Browser    browser=chromium    headless=False
    New Page    ${url}
    Click    id=login
    Type Text    //*[@id="id_username"]    ${user}
    Type Secret    //*[@id="id_password"]    secret=$password
    Click    //*[@type="submit"]

Click Submit
    Click    //*[@type="submit"]

Click Login
    Click    //*[@id="login"]

Click Logout    
...    Click    //*[@id="logout"]