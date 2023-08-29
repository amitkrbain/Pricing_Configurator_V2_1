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
    Enter Primary Location      Australia
    Click Currency DropDown Button
    Enter Currency    United States Dollar (USD)
    Enter Anticipated Duration Value  6
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    months
    Click Rate Type DropDown
    Enter Rate Type    Monthly
    Add External Advisor and add AdvisorName, RateType, EstimatedTime    Alistair Hirst    Daily    5
    Click Save Button
    ${Total_Cost}=  Caluclate External Advisor Total Cost
    #${Total_Cost}=  Catenate    ${Total_Cost}
    ${UI_ExternalAdvisor_TotalCost}=    Get Text    xpath=//div[@id="externalAdvisors"]/div/div[3]/div/div[5]/span
    ${Output}=  Catenate    ${UI_ExternalAdvisor_TotalCost}
    ${Output}=  Remove String    ${Output}  $
    ${Output}=  Remove String    ${Output}  K
    ${Output}=  Convert To Integer    ${Output}
    Should Be Equal As Integers    ${Output}    ${Total_Cost}
    Close Browser
