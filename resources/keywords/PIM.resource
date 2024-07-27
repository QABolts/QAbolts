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
    Input Text    text=john    placeholder=First Name    clear=True
    Input Text    text=mary    placeholder=Middle Name    clear=True
    Input Text    text=doe    placeholder=Last Name    clear=True
    Input Text    text=ID-1    label=Employee Id    clear=True

Click The "save" button
    [Documentation]    abc
    Click Element    text=Save    type=button    xpath=${EMPTY}

Verify that the employee is added to the employee list
    ${actual_text}=    Get Toast Message Text
    Should Contain    container=${actual_text}    item=Successfully Saved

New employee is already created in the system
    Open The OrangeHRM Live Demo URL
    Navigate To The PIM Module
    Click The Add Employee Button
    Enter The Employee First Name, last Name, and Other Required Details
    ${employee_id}=    Get Input Field Text    label=Employee Id
    Click The "save" button
    Verify that the employee is added to the employee list
    RETURN    ${employee_id}

Enter the employee's name in the search box.
    Input Text    label=Employee Name    text=john mary doe    clear=True

Enter the employee's ID in the search box.
    Input Text    label=Employee Id    text=0391ID-1    clear=True

Click the "Search" button.
    Click Element    text=Search    type=button

Verify that the employee is displayed in the search results.
    Verify Table Values    column_name=First (& Middle) Name    column_value=john mary
    Verify Table Values    column_name=Id    column_value=0391ID-1
