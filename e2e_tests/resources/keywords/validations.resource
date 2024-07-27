*** Settings ***
Library    SeleniumLibrary
Resource    ../../settings.resource


*** Variables ***
${ALERT_MESSAGE_XPATH}=                //*[contains(@class,"oxd-alert-content-text")]
${INPUT_FIELD_VAALIDATION_XPATH}=      /ancestor::div[@class="oxd-form-row"]//span
${TOAST_MESSAGE_XPATH}=                //*[contains(concat(' ', normalize-space(@class), ' '), ' oxd-toast-content ')]


*** Keywords ***
Get Alert Error Text
    [Documentation]    abc
    ${actual_text}=    Get Text    xpath=${ALERT_MESSAGE_XPATH}
    RETURN    ${actual_text}

Get Input Field Validation Error
    [Documentation]    abc
    [Arguments]
    ...        ${label}=${None}
    ...        ${placeholder}=${None}
    ...        ${timeout}=${SHORT_TIMEOUT}
    IF    $label
        ${locator}=    Set Variable    ${INPUT_LABEL_XPATH.format('${label}')}${INPUT_FIELD_VAALIDATION_XPATH}
    END
    IF    $placeholder
        ${locator}=    Set Variable
        ...        ${INPUT_PLACEHOLDER_XPATH.format('${placeholder}')}${INPUT_FIELD_VAALIDATION_XPATH}
    END
    SeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}4
    ${actual_text}=    Get Text    xpath=${locator}
    RETURN    ${actual_text}

Get Toast Message Text
    [Documentation]    abc
    [Arguments]
    ...        ${timeout}=${SHORT_TIMEOUT}
    ${locator}=    Set Variable    ${TOAST_MESSAGE_XPATH}
    SeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}4
    ${actual_text}=    Get Text    xpath=${locator}
    RETURN    ${actual_text}

Get Input Field Text
    [Documentation]    wrapper to enter text in textbox
    [Arguments]
    ...    ${label}=${None}
    ...    ${placeholder}=${None}
    ...    ${timeout}=${SHORT_TIMEOUT}
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
    SeleniumLibrary.Get Text    locator=${locator}
