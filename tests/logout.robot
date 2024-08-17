*** Settings ***
Resource            ../settings.resource
# Test Setup          Open the OrangeHRM Live demo URL
Test Teardown       Close Application


*** Test Cases ***
Validate Logout Functionality  
    [Documentation]    Validate Login with Valid Credentials
    [Tags]    TC06
    Open The OrangeHRM Live Demo URL
    Login To The Application
    Click on the user profile icon.
    Click the "Logout" button.
    Verify that the user is logged out and navigated to the login page.
