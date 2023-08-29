*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library     String
Resource    ../../Resources/Robot_Keywords.robot
#Test Setup    Click Create New Opportunity Button
#Test Teardown    Click Bread Crumb Icon

*** Test Cases ***

TC_003
    [Documentation]    Test Case to add one Teamlet, one SKU, one OR and one External Advisor for all list of EMEA region countries.
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
    Enter Anticipated Duration Type    weeks
    Click Rate Type DropDown
    Enter Rate Type    Weekly
    Click Save Button
    @{EMEA_Region_Countries_List}=    Extract Countries list for EMEA region from DB
     FOR    ${Country}    IN    @{EMEA_Region_Countries_List}
                IF     ${Country} == ('Spain (Eurozone pricing)',) or ${Country} == ('Spain (Local pricing)',)
                    Log    ${Country}
                    ${Country}=    Catenate    ${Country}
                    ${Country}=    Get Substring    ${Country}    2    end=-3
                    Log    ${Country}
                    Click Primary Work Location DropDown Button
                    Enter Primary Location    ${Country}
                    Click Element    ${Global_Panel_Update}
                    Click Element    ${Global_Panel_Update_Confirmation}
                    Sleep    3s
                    Click Drill-In button under Teams header
                    @{teamlets}=      Fetch all the teamlets from UI
                    FOR    ${teamlet}    IN    @{teamlets}
                        Log    ${teamlet}
                    END
                    IF    "${teamlet}" == "SM + 2" or "${teamlet}" == "M/SM + 2"
                        Add Teamlet    SM + 6
                    ELSE
                    Add Teamlet    ${teamlet}
                    Sleep    3s
                    END
                    Click Element    ${All_Teamlet_Back_Arrow}
                    Sleep    3s
                ELSE IF   ${Country} == ('South Africa',) or ${Country} == ('France',) or ${Country} == ('Belgium',) or ${Country} == ('Ukraine',) or ${Country} == ('Saudi Arabia',) or ${Country} == ('Finland',) or ${Country} == ('Germany',) or ${Country} == ('Netherlands',) or ${Country} == ('Qatar',) or ${Country} == ('United Kingdom',) or ${Country} == ('Norway',) or ${Country} == ('Sweden',) or ${Country} == ('Russia',) or ${Country} == ('Denmark',) or ${Country} == ('Poland',) or ${Country} == ('Italy (Eurozone pricing)',) or ${Country} == ('Portugal (Eurozone pricing)',) or ${Country} == ('Portugal (Local pricing)',) or ${Country} == ('Italy (Local pricing)',) or ${Country} == ('Greece (Eurozone pricing)',) or ${Country} == ('Greece (Local pricing)',) or ${Country} == ('Nigeria',) or ${Country} == ('Poland',) or ${Country} == ('Austria',) or ${Country} == ('Brazil',) or ${Country} == ('South Africa (USD)',)
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
                    Click Element    ${Global_Panel_Update}
                    Click Element    ${Global_Panel_Update_Confirmation}
                    Sleep    3s
                    Click Drill-In button under Teams header
                    @{teamlets}=      Fetch all the teamlets from UI
                    FOR    ${teamlet}    IN    @{teamlets}
                        Log    ${teamlet}
                    END
                    IF    "${teamlet}" == "SM + 2" or "${teamlet}" == "M/SM + 2"
                        Add Teamlet    SM + 6
                    ELSE
                    Add Teamlet    ${teamlet}
                    Sleep    3s
                    END
                    Click Element    ${All_Teamlet_Back_Arrow}
                    Sleep    3s
                END
                Delete Teamlet block
                Sleep    3s
                #Adding SKU-Personalization - Strategy with Use Case Delivery under Advanced Analytics
                Click Element    ${Add_First_Sku_Under_Advanced_Analytics}
                Sleep    5s
                Delete SKU Block
                Sleep    3s
                Add External Advisor and Manually Enter Advisor Name
                Sleep    2s
                Delete External Advisor Block
                Sleep    3s
                Add Other Resource
                Sleep    2s
                Delete Other Resources Block
                Sleep    5s
            END
     Close Browser