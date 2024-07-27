*** Settings ***
Documentation    Keyword for login functionality
Resource         ../../settings.resource


*** Keywords ***
Enter An Username
    [Documentation]    keyword to navigate to the url of the application
    [Arguments]    ${username}
    Input Text    label=Username   text=${username}

Enter An Password
    [Documentation]    keyword to navigate to the url of the application
    [Arguments]    ${password}
    Input Text    label=Password    text=${password}

Click The Login Button
    [Documentation]    keyword to navigate to the url of the application
    Click Element    text=Login    type=button

Click Forgot Your Password
    [Documentation]    keyword to navigate to the url of the application
    [Arguments]    ${text}
    Click Element    locator=${text}    type=button

Verify That An Error Message Is Displayed
    [Documentation]    abc
    [Arguments]    ${error_text}
    ${actual_text}=    Get Alert Error Text
    Should Be Equal    ${actual_text}    ${error_text}

Verify Input Field Error Message
    [Arguments]    ${error_text}    ${field_label}=${None}    ${field_placeholder}=${None}
    ${actual_text}=    Get Input Field Validation Error    placeholder=${field_placeholder}    label=${field_label}
    Should Be Equal    ${actual_text}    ${error_text}
