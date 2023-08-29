*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Resource    ../../Resources/Database_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]  When user select UnKnown advisor the rates for Hourly/Daily defaults and user can edit this rate
    [Tags]  Regression
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
    #Sleep    5s
    Add External Advisor and add AdvisorName, RateType, EstimatedTime    Unknown Advisor (rate may vary)       Hourly       6800
    Enter UnKnown Advisor Custom Rate Value    1222
    Click Save Button
    Close Browser
    



