*** Settings ***
Documentation    Page header component
Resource         ../../settings.resource


*** Variables ***
${HEADER_TITLE}=    //*[contains(@class, 'topbar-header-title')]//*[text()='{}']


*** Keywords ***
Verify That The User Is Navigated To The ${PAGE_TITLE}
    [Documentation]    keyword to verify page title
    ${title_text}=    Get Text    xpath=${HEADER_TITLE.format('${PAGE_TITLE}')}
    Should Be Equal As Strings    first=${PAGE_TITLE}    second=${title_text}
