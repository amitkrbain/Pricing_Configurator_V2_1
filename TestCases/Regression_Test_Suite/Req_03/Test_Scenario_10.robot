*** Settings ***
Library   SeleniumLibrary
Library    Collections
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Variables ***
@{Categories_Expected}=    Managers    AC/Consultant    Expert    AAG    Innovation & Design    FRWD    Automation
${Categories_Expected}=    Create List    @{Categories_Expected}
@{Categories_Actual}=
${Categories_Actual}=    Create List    @{Categories_Actual}

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
    Verify PreConfigured SKU button present
    Click PreConfigured SKU button
    Click Teams Button
    Verify Partner Team Button
    Click Partner Team Button
    Click Core Team Category Button
    @{Categories}=    Get Webelements    xpath=//div[@id='coreTeamListData']//div//div//div//div//div//span
    FOR    ${Category}    IN    @{Categories}
      Log    ${Category}
      ${C}=    Get Text    ${Category}
      Log    ${C}
      Append To List    ${Categories_Actual}    ${C}
    END
    Log    ${Categories_Actual}
    Lists Should Be Equal    ${Categories_Actual}    ${Categories_Expected}
