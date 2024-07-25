*** Settings ***
Documentation    Keyword for login functionality
Resource         ../../settings.resource


*** Variables ***
${SIDEPANEL_XPATH}=    //*[@class="oxd-sidepanel"]

*** Keywords ***
Select ${ITEM} From Side Panel
    [Documentation]    Keyword to select item from the side panel
    Click Element    xpath=${SIDEPANEL_XPATH}    text=${ITEM}    type=link
