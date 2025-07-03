*** Settings ***
Library    Browser
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource


*** Variables ***
${login_page}    https://rentalstore.azurewebsites.net/


*** Test Cases ***
Navbar Test
    [Tags]    smoke    critical
    [Documentation]        This test tries to click each item in the navigation bar element
    Open RentalStore Website
    Login To RentalStore    ${test_user}    ${test_password}
    Click All Links in Navbar


*** Keywords ***
Click All Links in Navbar
    [Documentation]    Get all navigation bar elements and click through them
    @{nav_links}    Get Elements    css=nav a.nav-link
    FOR    ${el}    IN    @{nav_links}
        Click    ${el}
        Log To Console    Clicked: ${el}
        Sleep    2
    END