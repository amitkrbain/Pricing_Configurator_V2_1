*** Settings ***
Library    SeleniumLibrary
Library     ImapLibrary
Resource    ../../Resources/Robot_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    If user adds an M+X: the Partner team member(s) of that M+X will be added to the Partner team block
                        ## and the Core team members will be added to the new M+X block but if then the user adds a Core team
                        ## member from the Core team block on the left panel then the team member will be added to the Core
                        ## team block rather than the M+X block
    Run Keywords    Open Application    Verify Opportunities Page URL
    Click Create New Opportunity Button
    Verify Client Name Field
    Click Client Name
    Select Client Name From DropDown    1800 Contacts
    Click Industry Type
    Enter Industry Type    Retail
    Select Capabilities    Advanced Analytics
    Click Primary Work Location DropDown Button
     Enter Primary Location    United States (for US-based clients local pricing)
    Click Currency DropDown Button
    Enter Currency    United States Dollar (USD)
    Enter Anticipated Duration Value  3
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    weeks
    Click Rate Type DropDown
    Enter Rate Type    Weekly
    Add External Advisor and Manually Enter Advisor Name
    Click Save Button
    Close Browser