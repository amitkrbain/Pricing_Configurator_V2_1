*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    Test Case to check Teams is present under pre configured SKU and abobe the Partner team under Build proposal header in left panel.
    Run Keywords    Open Application    Verify Opportunities Page URL
    Click Create New Opportunity Button
    Verify Client Name Field
    Click Client Name
    Select Client Name From DropDown    1800 Contacts
    Click Industry Type
    Enter Industry Type    Retail
    #Click Select Capabilities
    Select Capabilities    Advanced Analytics
    Verify Scenario A is present
    Verify Primary Location Header
    Verify Primary Location Input Field
    Verify Base Currency Header
    Verify Base Currency Input Field
    Verify Anticipated Duration Header
    Verify Anticipated Duration Input Field
    Verify Anticipated Duration Dropdown
    Verify Rate Type Header
    Verify Rate Type Dropdown
    Click Primary Work Location DropDown Button
    Enter Primary Location      Argentina
    Click Currency DropDown Button
    Enter Currency    Argentine Peso (ARS)
    Enter Anticipated Duration Value  25
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    weeks
    Click Rate Type DropDown
    Enter Rate Type    Weekly
    Click Save Button
    Sleep   3s
    Verify Build Proposal Header
    Verify PreConfigured SKU button present
    Click Teams Button
    Verify Partner Team Button
    Close Browser