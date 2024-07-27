*** Settings ***
Resource            ../settings.resource
# Test Setup          Open the OrangeHRM Live demo URL
Test Teardown       Close Application


*** Test Cases ***
Validate Add Employee Functionality
    Open The OrangeHRM Live Demo URL
    Navigate To The PIM Module
    Click The Add Employee Button
    Enter The Employee First Name, last Name, and Other Required Details
    Click The "save" button
    Verify that the employee is added to the employee list

Validate Search Employee by Name
    ### Prerequisite - Employee is already created in the system
    New employee is already created in the system
    ### Test Steps
    Open The OrangeHRM Live Demo URL
    Navigate To The PIM Module
    Enter the employee's name in the search box.
    Click the "Search" button.
    Verify that the employee is displayed in the search results.

Validate Search Employee by ID 
    ### Prerequisite - Employee is already created in the system
    New employee is already created in the system
    ### Test Steps
    Open The OrangeHRM Live Demo URL
    Navigate To The PIM Module
    Enter the employee's ID in the search box.
    Click the "Search" button.
    Verify that the employee is displayed in the search results.
