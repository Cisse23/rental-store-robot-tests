*** Settings ***
Resource    rentalstore.resource
Library    Collections


*** Variables ***
&{equipment}    name=Buster Helmet    manufacturer=Buster    year=1969    size=Small    category=Cycling    model=Junior    color=Graphite    condition=E    skill_level=B    description=Coolest helmet for juniors by Buster

*** Test Cases ***
Add New Equipment
    Open RentalStore Website
    Login To RentalStore    timmy    timmy
    Click    //*[@id="add-equipment"]
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

    Click Submit

