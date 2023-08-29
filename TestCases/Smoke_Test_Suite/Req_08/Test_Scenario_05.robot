*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Resource    ../../Resources/Database_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]  When a user open exisiting opportunity and make some changes and then click save to save all the changes.
    [Tags]  Smoke
    Run Keywords    Open Application    Verify Opportunities Page URL
    Click Create New Opportunity Button
    #Verify Opportunity Page URL
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
    #Get RoleNames from opportunity
    #Get Role Allocation from opportunity
    Sleep    5s
    ${Output}=  Fetch the team allocation added in Opportunity from DB
    ${Initial_Output}=  Evaluate    ${Output} * 100
    Click Element   xpath=//div[@id="allMonthsArrowButton"]/div[1]/div/div/span/button[1]/span/i
    #Double Click Element    //div[@id="allMonthsArrowButton"]/div[1]/div/div/span/button[1]/span/i
    Click Save Button
    Sleep    5s
    ${Output}=  Fetch the team allocation added in Opportunity from DB
    ${Changed_Output}=  Evaluate    ${Output} * 100
    Should Not Be Equal    ${Initial_Output}     ${Changed_Output}
    Close Browser


