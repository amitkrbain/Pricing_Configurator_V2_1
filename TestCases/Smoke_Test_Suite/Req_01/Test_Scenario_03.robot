*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    Test Case to check Client Name Field, Opportunity Name Field, Industry Type Field, Capabilities Field, Start Date Field are present in project control panel.
    Verify Opportunity Page URL
    Verify Client Name Field
    Verify Opportunity Name Field
    Verify Industry Type Field
    Verify Capabilities Field
    Verify Start Date Field