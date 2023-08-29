*** Settings ***
Documentation     Resources Panel Should Load Teams After User Made Selection For Primary Work Location Based On The Primary Location All The Team Role For That Region Should Be Loaded In Left Panel And User Can Add Those Roles In The Opportunity.
Test Setup        Click Create New Opportunity Button
Test Teardown     Click Bread Crumb Icon
Test Timeout
Library           SeleniumLibrary
Library           Collections
Resource          ../../Resources/Robot_Keywords.robot
Resource          ../../Resources/Database_Keywords.robot
Library           String

*** Variables ***
@{Country_List_DB}    'Argentina'    'India (MNC clients)'    # This is the list of all the countries across which we need to verify teamlets.
@{Country_List_UI}    Argentina    India (MNC clients)    # This list contains list of countries on UI.

@{Teamlet_Actual_UI}    # This is a list for appending Teamlets form UI.

${Teamlet_Actual_UI}    Create List    # This will create an empty list for capturing teamlet values from UI.
@{Teamlet_Actual_DB}    # This is the list to append teamlet values from Database.
${Teamlet_Actual_DB}    Create List    # This will create an empty list to capture tesmlet values from Database.






*** Test Cases ***
TC_001
    [Documentation]    This test case will validate teamlets across each country.
    [Timeout]
    Verify Opportunity Page URL
    Verify Client Name Field
    Click Client Name
    Select Client Name From DropDown    1800 Contacts
    Click Industry Type
    Enter Industry Type    Retail
    #Click Select Capabilities
    Select Capabilities    Advanced Analytics
    Click Primary Work Location DropDown Button
    Enter Primary Location    United States (for US-based clients local pricing)
    Click Currency DropDown Button
    Enter Currency    United States Dollar (USD)
    Verify Anticipated Duration Value    4    months
    Verify PreConfigured SKU button present
    Click PreConfigured SKU button
    Verify Teams Button
    Click Teams Button
    Verify Partner Team Button
    Click Partner Team Button
    Verify Core Team Button
    Click Core Team Button
    Verify External Advisor Button
    Click External Advisor Button
    Verify Other Resources Button
    Click Other Resources Button
    Verify Teams Button
    Click Teams Button
    Sleep    1s
    Click Teams More Button
    Sleep    2s
    @{Countries_List}=    Extract Country Names From Database
    Log Many    @{Countries_List}
    FOR    ${Country}    IN    @{Countries_List}
        IF    ${Country} == ('Canada (for Canada-based clients local pricing)',) or ${Country} == ('Canada (global pricing)',) or ${Country} == ('Greece (Eurozone pricing)',) or ${Country} == ('Greece (Local pricing)',) or ${Country} == ('India (Local clients)',) or ${Country} == ('India (MNC clients)',) or ${Country} == ('Italy (Eurozone pricing)',) or ${Country} == ('Italy (Local pricing)',) or ${Country} == ('Portugal (Eurozone pricing)',) or ${Country} == ('Portugal (Local pricing)',) or ${Country} == ('Spain (Eurozone pricing)',) or ${Country} == ('Spain (Local pricing)',) or ${Country} == ('United States (for US-based clients local pricing)',) or ${Country} == ('United States (global pricing)',)
            Log    ${Country}
            ${Country}=    Catenate    ${Country}
            ${Country}=    Get Substring    ${Country}    2    end=-3
            Log    ${Country}
            Click Primary Work Location DropDown Button
            Enter Primary Location    ${Country}
            Sleep    3s
            ${Country_DB}=    Catenate    SEPARATOR=    '    ${Country}    '
            @{Teamlets_DB}=    Extract Teamlet Values For Country    ${Country_DB}
        FOR    ${Teamlet_DB}    IN    @{Teamlets_DB}
            ${Teamlet}=    Catenate    ${Teamlet_DB}
            ${Teamlet}=    Remove String    ${Teamlet}    (
            ${Teamlet}=    Remove String    ${Teamlet}    )
            ${Teamlet}=    Remove String    ${Teamlet}    ,
            ${Teamlet}=    Remove String    ${Teamlet}    '
            ${Teamlet}=    Remove String    ${Teamlet}    '
            Append To List    ${Teamlet_Actual_DB}    ${Teamlet}
        END
        ELSE IF    ${Country} == ('Nigeria',) or ${Country} == ('Poland',)
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
            Sleep    3s
            ${Country_DB}=    Catenate    SEPARATOR=    '    ${Country}    '
            @{Teamlets_DB}=    Extract Teamlet Values For Country    ${Country_DB}
        FOR    ${Teamlet_DB}    IN    @{Teamlets_DB}
            ${Teamlet}=    Catenate    ${Teamlet_DB}
            ${Teamlet}=    Remove String    ${Teamlet}    (
            ${Teamlet}=    Remove String    ${Teamlet}    )
            ${Teamlet}=    Remove String    ${Teamlet}    ,
            ${Teamlet}=    Remove String    ${Teamlet}    '
            ${Teamlet}=    Remove String    ${Teamlet}    '
            Append To List    ${Teamlet_Actual_DB}    ${Teamlet}
        END
        END
        Comment    FOR    ${Teamlet_DB}    IN    @{Teamlets_DB}
            Comment    ${Teamlet}=    Catenate    ${Teamlet_DB}
            Comment    ${Teamlet}=    Remove String    ${Teamlet}    (
            Comment    ${Teamlet}=    Remove String    ${Teamlet}    )
            Comment    ${Teamlet}=    Remove String    ${Teamlet}    ,
            Comment    ${Teamlet}=    Remove String    ${Teamlet}    '
            Comment    ${Teamlet}=    Remove String    ${Teamlet}    '
            Comment    Append To List    ${Teamlet_Actual_DB}    ${Teamlet}
        Comment    END
        Log    ${Teamlet_Actual_DB}
        Log Many    @{Teamlets_DB}
        @{Teamlets}=    Get WebElements    ${Teamlet_List}
        FOR    ${Teamlet}    IN    @{Teamlets}
            ${Teamlet_Actual}=    Get Text    ${Teamlet}
            Log    ${Teamlet_Actual}
            Append To List    ${Teamlet_Actual_UI}    ${Teamlet_Actual}
        END
        Log    ${Teamlet_Actual_UI}
    ${Length_1}=    Get Length    ${Teamlet_Actual_DB}
    ${Length_2}=    Get Length    ${Teamlet_Actual_UI}
    Remove Values From List    ${Teamlet_Actual_DB}    'PEG 50% SM + 3'    'PEG 50% SM + 2'    'PEG M/SM + 2'
    Run Keyword And Continue On Failure    Should Be Equal    ${Length_1}    ${Length_2}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${Teamlet_Actual_DB}    ${Teamlet_Actual_UI}    ignore_order=True
    Comment    ${Length_2}=    Evaluate    ${Length_2} - 1
    Comment    ${Length_1}=    Evaluate    ${Length_1} - 1
    Log    ${Length_2}
    FOR    ${Index}    IN RANGE    ${Length_2}
        Remove From List    ${Teamlet_Actual_UI}    0
        Comment    ${Index} =    Evaluate    ${Index} - 1
        Comment    ${Length_2} =    Evaluate    ${Length_2} - 1
    END
    FOR    ${Index}    IN RANGE    ${Length_1}
        Remove From List    ${Teamlet_Actual_DB}    0
        Comment    ${Index} =    Evaluate    ${Index} - 1
        Comment    ${Length_1} =    Evaluate    ${Length_1} - 1
    END
    END
