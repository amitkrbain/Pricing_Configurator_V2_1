*** Settings ***
import      webcolors
Library     SeleniumLibrary
Library     ../../Resources/color.py
Resource    ../../Resources/Robot_Keywords.robot
Resource    ../../Resources/Database_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon


*** Test Cases ***
TC_001
    [Documentation]     When blank opportunity without any resource is created then the price realization should displaye as )% in black color
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
    ${elem}    Get Webelement    xpath=//div[@class="font-bold"]
    ${bg_color}    Call Method    ${elem}    value_of_css_property    color
    ${Output}=  Catenate    ${bg_color}
    ${Output}=  Remove String    ${Output}  rgba
    ${Output}=  Remove String    ${Output}  (
    ${Output}=  Remove String    ${Output}  )
    Run Keyword If    ${Output} == '32, 31, 30, 1'    Log To Console     No Resources has been added to opportunity
    Close Browser


TC_002
    [Documentation]     When opportunity is created adding resources then the price realization should be displayed as 100% in green color
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
    Sleep    3s
    #Click Save Button
    ${elem}    Get Webelement    xpath=//div[@class="font-bold"]
    ${bg_color}    Call Method    ${elem}    value_of_css_property    color
    ${Output}=  Catenate    ${bg_color}
    ${Output}=  Remove String    ${Output}  rgba
    ${Output}=  Remove String    ${Output}  (
    ${Output}=  Remove String    ${Output}  )
    Run Keyword If    ${Output} == '16, 124, 16, 1'    Log To Console      Resources has been added to opportunity
    Close Browser
