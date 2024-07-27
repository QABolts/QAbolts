*** Settings ***
Documentation    Keyword for topbar component
Resource         ../../settings.resource


*** Variables ***
${TOPBAR_XPATH}=    //*[@class="oxd-topbar"]


*** Keywords ***
Click ${ITEM} On Topbar
    [Documentation]    Keyword to select item from the side panel
    Click Element    xpath=${TOPBAR_XPATH}    text=${ITEM}    type=link
