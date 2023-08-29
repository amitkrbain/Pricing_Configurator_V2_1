*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Resource    ../../Resources/Database_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]     When blank opportunity without any resource is created then the pricing panel should be in Grey background
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
    Click Save Button
    ${elem}    Get Webelement    xpath=//div[@class="flex justify-between items-center cursor-pointer px-4 h-14 text-textBlack"]
    ${bg_color}    Call Method    ${elem}    value_of_css_property    background-color
    ${Output}=  Catenate    ${bg_color}
    ${Output}=  Remove String    ${Output}  rgba
    ${Output}=  Remove String    ${Output}  (
    ${Output}=  Remove String    ${Output}  )
    Run Keyword If    ${Output} == '243,242,241,1'    Log To Console    No Resource added in Opportunity
    Close Browser

TC_002
    [Documentation]     When opportunity is created with adding resources then pricing summary panel should be changed to green background
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
    Add Teamlet    M/SM + 5
    #Click Save Button
    Sleep    3s
    ${elem}    Get Webelement    xpath=//div[@class="flex justify-between items-center cursor-pointer px-4 h-14 text-textBlack"]
    ${bg_color}    Call Method    ${elem}    value_of_css_property    background-color
    ${Output}=  Catenate    ${bg_color}
    ${Output}=  Remove String    ${Output}  rgba
    ${Output}=  Remove String    ${Output}  (
    ${Output}=  Remove String    ${Output}  )
    Run Keyword If    ${Output} == '223, 246, 221, 1'    Log To Console     Resources has been added to opportunity
    Close Browser