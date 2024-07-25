*** Settings ***
Documentation      Initializes the framework, resources and components

# Library files
Library                 SeleniumLibrary
# Library                 resources/libs/QAboltsLibrary.py

# Resource files
Resource                resources/Keywords/keywords.resource
Resource                resources/pages.resource
Resource                resources/components.resource
Resource                resources/strings/en.resource

*** Variables ***
# Timeouts
${LONG_TIMEOUTS}        120s
${MEDIUM_TIMEOUT}       60s
${SHORT_TIMEOUT}        30s

${APPLICATION_URL}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${SELENIUM_HUB_URL}     http://localhost:4444/wd/hub
${BROWSER}              chrome
${APP_LANGUAGE}         en
${PAGE}                 ${EMPTY}


*** Keywords ***
Start Application
    [Documentation]    Opens the browser and navigate to the application
    Open Browser    url=${APPLICATION_URL}    browser=${BROWSER}    alias=app
    # ...    remote_url=${SELENIUM_HUB_URL}
    Maximize Browser Window

Close Application
    [Documentation]    Closes the current browser
    Close Browser



# Click
#     Click Element    