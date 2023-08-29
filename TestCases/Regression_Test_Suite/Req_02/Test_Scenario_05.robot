*** Settings ***
Library   SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    Once the Opportunity name and Industry fields are pre-populated then user should be able to see highlighted Select Capability field, once user makes selection in Capability field, the rest of the page will be enabled
    Run Keywords    Open Application    Verify Opportunities Page URL
    Click Create New Opportunity Button
    Verify Client Name Field
    Click Client Name
    Select Client Name From DropDown    1800 Contacts
    Verify Industry Type Field Is Enabled
    Click Industry Type
    Enter Industry Type    Retail
    Select Capabilities    Advanced Analytics
    Verify Primary Work Location Is Enabled
    Click Primary Work Location DropDown Button
    Enter Primary Location    United States (for US-based clients local pricing)
    Click Currency DropDown Button
    Enter Currency    United States Dollar (USD)
    Enter Anticipated Duration Value  6
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    weeks
    Click Rate Type DropDown
    Enter Rate Type    Weekly
    Verify Build Proposal Header
    Close Browser