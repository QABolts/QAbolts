*** Settings ***
Resource            ../settings.resource
# Test Setup          Open the OrangeHRM Live demo URL
Test Teardown       Close Application


*** Test Cases ***
Validate Login with Valid Credentials
    [Documentation]    Validate Login with Valid Credentials
    [Tags]    TC01
    Open The OrangeHRM Live Demo URL
    Enter a valid username
    Enter a valid password
    Click The Login Button
    Verify That The User Is Navigated To The Dashboard

Validate Login with Invalid Credentials
    [Documentation]    Validate Login with Invalid Credentials
    [Tags]    TC02
    Open The OrangeHRM Live Demo URL
    Enter a invalid username
    Enter a invalid password
    Click The Login Button
    Verify That An Error Message Is Displayed    error_text=Invalid credentials

Validate Login With Empty Username
    [Documentation]    abc
    [Tags]    TC03
    Open The OrangeHRM Live Demo URL
    Leave the username field empty
    Enter a valid password
    Click The Login Button
    Verify Input Field Error Message    field_placeholder=Username    error_text=Required

Validate Login With Empty Password
    [Documentation]    abc
    [Tags]    TC04
    Open The OrangeHRM Live Demo URL
    Enter a valid username
    Leave the password field empty
    Click The Login Button
    Verify Input Field Error Message    field_placeholder=Password    error_text=Required

Validate Login With Empty Username and Password
    [Documentation]    abc
    [Tags]    TC05
    Open The OrangeHRM Live Demo URL
    Leave the username field empty
    Leave the password field empty
    Click The Login Button
    Verify Input Field Error Message    field_placeholder=Username    error_text=Required
    Verify Input Field Error Message    field_placeholder=Password    error_text=Required
