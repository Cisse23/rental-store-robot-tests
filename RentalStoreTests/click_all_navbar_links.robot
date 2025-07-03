*** Settings ***
Library    Browser
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource


*** Variables ***
${login_page}    https://rentalstore.azurewebsites.net/


*** Test Cases ***
Navbar Test
    [Tags]    smoke    critical
    Open RentalStore Website
    Login To RentalStore    ${test_user}    ${test_password}
    Click All Links in Navbar


*** Keywords ***
Click All Links in Navbar
    [Documentation]    This test case demonstrates the use of for loops
    @{nav_links}    Get Elements    css=nav a.nav-link
    FOR    ${el}    IN    @{nav_links}
        Click    ${el}
        Log To Console    Clicked: ${el}
        Sleep    2
    END