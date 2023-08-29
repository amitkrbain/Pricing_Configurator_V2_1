*** Settings ***
Library   SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    This test case will verify whether the application navigates to opportunities page after clicking on Opportunities Bread Crumb.
    Verify Opportunity Page URL
    Click Bread Crumb Opportunities
    Verify Opportunities Page URL

TC_002
    [Documentation]    This test case will verify whether the application navigates to opportunities page after clicking Bread Crumb Icon.
    Verify Opportunity Page URL
    Click Bread Crumb Icon
    Verify Opportunities Page URL