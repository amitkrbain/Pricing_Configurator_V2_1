*** Settings ***
Library    SeleniumLibrary
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
    Add Teamlet    M/SM + 6
    Click Element    xpath=//html/body/div[2]/div[2]/div/div/div/div[2]/div[2]/div/div[2]/div/div[1]/div/div[3]/i
    Sleep    6s
    Press Keys  xpath=//body    \ue00f
    Click Element    ${Core_Team_Button}
    #Press Keys  xpath=//body    \ue00f
    Add External Advisor and add AdvisorName, RateType, EstimatedTime    Aaron Yoon    Hourly    10
    Add Other Resource
    Click Element    ${Core_Team_Button}
    #Click Element    ${Expand_Team_Composition_Container}
    Click Save Button
    Click Element    ${Core_Team_Button}
    Sleep    3s
    Click Element    ${Core_Team_Category_Button}
    Click Element    xpath=//html/body/div[1]/div[2]/div[3]/div/div/div[1]/div/div[2]/div/div[1]/div/div[2]/div[1]/div/div/div[1]/div[2]/div/div[1]/div/div/i
    Element Should Be Visible    ${Partner_Team_Block_In_Opportunity}
    Click Element    ${Expand_Team_Composition_Container}
    Press Keys  xpath=//body    \ue00e
    Press Keys  xpath=//body    \ue00e
    Element Should Be Visible    ${Core_Team_Block_In_Opportunity}
    Element Should Be Visible    ${Teamlet_Block_In_Opportunity}
    Press Keys  xpath=//body    \ue00f
    Press Keys  xpath=//body    \ue00f
    Element Should Be Visible    ${External_Advisor_Block_In_Opportunity}
    Element Should Be Visible    ${Other_Resource_Block_In_opportunity}
    Close Browser