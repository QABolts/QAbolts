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
    Click Add Employee On Topbar

Enter The Employee First Name, last Name, and Other Required Details
    Input Text    text=${employee.valid.firstname}        placeholder=${FIRST_NAME_PLACEHOLDER}     clear=${True}
    Input Text    text=${employee.valid.middlename}       placeholder=${MIDDLE_NAME_PLACEHOLDER}    clear=${True}
    Input Text    text=${employee.valid.lastname}         placeholder=${LAST_NAME_PLACEHOLDER}      clear=${True}
    Input Text    text=${employee.valid.employee_id}      label=${EMPLOYEE_ID_LABEL}                clear=${True}

Click The "save" button
    Click Element    text=${SAVE_BUTTON_TEXT}    type=button    xpath=${EMPTY}

Verify that the employee is added to the employee list
    ${actual_text}=    Get Toast Message Text
    Should Contain    container=${actual_text}    item=${SUCCESSFULLY_SAVED}

New employee is already created in the system
    Open The OrangeHRM Live Demo URL
    Navigate To The PIM Module
    Click The Add Employee Button
    Enter The Employee First Name, last Name, and Other Required Details
    Click The "save" button
    Verify that the employee is added to the employee list
    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/auth/logout

Enter the employee's name in the search box.
    Input Text
    ...    label=${EMPLOYEE_NAME_LABEL}
    ...    text=${employee.valid.firstname} ${employee.valid.middlename} ${employee.valid.lastname}
    ...    clear=True

Enter the employee's ID in the search box.
    Input Text    label=${EMPLOYEE_ID_LABEL}    text=${employee.valid.employee_id}    clear=${True}

Click the "Search" button.
    Click Element    text=${SEARCH_BUTTON_TEXT}    type=button

Verify that the employee is displayed in the search results.
    Verify Table Values    
    ...    column_name=${EMPLOYEE_LIST_TABLE_FIRST_MIDDLE_NAME}
    ...    column_value=${employee.valid.firstname} ${employee.valid.middlename}
    Verify Table Values
    ...        column_name=${EMPLOYEE_LIST_TABLE_ID}
    ...        column_value=${employee.valid.employee_id}
