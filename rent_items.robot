*** Settings ***
Library    Browser
Resource    rentalstore.resource

*** Variables ***


*** Test Cases ***
Rent items
    Open RentalStore Website
    Login To RentalStore    timmy    timmy
    # Select first item in list of equipment
    Click    //*[@id="equipment-table"]/table/tbody/tr[1]/td[1]
    # Click rent-button
    Click Submit