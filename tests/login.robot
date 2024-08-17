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
    Verify That An Error Message Is Displayed    error_text=${ALERT_ERROR_MESSAGE_INVALID_CREDENTIALS}

Validate Login With Empty Username
    [Documentation]    Validate Login With Empty Username
    [Tags]    TC03
    Open The OrangeHRM Live Demo URL
    Leave the username field empty
    Enter a valid password
    Click The Login Button
    Verify Input Field Error Message
    ...        field_placeholder=${USERNAME_FIELD_PLACEHOLDER}
    ...        error_text=${INPUT_FIELD_VALIDATION_ERROR_REQUIRED}

Validate Login With Empty Password
    [Documentation]    Validate Login With Empty Password
    [Tags]    TC04
    Open The OrangeHRM Live Demo URL
    Enter a valid username
    Leave the password field empty
    Click The Login Button
    Verify Input Field Error Message
    ...        field_placeholder=${PASSWORD_FIELD_PLACEHOLDER}
    ...        error_text=${INPUT_FIELD_VALIDATION_ERROR_REQUIRED}

Validate Login With Empty Username and Password
    [Documentation]    Validate Login With Empty Username and Password
    [Tags]    TC05
    Open The OrangeHRM Live Demo URL
    Leave the username field empty
    Leave the password field empty
    Click The Login Button
    Verify Input Field Error Message    field_placeholder=${USERNAME_FIELD_PLACEHOLDER}    error_text=${INPUT_FIELD_VALIDATION_ERROR_REQUIRED}
    Verify Input Field Error Message    field_placeholder=${PASSWORD_FIELD_PLACEHOLDER}    error_text=${INPUT_FIELD_VALIDATION_ERROR_REQUIRED}
