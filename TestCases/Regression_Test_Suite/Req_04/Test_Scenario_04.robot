*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    Test Case to check for adding teamlets there should be a blue + upon clicking that the teamlet should be added to the opportunity
    Run Keywords    Open Application    Verify Opportunities Page URL
    Click Create New Opportunity Button
    Verify Client Name Field
    Click Client Name
    Select Client Name From DropDown    1800 Contacts
    Click Industry Type
    Enter Industry Type    Retail
    Select Capabilities    Advanced Analytics
    Click Primary Work Location DropDown Button
    Enter Primary Location    Argentina
    Click Currency DropDown Button
    Enter Currency    Argentine Peso (ARS)
    Enter Anticipated Duration Value  6
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    months
    Click Rate Type DropDown
    Enter Rate Type    Monthly
    Add Teamlet    M/SM + 5
    Sleep    3s
    Close Browser