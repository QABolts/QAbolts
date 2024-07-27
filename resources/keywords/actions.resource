*** Settings ***
Library    SeleniumLibrary
Resource    ../../settings.resource


*** Variables ***
${INPUT_LABEL_XPATH}=            //label[text()="{}"]/../..//input
${INPUT_PLACEHOLDER_XPATH}=      //input[@placeholder="{}"]
${BUTTON_TEXT_XPATH}=            //button[text()[contains(.,'{}')]]
${LINK_TEXT_XPATH}=              //*[text()='{}']


*** Keywords ***
Input Text
    [Documentation]    wrapper to enter text in textbox
    [Arguments]
    ...        ${text}
    ...        ${label}=${None}
    ...        ${placeholder}=${None}
    ...        ${clear}=${False}
    ...        ${timeout}=${SHORT_TIMEOUT}
    IF    $label
        ${locator}=    Set Variable    ${INPUT_LABEL_XPATH.format('${label}')}
    END
    IF    $placeholder
        ${locator}=    Set Variable    ${INPUT_PLACEHOLDER_XPATH.format('${placeholder}')}
    END
    SeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}
    SeleniumLibrary.Input Text    locator=${locator}    text=${text}    clear=${clear}

Click Button
    [Documentation]    wrapper to enter text in textbox
    [Arguments]
    ...    ${text}=${None}
    ...    ${class}=${None}
    ...    ${timeout}=${SHORT_TIMEOUT}
    ...    ${modifier}=${None}

    IF    $text
        ${locator}=    Set Variable    ${BUTTON_TEXT_XPATH}
    END
    IF    $class
        ${locator}=    Set Variable    ${INPUT_PLACEHOLDER_XPATH.format('${class}')}
    END
    SeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}
    SeleniumLibrary.Click Button    locator=${locator}    modifier=${modifier}

Get Text
    [Documentation]    wrapper to enter text in textbox
    [Arguments]
    ...    ${xpath}
    ...    ${timeout}=${SHORT_TIMEOUT}
    SeleniumLibrary.Wait Until Page Contains Element    locator=${xpath}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${xpath} within ${timeout}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${xpath}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${xpath} within ${timeout}
    ${text}=    SeleniumLibrary.Get Text   locator=${xpath}
    RETURN    ${text}

Click Element
    [Documentation]    wrapper to enter text in textbox
    [Arguments]
    ...    ${text}
    ...    ${type}
    ...    ${xpath}=${EMPTY}
    ...    ${timeout}=${SHORT_TIMEOUT}
    IF    "${type}" == "button"
        ${locator}=    Set Variable    ${xpath}${BUTTON_TEXT_XPATH.format('${text}')}
    END
    IF    "${type}" == "link"
        ${locator}=    Set Variable    ${xpath}${LINK_TEXT_XPATH.format('${text}')}
    END
    SeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}
    SeleniumLibrary.Click Element    locator=${locator}
