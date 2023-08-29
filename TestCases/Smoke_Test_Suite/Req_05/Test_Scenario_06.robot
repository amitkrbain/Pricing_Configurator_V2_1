*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Resource    ../../Resources/Database_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]  When user clicks the + button, a block for External Advisors should appear and same should reflect in DB against case Id
    [Tags]  Smoke
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
    Add External Advisor and Manually Enter Advisor Name
    Click Save Button
    @{ExternalAdvisorDetails}=      Create List     Christian Spieler    Daily  10
    ${list1_lowerCase}=     Evaluate    "${ExternalAdvisorDetails}".lower()
    ${list1_lowerCase}=  Catenate    ${list1_lowerCase}
    ${list1_lowerCase}=  Remove String    ${list1_lowerCase}  (
    ${list1_lowerCase}=  Remove String    ${list1_lowerCase}  )
    ${list1_lowerCase}=  Remove String    ${list1_lowerCase}  ,
    ${list1_lowerCase}=  Remove String    ${list1_lowerCase}  '
    ${list1_lowerCase}=  Remove String    ${list1_lowerCase}  '
    ${list1_lowerCase}=  Remove String    ${list1_lowerCase}  [
    ${list1_lowerCase}=  Remove String    ${list1_lowerCase}  ]
    #Log    ${ExternalAdvisorDetails}
    ${Output}=  Fetch External Advisor added in Opportunity from DB
    ${list2_lowerCase}=     Evaluate    "${Output}".lower()
    #Log    ${Output}
    Should Be Equal As Strings    ${list1_lowerCase}    ${list2_lowerCase}
    Close Browser