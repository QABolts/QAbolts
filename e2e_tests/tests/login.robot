*** Settings ***
Resource            ../settings.resource
Test Setup          Start Application
Test Teardown       Close Application


*** Test Cases ***
Validate Login with Valid Credentials
    [Documentation]    a
    [Tags]    TC01
    # Open the OrangeHRM Live demo URL.
    Enter A Valid Username    Admin
    Enter A Valid Password    admin123
    Click The Login Button
    Verify That The User Is Navigated To The Dashboard

Validate Add Employee Functionality
    Navigate To The PIM Module
    Click The Add Employee Button
    Enter The Employee First Name, last Name, and Other Required Details
    Click The "save" button
    Sleep    10s
    # Verify that the employee is added to the employee list
