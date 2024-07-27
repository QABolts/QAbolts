*** Settings ***
Documentation    Keyword for login functionality
Resource         ../../settings.resource

*** Keywords ***
Login To The Application
    [Documentation]    Keyword for login to the application with valid creds
    Enter An Username    ${user.valid.username}
    Enter An Password    ${user.valid.password}
    Click The Login Button
    Verify That The User Is Navigated To The Dashboard

Enter a valid username
    [Documentation]    Action for entering valid username
    Enter An Username    ${user.valid.username}

Enter a valid password
    [Documentation]    Action for entering valid password
    Enter An Password    ${user.valid.password}

Enter a invalid username
    [Documentation]    Action for entering ivalid username
    Enter An Username    ${user.invalid.username}

Enter a invalid password
    [Documentation]    Action for entering invalid password
    Enter An Password    ${user.invalid.password}

Leave the username field empty
    [Documentation]    Action for leaving username empty
    Enter An Username    ${EMPTY}

Leave the password field empty
    [Documentation]    Action for leaving password empty
    Enter An Password    ${EMPTY}
