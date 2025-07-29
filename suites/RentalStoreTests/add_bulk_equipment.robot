# Library    DataDriver    bulk_equipment_test_data.csv
# pip install robotframework-datadriver
# https://docs.robotframework.org/docs/testcase_styles/datadriven
# https://github.com/Snooz82/robotframework-datadriver

*** Settings ***
Library    Collections
Library    DataDriver    file=bulk_equipment_test_data.csv
Resource    ../RentalStoreResources/rentalstore.resource
Resource    ../RentalStoreResources/secrets.resource
Test Template    Fill In Add Equipment Form
Test Setup    Set Up

*** Variables ***
&{equipment}    name=Buster Helmet    manufacturer=Buster    year=1969    size=Small    category=Cycling    model=Junior    color=Graphite    condition=E    skill_level=B    description=Coolest helmet for juniors by Buster

*** Test Cases ***
Placeholder Test Case    ${equipment_name}    ${manufacturer}    ${year}    ${model}    ${color}    ${description}    ${category}    ${size}    ${condition}    ${skill_level}


*** Keywords ***
Fill In Add Equipment Form
    [Documentation]    Fills in the form to add equiments
    [Arguments]    ${equipment_name}    ${manufacturer}    ${year}    ${model}    ${color}    ${description}    ${category}    ${size}    ${condition}    ${skill_level}
    # Two textboxes with id_name in this form.
    Type Text    //*[@name="name"]    ${equipment_name}
    Type Text    //*[@id="id_manufacturer"]    ${manufacturer}
    Type Text    //*[@id="id_year"]    ${year}
    Type Text    //*[@id="id_model"]    ${model}
    Type Text    //*[@id="id_color"]    ${color}
    Type Text    //*[@id="id_year"]    ${year}
    Type Text    //*[@name="description"]    ${description}
    Select Options By    //*[@id="id_category"]    label    ${category}
    Select Options By    //*[@id="id_size"]    label    ${size}
    
    Click    input[name="condition"][value="${condition}"]
    Check Checkbox    input[name="skill_level"][value="${skill_level}"]
    Click Submit

Set Up
    Open RentalStore Website
    Login To RentalStore    ${test_user}    ${test_password}
    Click    //*[@id="add-equipment"]