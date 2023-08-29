*** Settings ***
Library   SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    This test case will check whether user can edit client name after opportunity is created.
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
    Enter Anticipated Duration Value  25
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    weeks
    Click Rate Type DropDown
    Enter Rate Type    Weekly
    Click Save Button
    Sleep    3s
    Verify Client Name Field is disabled

TC_002
    [Documentation]    This test case will verify that User can only select one client at the time, no multi selection allowed.
    Verify Opportunity Page URL
    Verify Client Name Field
    Click Client Name
    Select Client Name From DropDown    1800 Contacts
    Verify Client Name List Is Not Present
    Verify Client Name Value    1800 Contacts
    Click Client Name
    Select Client Name From DropDown    3D Systems
    Verify Client Name List Is Not Present
    Verify Client Name Value    3D Systems
