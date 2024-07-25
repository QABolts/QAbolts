*** Settings ***
Documentation    Keyword for PIM page
Resource         ../../settings.resource


*** Variables ***
# ${SIDEPANEL_XPATH}=    //*[@class="oxd-sidepanel"]


*** Keywords ***
Navigate To The PIM Module
    [Documentation]    Keyword to navigate to PIM module
    Login To The Application
    Select PIM From Side Panel
    Verify That The User Is Navigated To The PIM

Click The Add Employee Button
    [Documentation]    abc
    Click Add Employee On Topbar

Enter The Employee First Name, last Name, and Other Required Details
    [Documentation]     abc
    Input Text    text=talib    placeholder=First Name    clear=True
    Input Text    text=husain    placeholder=Middle Name    clear=True
    Input Text    text=mukadam    placeholder=Last Name    clear=True

Click The "save" button
    [Documentation]    abc
    Click Element    text=Save    type=button    xpath=${EMPTY}
