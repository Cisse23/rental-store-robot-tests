*** Settings ***
Library    Browser
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource


*** Test Cases ***
Rent Items
    [Tags]    smoke
    [Documentation]    This test checks that the user can click on the first item 
    ...    in the quipments list and rent that item. 
    Open RentalStore Website
    Login To RentalStore    ${test_user}    ${test_password}
    # Select first item in list of equipment
    Click    //*[@id="equipment-table"]/table/tbody/tr[1]/td[1]
    # Click rent-button
    Click Submit

    # User Who is NOT Logged In Can't Rent Items