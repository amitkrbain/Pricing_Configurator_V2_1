*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    Test Case to verify User should either select existing or create a new client name.
    Verify Opportunity Page URL
    Verify Client Name Field
    Verify Industry Type Field Is Disabled
    Click Client Name
    Enter Client Name
    Verify Industry Type Field Is Enabled