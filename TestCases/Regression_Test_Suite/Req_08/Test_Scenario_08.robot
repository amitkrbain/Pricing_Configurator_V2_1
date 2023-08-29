*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Resource    ../../Resources/Database_Keywords.robot
Library     Collections
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Variables ***
${Partner_Team_Roles}  xpath=//span[text()='Partner Team']//parent::div//parent::div//parent::div//parent::div//parent::div//parent::div//parent::div//child::div[@class='w-80']//child::div[2]//span[@class='text-sm mr-2 break-words css-233']
@{Partner_Roles_Expected}=    Senior Partner        Partner (Advisor)
${Partner_Roles_Expected}=    Create List    @{Partner_Roles_Expected}

*** Test Cases ***
TC_001
    [Documentation]  When a user creates opportunity and then add a resource to it, the system should trigger normal autosave behavior
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
    Enter Anticipated Duration Value  25
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    weeks
    Click Rate Type DropDown
    Enter Rate Type    Weekly
    Click Element    xpath=//div[text()='Teams']//parent::div//parent::div//parent::div//parent::div//parent::div//parent::div//div[text()='4 more'] 
    Add Teamlet    SM + 3
    #Log    ${Partner_Roles_Expected}
    Fetch the list of all Team blocks added in Opportunity from DB
    Sleep    5s
    #Click Bread Crumb Icon
    #Add Partner Team Member    Senior Partner
    Close Browser


TC_005
    [Documentation]     If Scenario A is duplicated then autosave should be triggered and same can be verified from backend DB table
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
    Enter Anticipated Duration Value  25
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    months
    Click Rate Type DropDown
    Enter Rate Type    Monthly
    Click Element    xpath=//div[text()='Teams']//parent::div//parent::div//parent::div//parent::div//parent::div//parent::div//div[text()='4 more']
    Add Teamlet    SM + 3
    #This will click the decrease the allocation % for partner advisor
    Click Element    xpath=//*[@id="allMonthsArrowButton"]/div[3]/div/div/span/button[2]/span/i
    #Log    ${Partner_Roles_Expected}
    #Fetch the list of all Team blocks added in Opportunity from DB
    Sleep    5s
    #Click Bread Crumb Icon
    #Add Partner Team Member    Senior Partner
    Close Browser