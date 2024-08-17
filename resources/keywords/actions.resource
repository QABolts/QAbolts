*** Settings ***
Resource    ../../settings.resource


*** Variables ***
${INPUT_LABEL_XPATH}=            //label[text()="{}"]/../..//input
${INPUT_PLACEHOLDER_XPATH}=      //input[@placeholder="{}"]
${BUTTON_TEXT_XPATH}=            //button[text()[contains(.,'{}')]]
${LINK_TEXT_XPATH}=              //*[text()='{}']


*** Keywords ***
Input Text
    [Documentation]    Cusom keyword to input text in a given input box
    ...    based on either placeholder value or label text
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
    CustomSeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Input Text    locator=${locator}    text=${text}    clear=${clear}

Click Button
    [Documentation]    Custom keyword to click button on a page based on button text
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
    CustomSeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Click Button    locator=${locator}    modifier=${modifier}

Get Text
    [Documentation]    Custom keyword to get text from a specific locator
    [Arguments]
    ...    ${xpath}
    ...    ${timeout}=${SHORT_TIMEOUT}
    CustomSeleniumLibrary.Wait Until Page Contains Element    locator=${xpath}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${xpath} within ${timeout}
    CustomSeleniumLibrary.Wait Until Element Is Visible    locator=${xpath}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${xpath} within ${timeout}
    ${text}=    CustomSeleniumLibrary.Get Text   locator=${xpath}
    RETURN    ${text}

Click Element
    [Documentation]    Custom keyword to click element based on text. Type of element is required.
    [Arguments]
    ...    ${text}
    ...    ${type}
    ...    ${xpath}=${EMPTY}
    ...    ${timeout}=${SHORT_TIMEOUT}
    ${current_url}=    CustomSeleniumLibrary.Get Location
    Append To Global Array    ${current_url}
    IF    "${type}" == "button"
        ${locator}=    Set Variable    ${xpath}${BUTTON_TEXT_XPATH.format('${text}')}
    END
    IF    "${type}" == "link"
        ${locator}=    Set Variable    ${xpath}${LINK_TEXT_XPATH.format('${text}')}
    END
    CustomSeleniumLibrary.Wait Until Page Contains Element    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not present on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Wait Until Element Is Visible    locator=${locator}
    ...        timeout=${timeout}
    ...        error=The element is not visible on the page with ${locator} within ${timeout}
    CustomSeleniumLibrary.Click Element    locator=${locator}
