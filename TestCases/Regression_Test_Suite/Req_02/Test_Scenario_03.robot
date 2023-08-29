*** Settings ***
Library   SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    Test Case to check if after clicking create new opportunity button user is navigated to create new opportunity page.
    Verify Opportunity Page URL
    Veirfy Client Name Field Is Enabled
    Verify Opportunity Name Field Is Disabled
    Verify Industry Type Field Is Disabled
    #Verify Select Capabilities Field Is Disabled
    #Verify Scenario A Tab Is Disabled
    #Verify Currency Text Field Is Disabled
    #Verify Currency DropDown Is Disabled
    #Verify Anticipated Duration Input Field Is Disabled
    #Verify Anticipated Duration DropDown Is Disabled
    #Verify Rate Type DropDown Is Disabled
    #Verify Partner Team Button Is Disabled
    #Verify Core Team Button Is Disabled