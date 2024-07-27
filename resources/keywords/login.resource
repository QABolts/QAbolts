*** Settings ***
Documentation    Keyword for login functionality
Resource         ../../settings.resource

*** Keywords ***
# Logout From The Application
#     [Documentation]    keyword to logout from the application
#     Click Hamburger Menu On The Header Component
#     Click Logout On The Header Component

# Open the OrangeHRM Live demo URL
#     [Documentation]    keyword to navigate to the url of the application
#     Input Text    locator=None        clear=True    text=abc

# Click the "Login" button
#     [Documentation]    keyword to navigate to the url of the application
#     QAboltsLibrary.Input Text    locator=abc    text=xyz    clear=True

# Verify that the user is navigated to the dashboard
#     [Documentation]    keyword to navigate to the url of the application
#     QAboltsLibrary.Input Text    locator=abc    text=xyz    clear=True

Login To The Application
    Enter An Username    Admin
    Enter An Password    admin123
    Click The Login Button
    Verify That The User Is Navigated To The Dashboard

Enter a valid username
    Enter An Username    Admin

Enter a valid password
    Enter An Password    admin123

Enter a invalid username
    Enter An Username    invalid

Enter a invalid password
    Enter An Password    invalid

Leave the username field empty
    Enter An Username    ${EMPTY}

Leave the password field empty
    Enter An Password    ${EMPTY}