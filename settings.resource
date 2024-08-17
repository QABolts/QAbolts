*** Settings ***
Documentation      Initializes the framework, resources and components

# Library files
Library                 resources/libs/tableutils.py
Library                 resources/libs/CustomSeleniumLibrary.py
Library                 resources/libs/SharedLibrary.py

# Resource files
Resource                resources/keywords/keywords.resource
Resource                resources/pages.resource
Resource                resources/components.resource
Resource                resources/strings/en.resource

Variables               resources/test_data/data.yaml

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
Open The OrangeHRM Live Demo URL
    [Documentation]    Opens the browser and navigate to the application
    CustomSeleniumLibrary.Open Browser    url=${APPLICATION_URL}    browser=${BROWSER}    alias=app
    ...    remote_url=${SELENIUM_HUB_URL}
    CustomSeleniumLibrary.Maximize Browser Window

Close Application
    [Documentation]    Closes the current browser
    CustomSeleniumLibrary.Close Browser
