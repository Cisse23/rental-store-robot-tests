*** Settings ***
Library    Browser
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource


*** Test Cases ***
Rent items
    Open RentalStore Website
    Login To RentalStore    ${test_user}    ${test_password}
    # Select first item in list of equipment
    Click    //*[@id="equipment-table"]/table/tbody/tr[1]/td[1]
    # Click rent-button
    Click Submit