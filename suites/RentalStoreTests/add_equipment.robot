*** Settings ***
Library    Collections
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource


*** Variables ***
&{equipment}    name=Buster Helmet    manufacturer=Buster    year=1969    size=Small    category=Cycling    model=Junior    color=Graphite    condition=E    skill_level=B    description=Coolest helmet for juniors by Buster


*** Test Cases ***
User Can Open Add Equipment Page
    [Tags]    smoke
    [Documentation]        Click navbar element "add-equipment" to open the Add equipment page
    Open RentalStore Website
    Login To RentalStore    ${test_user}    ${test_password}
    Click    //*[@id="add-equipment"]

User Can Add New Equipment
    Open RentalStore Website
    Login To RentalStore    ${test_user}    ${test_password}
    Click    //*[@id="add-equipment"]

    Fill in Add Equipment Form    &{equipment}
    Click Submit

*** Keywords ***
Fill In Add Equipment Form
    [Documentation]    Fills in the form to add equiments
    [Arguments]    &{equipment}
    # Two textboxes with id_name in this form.
    Type Text    //*[@name="name"]    ${equipment}[name]
    Type Text    //*[@id="id_manufacturer"]    ${equipment}[manufacturer]
    Type Text    //*[@id="id_year"]    ${equipment}[year]
    Type Text    //*[@id="id_model"]    ${equipment}[model]
    Type Text    //*[@id="id_color"]    ${equipment}[color]
    Type Text    //*[@id="id_year"]    ${equipment}[year]
    Type Text    //*[@name="description"]    ${equipment}[description]
    Select Options By    //*[@id="id_category"]    label    ${equipment}[category] 
    Select Options By    //*[@id="id_size"]    label    ${equipment}[size]    
    
    Click    input[name="condition"][value="${equipment}[condition]"]
    Check Checkbox    input[name="skill_level"][value="${equipment}[skill_level]"]