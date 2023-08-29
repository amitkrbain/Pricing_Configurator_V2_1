*** Settings ***
#Test Setup        Click Create New Opportunity Button
#Test Teardown     Click Bread Crumb Icon
Library           SeleniumLibrary
Resource          ../../Resources/Robot_Keywords.robot
Resource          ../../Resources/Database_Keywords.robot

*** Test Cases ***
TC_001
    [Documentation]    When a user clicks on the “Save” button system should trigger normal autosave behavior
    [Tags]    Smoke
    Run Keywords    Open Application    Verify Opportunities Page URL
    Click Create New Opportunity Button
    Verify Opportunity Page URL
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
    Enter Anticipated Duration Value  25
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    weeks
    Click Rate Type DropDown
    Enter Rate Type    Weekly
    Click Save Button
    Sleep  3s
    Fetch Opportunity Name and compare with opportunity name from DB
    Click Bread Crumb Icon
    Close Browser
