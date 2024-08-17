*** Settings ***
Resource    ../../settings.resource


*** Variables ***
${ALERT_MESSAGE_XPATH}=                //*[contains(@class,"oxd-alert-content-text")]
${INPUT_FIELD_VALIDATION_XPATH}=       /ancestor::div[@class="oxd-form-row"]//span
${TOAST_MESSAGE_XPATH}=                //*[contains(concat(' ', normalize-space(@class), ' '), ' oxd-toast-content ')]


*** Keywords ***
Get Alert Error Text
    ${actual_text}=    Get Text    xpath=${ALERT_MESSAGE_XPATH}
    RETURN    ${actual_text}

Get Input Field Validation Error
    [Arguments]
    ...        ${label}=${None}
    ...        ${placeholder}=${None}
    ...        ${timeout}=${SHORT_TIMEOUT}
    IF    $label
        ${locator}=    Set Variable    ${INPUT_LABEL_XPATH.format('${label}')}${INPUT_FIELD_VALIDATION_XPATH}
    END
    IF    $placeholder
        ${locator}=    Set Variable
        ...        ${INPUT_PLACEHOLDER_XPATH.format('${placeholder}')}${INPUT_FIELD_VALIDATION_XPATH}
    END
    CustomSeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}4
    ${actual_text}=    Get Text    xpath=${locator}
    RETURN    ${actual_text}

Get Toast Message Text
    [Arguments]
    ...        ${timeout}=${SHORT_TIMEOUT}
    ${locator}=    Set Variable    ${TOAST_MESSAGE_XPATH}
    CustomSeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}4
    ${actual_text}=    Get Text    xpath=${locator}
    RETURN    ${actual_text}

Get Input Field Text
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
    CustomSeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Get Text    locator=${locator}
