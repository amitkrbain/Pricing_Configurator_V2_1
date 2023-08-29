*** Settings ***
Library   SeleniumLibrary
Library    Collections
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Variables ***
@{Roles_Expected}=    Senior Partner    OVP    Partner (Advisor)    Expert Partner    Expert Partner, ADAPT    Expert Partner, FRWD
${Roless_Expected}=    Create List    @{Roles_Expected}
@{Roles_Actual}=
${Roles_Actual}=    Create List    @{Roles_Actual}

*** Test Cases ***
TC_001
    [Documentation]    This test case is to verify that there is a preview of roles for partner team..
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
    Verify Anticipated Duration Value    4    months
    Click Teams Button
    Verify Partner Team Button
    Click Partner Team Button
    #Sleep    1s
    @{Roles}=    Get Webelements    xpath=//div[text()='Partner Team']//parent::div//parent::div//parent::div//parent::div/following-sibling::div//div//div//div//div//i/preceding-sibling::span
    FOR    ${Role}    IN    @{Roles}
      Log    ${Role}
      ${C}=    Get Text    ${Role}
      Log    ${C}
      Append To List    ${Roles_Actual}    ${C}
    END
    Log    ${Roles_Actual}
    Lists Should Be Equal    ${Roles_Actual}    ${Roles_Expected}
