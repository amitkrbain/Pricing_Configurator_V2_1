*** Settings ***
Library   SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon


*** Test Cases ***
TC_001
    [Documentation]    Test Case to check if after clicking create new opportunity button user is navigated to create new opportunity page.
    Verify Opportunity Page URL
    Verify Bread Crumb
