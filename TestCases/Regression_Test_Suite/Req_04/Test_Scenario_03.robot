*** Settings ***
Library    SeleniumLibrary
Library     Collections
Resource    ../../Resources/Robot_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    Test Case to check Under Teams header there is preview headers visible which will be dynamic based on the geography selected.
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
    Enter Anticipated Duration Value  6
    Click Anticipated Duration DropDown
    Enter Anticipated Duration Type    months
    Click Rate Type DropDown
    Enter Rate Type    Monthly
    Click Drill-In button under Teams header
    @{Countries_List}=    Extract Country Names From Database
    FOR    ${Country}    IN    @{Countries_List}
       IF    ${Country} == ('Canada (for Canada-based clients local pricing)',) or ${Country} == ('Canada (global pricing)',) or ${Country} == ('Greece (Eurozone pricing)',) or ${Country} == ('Greece (Local pricing)',) or ${Country} == ('India (Local clients)',) or ${Country} == ('India (MNC clients)',) or ${Country} == ('Italy (Eurozone pricing)',) or ${Country} == ('Italy (Local pricing)',) or ${Country} == ('Portugal (Eurozone pricing)',) or ${Country} == ('Portugal (Local pricing)',) or ${Country} == ('Spain (Eurozone pricing)',) or ${Country} == ('Spain (Local pricing)',) or ${Country} == ('United States (for US-based clients local pricing)',) or ${Country} == ('United States (global pricing)',)
            Log    ${Country}
            ${Country}=    Catenate    ${Country}
            ${Country}=    Get Substring    ${Country}    2    end=-3
            Log    ${Country}
            Click Primary Work Location DropDown Button
            Enter Primary Location    ${Country}
            @{result}=      Fetch all the teamlets based on Geography from UI
            @{result1}=     Fetch list of all Teamlets based on country from DB    ${Country}
            Sleep    3s
       ELSE IF    ${Country} == ('Nigeria',) or ${Country} == ('Poland',) or ${Country} == ('Austria',) or ${Country} == ('Brazil',) or ${Country} == ('South Africa (USD)',)
            Continue For Loop
       ELSE
            ${Country}=    Catenate    ${Country}
            ${Country}=    Remove String    ${Country}    )
            ${Country}=    Remove String    ${Country}    (
            ${Country}=    Remove String    ${Country}    ,
            ${Country}=    Remove String    ${Country}    '
            ${Country}=    Remove String    ${Country}    '
            Click Primary Work Location DropDown Button
            Enter Primary Location    ${Country}
            @{result}=      Fetch all the teamlets based on Geography from UI
            @{result1}=     Fetch list of all Teamlets based on country from DB    ${Country}
            Sleep    3s
       END
        Run Keyword And Continue On Failure    Lists Should Be Equal    ${result}    ${result1}     ignore_order=True
    END
    Page Should Contain Element     ${Build_Proposal_All_Teamlet}
    Add Teamlet    M/SM + 5
    Sleep    3s
    Click Element    ${All_Teamlet_Back_Arrow}
        Close Browser