*** Settings ***
Library   SeleniumLibrary
Library    Collections
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Variables ***
@{Capabilities_Expected}=    Create List    (All Capabilities)    Advanced Analytics    Customer    Diversity, Equity, and Inclusion (DE&I)     Due Diligence    	Enterprise Technology    M&A and Divestitures    Org    Performance Improvement    	Strategy    Sustainability & Corporate Responsibility    Transformation & Change        Vector Digital
${Capabilities_Expected}=    Create List    @{Capabilities_Expected}
@{Capabilities_Actual}=    Create List
${Capabilities_Actual}=    Create List    @{Capabilities_Actual}

*** Test Cases ***
TC_001
    [Documentation]    This test case is to verify list of capabilities which can be selected.
    Verify Opportunity Page URL
    Verify Client Name Field
    Click Client Name
    Select Client Name From DropDown    1800 Contacts
    Click Industry Type
    Enter Industry Type    Retail
    #Click Select Capabilities
    @{Capabilities}=    Get Webelements    xpath=//div[@id='Capability-dropdown-list']//div//label//span
    FOR    ${Capability}    IN    @{Capabilities}
      Log    ${Capability}
      ${C}=    Get Text    ${Capability}
      #List Should Contain Value    ${Capabilities_Expected}    ${C}
      Append To List    ${Capabilities_Actual}    ${C}
    END
    Lists Should Be Equal    ${Capabilities_Actual}    ${Capabilities_Expected}
    ${Capability_Not_Sure}=    Get Webelement    xpath=//div[@id='Capability-dropdownnotSure']//div
    ${B}=    Get Text    ${Capability_Not_Sure}
    Should Be Equal    ${B}    Not Sure
