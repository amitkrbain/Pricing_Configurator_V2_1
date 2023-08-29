*** Settings ***
Library   SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    This test case is to verify default value of anticipated duration is 4 months.
    Verify Opportunity Page URL
    Verify Client Name Field
    Click Client Name
    Select Client Name From DropDown    1800 Contacts
    Click Industry Type
    Enter Industry Type    Retail
    #Click Select Capabilities
    Select Capabilities    Advanced Analytics
    Click Primary Work Location DropDown Button
    Enter Primary Location    Argentina
    Click Currency DropDown Button
    Enter Currency    Argentine Peso (ARS)
    Verify Anticipated Duration Value    4    months