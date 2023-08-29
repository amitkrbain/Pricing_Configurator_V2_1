*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    Test Case to check Scenario A, Primary location, Base Currency, Anticitpated Duration, Rate Type, Build Proposal, Partner Team and Core Team are present on Page.
    Verify Opportunity Page URL
    Verify Client Name Field
    Click Client Name
    Enter Client Name
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
    Enter Primary Location    Argentina
    Click Currency DropDown Button
    Enter Currency    Argentine Peso (ARS)
    Enter Anticipated Duration Value  25
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    weeks
    Click Rate Type DropDown
    Enter Rate Type    Weekly
    Verify Build Proposal Header
    Verify Partner Team Button
    Verify Core Team Button

