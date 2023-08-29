*** Settings ***
Library   SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    This test case is to check if opportunity name in breadcrumb is replaced by actual opportunity name after entering client name manually and clicking on save button.
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
    Verify Opportunity Name in Breadcrumb
    Sleep    3s
    Change Opportunity Name    Automation_ABC
    Sleep    3s
    Verify Oppotunity Name Value    Automation_ABC
    Verify Opportunity Name in Breadcrumb

TC_002
    [Documentation]    This test case is to check if opportunity name in breadcrumb is replaced by actual opportunity name after clicking on create client and clicking on save button.
    Verify Opportunity Page URL
    Verify Client Name Field
    Click Client Name
    Click Create Client Button
    Enter Client In Create Client Name Input Field    Automation_Testing
    Click Accept Button
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
    Verify Opportunity Name in Breadcrumb
    Sleep    3s
    Change Opportunity Name    Automation_PQR
    Sleep    3s
    Verify Oppotunity Name Value    Automation_PQR
    Verify Opportunity Name in Breadcrumb