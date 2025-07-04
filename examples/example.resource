*** Settings ***
Library    Browser


*** Variables ***
${URL}    https://rentalstore.azurewebsites.net
${USER}    timmy
${PASSWORD}    timmy


*** Keywords ***
Open Rentalstore
    New Browser    chromium    headless=False
    New Page    ${URL}
 