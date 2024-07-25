*** Settings ***
Documentation    Keyword for login functionality
Resource         ../../settings.resource


*** Keywords ***
Enter A Valid Username
    [Documentation]    keyword to navigate to the url of the application
    [Arguments]    ${text}
    Input Text    label=Username   text=${text}

Enter A Valid Password
    [Documentation]    keyword to navigate to the url of the application
    [Arguments]    ${password}
    Input Text    label=Password    text=${password}

Click The Login Button
    [Documentation]    keyword to navigate to the url of the application
    Click Element    text=Login    type=button

Click Forgot Your Password
    [Documentation]    keyword to navigate to the url of the application
    [Arguments]    ${type}    ${text}
    Click Element    locator=${text}    type=button

