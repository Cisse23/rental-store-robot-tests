*** Settings ***
Resource    rentalstore.resource


*** Test Cases ***
User Can Sign In with Valid Credentials
    Open RentalStore Website
    Login To RentalStore    timmy    timmy
    Sleep    5