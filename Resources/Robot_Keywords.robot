*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     XML
Library    Dialogs
Library     String
Resource    Database_Keywords.robot


*** Variables ***
${Browser}        Chrome
${URL}            https://pricing-staging.bain.com/login2
#${Login_Page_URL} \ \ \ https://pricing-dev.bain.com/login2
${Login_Button}    xpath=//span[text()='Log in as test user 1']
#${Login_Button} \ xpath=//span[@id='id__0']
${Create_New_Opportunity_Button}        xpath=//span[text()='Create a new opportunity']//parent::span//parent::span//parent::button
${Opportunity_Page_URL}    https://pricing-staging.bain.com/opportunities/create-opportunity
${Opportunities_Page_URL}    https://pricing-staging.bain.com/opportunities
${Client_Name}    xpath=//input[@id='clientDropDownButton']
${Opportunity_Name}    xpath=//input[@placeholder='Enter Opportunity Name']
${Industry_Type}    xpath=//input[@placeholder='Select or type an industry']
${Capabilities_DropDown_Button}    xpath=//div[@id='Capability-dropdown']//div//button//span
${Capabilities}    xpath=//input[@id='Capability-dropdown-input']
${Start_Date}     xpath=//input[@placeholder='Est. Start Date']
${Client_Name_100x}    xpath=//div[text()='100X']
${Industry_Type_DropDown_Button}    xpath=//input[@id='Industry-dropdown-input']//parent::div//button
#${Industry_Type_Advanced_Manufacturing} \ \ \ xpath=//span[text()='Advanced Manufacturing & Services']
#${All_Capabilities} \ \ \ xpath=//span[text()='(All Capabilities)']
${Scenario_A}     xpath=//div[text()='Scenario A']
${Primary_Location_Header}    xpath=//div[text()='Primary Work Location']
${Primary_Location_Input_Field}    xpath=//input[@placeholder='Select a country']
${Primary_Location_Header_DropDown_Button}    xpath=//input[@id='Location-dropdown-input']//parent::div//button
${Base_Currency_Header}    xpath=//div[text()='Currency']
${Base_Currency_Input_Field}    xpath=//div[@id='Currency-dropdown']//div//input
${Currency_DropDown_Button}    xpath=//div[@id='Currency-dropdown']//div//button//span
${Anticipated_Duration_Header}    xpath=//div[text()='Anticipated Duration']
${Anticipated_Duration_Input_Field}    xpath=//input[@placeholder='e.g. 6, 2.5']
${Anticipated_Duration_Dropdown}    xpath=//div[@id='Anticipated-duration-dropdown']
${Anticipated_Duration_Dropdown_Option}    xpath=//span[@id='Anticipated-duration-dropdown-option']
${Rate_Type_Header}    xpath=//div[text()='Rate Type']
${Rate_Type_Dropdown}    xpath=//span[@id='Rate Type-option']
${Build_Proposal_Header}    xpath=//div[text()='Build Proposal']
${Partner_Team_Button}    xpath=//div[@class='w-full font-semibold']//div//div[2]//div//div//div//div[text()='Partner Team']
${Core_Team_Button}    xpath=//div[@class='w-full font-semibold']//div//div[2]//div//div//div//div[text()='Core Team']
${Bread_Crumb}    xpath=//div[text()='Opportunities']//parent::div//parent::div/preceding-sibling::div
${Bread_Crumb_Opportunities}    xpath=//div[text()='Opportunities']
${Bread_Crumb_Icon}    xpath=//div[text()='Opportunities']//parent::div//parent::div/preceding-sibling::div
${Save_Button}    xpath=//span[text()='Save']
${Create_Client_Button}    xpath=//span[text()='Create Client']
${Client_Name_Input_Field}    xpath=//div[@id='manualClient']//input
${Accept_Button}    xpath=//div[@id='manualClient']//div[2]//i
${Client_Name_List}    xpath=//div[@id='clientCallOut']//div//div//div//div//div//div
${Client_Name_Options}    xpath=//div[@id='clientCallOut']
${Core_Team_Category_Button}    xpath=//div[text()='Manager/Consultant/AC, Expert, AAG, I&D, FRWD, Automation, RTN']/parent::div/div[2]/i
${Advisor_Button}    xpath=//span[text()='Advisor']//parent::div//i
${Teams_Button}    xpath=//div[@class='w-full font-semibold']//div//div[2]//div//div//div//div[text()='Teams']
${Pre_Configured_SKU_Button}    xpath=//div[@class='w-full font-semibold']//div//div[2]//div//div//div//div[text()='Pre-configured SKUs']
${External_Advisor_Button}    xpath=//html/body/div[1]/div/div[3]/div/div/div[1]/div/div[2]/div/div[1]/div[2]/div[5]/div/div[2]/div/div/div/div/i
${Other_Resource_Button}    xapth=//div[@class='w-full font-semibold']//div//div[2]//div//div//div//div[text()='Other resources']
${External_Advisor_Name_DropDown}    xpath=//div[@id="external-advisor-selectwrapper"]/button/span/i
${Role_Allocation_Block}    xpath=//div[@id='allMonthsArrowButton']//div//div//div//input
${External_Advisor_Input_TextBox}       xpath=//input[@id="external-advisor-select-input"]
${External_Advisor_RateType_DropDown}       xpath=/html/body/div[1]/div/div[3]/div/div/div[2]/div[2]/div[1]/div/div/div/div[2]/div/div/div[3]/div/div[2]/div/div/div/span[2]
${External_Advisor_RateType_Daily}      xpath=//html/body/div[2]/div[2]/div/div/div/div/div/div/button[2]/span/span
${Show_More_Teamlet_Button}     xpath=//html/body/div[1]/div/div[3]/div/div/div[1]/div/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div[2]
${Build_Proposal_All_Teamlet}     xpath=//div[@class='transition-all duration-350 ease-in absolute top-0 bottom-0 lg:static w-5/12 lg:w-3/12 xl:w-1/5 shrink-0 shadow z-40 lg:z-10 overflow-y-auto bg-white -left-ipad-portrait-build-proposal-width']//div[2]//div//div//div//div//div//following-sibling::div
${All_Teamlet_Back_Arrow}       xpath=//html/body/div[1]/div/div[3]/div/div/div[1]/div/div[2]/div/div[1]/div/div[1]/div[1]/i
${Select_All_Roles_In_Teamlet_Block}    xpath=//span[starts-with(@class,'text-base') and contains(text(),'M')]/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/div[2]/div/div/div/div/div/div/span/div/label/div/i
${Remove_Teamlet_button}    xpath=//span[starts-with(@class,'text-base') and contains(text(),'M')]/parent::div/parent::div/parent::div/span[2]
${Delete_Block_Confirmation}    xpath=//html/body/div[2]/div[2]/div/div/div/div[2]/div[2]/div/div[2]/div[2]/div/span/button/span/span/span
${Global_Panel_Update}      xpath=//html/body/div[1]/div/div[3]/div/div/div[2]/div[1]/div[2]/div[4]/button/span/span/span
${Global_Panel_Update_Confirmation}     xpath=//html/body/div[2]/div[2]/div/div/div/div[2]/div[2]/div/div[2]/div/div[1]/div/div/span[1]/button/span/span/span
${Add_First_Sku_Under_Advanced_Analytics}   xpath=//span[text()='Personalization - Strategy with Use Case Delivery ']/parent::div/i
${Expand_Team_Composition_Container}    xpath=//div[@id="root"]/div[2]/div[3]/div/div/div[2]/div[1]/div[1]/div[4]/div[1]/i
${Select_All_Roles_In_SKU_Block}    xpath=//span[text()='Personalization - Strategy with Use Case Delivery ' and starts-with(@class,'text-base')]/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/div[2]/div/div/div/div/div/div/span/div/label/div/i
${Remove_SKU_button}    xpath=//span[text()='Personalization - Strategy with Use Case Delivery ' and starts-with(@class,'text-base')]/parent::div/parent::div/parent::div/span[text()='Remove']
${Remove_External_Advisor_Button}   xpath=//span[text()='External Advisors & RTN']/parent::div/parent::div/parent::div/span
${Remove_Other_Resources_Button}    xpath=//span[text()='Other resources']/parent::div/parent::div/parent::div/span
${Select_All_Roles_In_ExternalAdvisor_Block}    xpath=//span[text()='External Advisors & RTN']/parent::div/parent::div/parent::div/parent::div/parent::div/div[2]/div/div/div/label/div/i
${Add_Other_Resources_+_Button}     xpath=//div[@class='w-full font-semibold']//div//div[2]//div//div//div//div[text()='Other resources']/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/div[2]/div/div/div/div/div/i
${Other_Resource_Total_Price_TextField}     xpath=//span[text()='Other resources']/parent::div/parent::div/parent::div/parent::div/parent::div/div[3]/div/div[4]/div/div/div/div/div/input
${Select_All_Other_Resources_Block}     xpath=//span[text()='Other resources']/parent::div/parent::div/parent::div/parent::div/parent::div/div[2]/div/div/div/label/div/i
${Partner_Team_Block_In_Opportunity}    xpath=//span[text()='Partner Team']
${Core_Team_Block_In_Opportunity}    xpath=//span[text()='Partner Team']/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/div[2]/div/div/div/div/div/div/div/div//span[text()='Core Team']
${Teamlet_Block_In_Opportunity}     xpath=//span[text()='Core Team']/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/parent::div/div[3]/div/div/div/div/div/div/div/div/span[text()='M/SM + 6']
${External_Advisor_Block_In_Opportunity}    xpath=//div[@id='teamsData']/following-sibling::div/div[@id='externalAdvisors']
${Other_Resource_Block_In_opportunity}      xpath=//div[@id='teamsData']/following-sibling::div/div[@id='externalAdvisors']/parent::div/following-sibling::div/div[@id='otherResources']
${Unknown_Advisor_Rate_Input_Field}     xpath=//html/body/div[1]/div/div[3]/div/div/div[2]/div[2]/div[1]/div/div/div/div[2]/div/div/div[3]/div/div[3]/div/div[2]/div/div/input

*** Keywords ***
Open Application
    [Documentation]    Opens browser, verifies URL of page and logins in to the application.
    &{desired_caps}=    Create Dictionary    screenResolution="1920X1200"
    Open Browser    ${URL}    ${Browser}    desired_capabilities=&{desired_caps}
    Maximize Browser Window
    Location Should Be    ${URL}
    #Sleep    5s
    Wait Until Element is enabled    ${Login_Button}    10s
    Click Element    ${Login_Button}

Verify Opportunities Page URL
    [Documentation]    Verifies Opportunities Page URL.
    Wait Until Location Is    ${Opportunities_Page_URL}    20s
    Location Should Be    ${Opportunities_Page_URL}

Click Create New Opportunity Button
    [Documentation]    Clicks on create new opportunity button.
    Sleep    10s    button to become clickable.
    Wait Until Element Is Enabled    ${Create_New_Opportunity_Button}    10s
    Page Should Contain Button      ${Create_New_Opportunity_Button}
    Click Button    ${Create_New_Opportunity_Button}
    Sleep    3s

Verify Opportunity Page URL
    [Documentation]    It will verify opportunity page URL.
    Location Should Be    ${Opportunity_Page_URL}
    Sleep    3s    Wait for elements to be accessable

Verify Client Name Field
    [Documentation]    It will verify placeholder of Client Name Field.
    Wait Until Element Is Enabled    ${Client_Name}    10s
    Element Attribute Value Should Be    ${Client_Name}    placeholder    Enter/Search Client*

Verify Opportunity Name Field
    [Documentation]    It will verify placeholder of Opportunity Name Field.
    Wait Until Element Is Visible    ${Opportunity_Name}    10s
    Element Attribute Value Should Be    ${Opportunity_Name}    placeholder    Enter Opportunity Name

Verify Industry Type Field
    [Documentation]    It will verify placeholder of Industry Type Field.
    Wait Until Element Is Visible    ${Industry_Type}    10s
    Element Attribute Value Should Be    ${Industry_Type}    placeholder    Select or type an industry

Verify Capabilities Field
    [Documentation]    It will verify placeholder of Capabilities Field.
    Wait Until Element Is Visible    ${Capabilities}    10s
    Element Attribute Value Should Be    ${Capabilities}    placeholder    Select Capability*

Verify Start Date Field
    [Documentation]    It will verify palceholder of Start Date Field
    Wait Until Element Is Visible    ${Start_Date}    10s
    Element Attribute Value Should Be    ${Start_Date}    placeholder    Est. Start Date

Click Client Name
    [Documentation]    This will click on Client Name Field
    Wait Until Element Is Enabled    ${Client_Name}
    Click Element    ${Client_Name}

Enter Client Name
    [Documentation]    It will enter 100x as client name in Client Name Field.
    Wait Until Element Is Enabled    ${Client_Name_100x}
    Click Element    ${Client_Name_100x}

Select Client Name From DropDown
    [Arguments]    ${Client}
    [Documentation]    This will select client name from DropDown.
    ${Client_Selected}=    Catenate  SEPARATOR=    xpath=//div[text()='    ${Client}    ']
    Wait Until Element Is Enabled    ${Client_Selected}
    Click Element    ${Client_Selected}

Click Industry Type
    [Documentation]    This will CLick on Industry Type
    Wait Until Element Is Enabled    ${Industry_Type_DropDown_Button}
    Click Element    ${Industry_Type_DropDown_Button}

Enter Industry Type
    [Arguments]    ${Industry}
    [Documentation]    This will Enter Industry Type as mentioned in the argument.
    ${Industry_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Industry}    ']
    Wait Until Element Is Enabled    ${Industry_Selected}
    Click Element    ${Industry_Selected}

Click Select Capabilities
    [Documentation]    This will Click on Select Capabilities Field.
    Wait Until Element Is Enabled    ${Capabilities_DropDown_Button}
    Click Element    ${Capabilities_DropDown_Button}

Select Capabilities
    [Arguments]    ${Capability}
    [Documentation]    This will Select entered capability value form Capabilities List.
    ${Capability_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Capability}    ']
    #Sleep    1s
    Wait Until Element Is Enabled    ${Capability_Selected}
    Click Element    ${Capability_Selected}
    Sleep    5s

Verify Scenario A is present
    [Documentation]    This will verify Scenario A is present by default.
    Wait Until Element Is Enabled    ${Scenario_A}
    Click Element    ${Scenario_A}

Verify Primary Location Header
    [Documentation]    This will verify Primary Location Header on Page.
    Element Should Be Visible    ${Primary_Location_Header}

Verify Primary Location Input Field
    [Documentation]    This will verify Primary Location Input Field.
    Wait Until Element Is Enabled    ${Primary_Location_Input_Field}

Verify Base Currency Header
    [Documentation]    This will verify Base Currency Header on Page.
    Element Should Be Visible    ${Base_Currency_Header}

Verify Base Currency Input Field
    [Documentation]    This will verify Base Currency Input Field.
    Wait Until Element Is Enabled    ${Primary_Location_Input_Field}

Verify Anticipated Duration Header
    [Documentation]    This will verify Anticipated Duration Header on Page.
    Element Should Be Visible    ${Anticipated_Duration_Header}

Verify Anticipated Duration Input Field
    [Documentation]    This will verify Anticipated Duration Input field on Page.
    Wait Until Element Is Enabled    ${Anticipated_Duration_Input_Field}

Verify Anticipated Duration Dropdown
    [Documentation]    This will verify Anticipated Duration Dropdown on Page.
    Wait Until Element Is Enabled    ${Anticipated_Duration_Dropdown}

Verify Rate Type Header
    [Documentation]    This will verify Rate Type Header on Page.
    Element Should Be Visible    ${Rate_Type_Header}

Verify Rate Type Dropdown
    [Documentation]    This will verify Rate Type Dropdown on Page.
    Wait Until Element Is Enabled    ${Rate_Type_Dropdown}

Click Primary Work Location DropDown Button
    [Documentation]    This will click on Primary Work Location DropDown Button
    Wait Until Element Is Enabled    ${Primary_Location_Header_DropDown_Button}     timeout=10s
    Click Element    ${Primary_Location_Header_DropDown_Button}

Enter Primary Location
    [Arguments]    ${Location}
    [Documentation]    This will enter Primary Location as mentioned in argument.
    ${Location_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Location}    ']
    Wait Until Element Is Enabled    ${Location_Selected}
    Click Element    ${Location_Selected}
    Sleep    6s

Click Currency DropDown Button
    [Documentation]    This will click Currency DorpDown Button.
    Wait Until Element Is Enabled    ${Currency_DropDown_Button}
    Click Element    ${Currency_DropDown_Button}

Enter Currency
    [Arguments]    ${Currency}
    [Documentation]    This will enter Currenyc mentioned in the Argument.
    ${Currency_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Currency}    ']
    Wait Until Element Is Enabled    ${Currency_Selected}
    Click Element    ${Currency_Selected}
    Sleep    6s

Enter Anticipated Duration Value
    [Arguments]    ${Value}
    [Documentation]    This will the Anticipated Duration Value as mentioned in Argument.
    Wait Until Element Is Enabled    ${Anticipated_Duration_Input_Field}
    press keys    ${Anticipated_Duration_Input_Field}    CTRL+a+BACKSPACE
    #Clear Element Text    ${Anticipated_Duration_Input_Field}
    Input Text    ${Anticipated_Duration_Input_Field}  ${Value}  True

Click Anticipated Duration DropDown
    [Documentation]    This will click Anticipated Duration DropDown.
    Wait Until Element Is Enabled    ${Anticipated_Duration_Dropdown}
    Click Element    ${Anticipated_Duration_Dropdown}

Enter Anticipated Duration Type
    [Arguments]    ${Type}
    [Documentation]    This will Enter the Anticipated Duration Type as mentioned in Argument.
    ${Type_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Type}    ']
    Wait Until Element Is Enabled    ${Type_Selected}
    Click Element    ${Type_Selected}

Click Rate Type DropDown
    [Documentation]    This will click on Rate Type Dropdown Button.
    Wait Until Element Is Enabled    ${Rate_Type_Dropdown}
    Click Element    ${Rate_Type_Dropdown}

Enter Rate Type
    [Arguments]    ${Rate_Type}
    [Documentation]    This will enter Rate Type as mentioned as Argument.
    ${Rate_Type_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Rate_Type}    ']
    Wait Until Element Is Enabled    ${Rate_Type_Selected}
    Click Element    ${Rate_Type_Selected}
    Sleep    6s

Verify Build Proposal Header
    [Documentation]    This will verify Build Proposal Header is present on the page.
    Wait Until Element Is Visible    ${Build_Proposal_Header}
    Element Should Be Visible    ${Build_Proposal_Header}

Verify Partner Team Button
    [Documentation]    This will verify Partner Team Button is present on the page.
    Wait Until Element Is Enabled    ${Partner_Team_Button}
    Element Should Be Enabled    ${Partner_Team_Button}

Verify Core Team Button
    [Documentation]    This will verify Core Team Button is present on the page.
    Wait Until Element Is Enabled    ${Core_Team_Button}
    Element Should Be Enabled    ${Core_Team_Button}

Click Partner Team Button
    [Documentation]    This will click partner team button.
    Wait Until Element Is Enabled    ${Partner_Team_Button}
    Click Element    ${Partner_Team_Button}

Click Core Team Button
    [Documentation]    This will click core team button.
    Wait Until Element Is Enabled    ${Core_Team_Button}
    Click Element    ${Core_Team_Button}

Verify Bread Crumb
    [Documentation]    This will verify Bread Crumb on the Page.
    Wait Until Element Is Enabled    ${Bread_Crumb}

Veirfy Client Name Field Is Enabled
    [Documentation]    This will verify if Client Name Field is Enabled.
    Element Should Be Enabled    ${Client_Name}

Verify Opportunity Name Field Is Disabled
    [Documentation]    This will verify if Opportunity Name Field is Disabled.
    Element Should Be Disabled    ${Opportunity_Name}

Verify Industry Type Field Is Disabled
    [Documentation]    This will verify if Industry Type Field is Disabled.
    Element Should Be Disabled    ${Industry_Type}

Verify Select Capabilities Field Is Disabled
    [Documentation]    This will verify if Select Capabilities Field is Disabled.
    Element Should Be Disabled    ${Capabilities_DropDown_Button}

Verify Scenario A Tab Is Disabled
    [Documentation]    This will verify if Scenario A Tab is Disabled.
    Element Should Be Disabled    ${Scenario_A}

Verify Primary Work Location Text Field Is Disabled
    [Documentation]    This will verify if Primary Work Location Text Field Is Disabled.
    Element Should Be Disabled    ${Primary_Location_Input_Field}

Verify Primary Work Location DropDown Is Disabled
    [Documentation]    This will verify if Primary Work Location DropDown Is Disabled.
    Element Should Be Disabled    ${Primary_Location_Header_DropDown_Button}

Verify Primary Work Location Is Enabled
    [Documentation]     This will verify if primary work location field is enabled
    Wait Until Element Is Enabled    ${Primary_Location_Input_Field}
    Element Should Be Enabled    ${Primary_Location_Input_Field}
    Sleep    3s

Verify Currency Text Field Is Disabled
    [Documentation]    This will verify if Currency Text Field Is Disabled.
    Element Should Be Disabled    ${Base_Currency_Input_Field}

Verify Currency DropDown Is Disabled
    [Documentation]    This will verify if Currency DropDown Is Disabled.
    Element Should Be Disabled    ${Currency_DropDown_Button}

Verify Anticipated Duration Input Field Is Disabled
    [Documentation]    This will verify if Anticipated Duration Input Field Is Disabled.
    Element Should Be Disabled    ${Anticipated_Duration_Input_Field}

Verify Anticipated Duration DropDown Is Disabled
    [Documentation]    This will verify if Anticipated Duration DropDown Is Disabled.
    Element Should Be Disabled    ${Anticipated_Duration_Dropdown}

Verify Rate Type DropDown Is Disabled
    [Documentation]    This will verify if Rate Type DropDown Is Disabled.
    Element Should Be Disabled    ${Rate_Type_Dropdown}

Verify Partner Team Button Is Disabled
    [Documentation]    This will verify if Partner Team Button Is Disabled.
    Element Should Be Disabled    ${Partner_Team_Button}

Verify Core Team Button Is Disabled
    [Documentation]    This will verify if Core Team Button Is Disabled.
    Element Should Be Disabled    ${Core_Team_Button}

Click Bread Crumb Opportunities
    [Documentation]    This will click Opportunities Bread Crumb.
    Wait Until Element Is Enabled    ${Bread_Crumb_Opportunities}
    Click Element    ${Bread_Crumb_Opportunities}

Click Bread Crumb Icon
    [Documentation]    This will click Bread Crumb Icon.
    Wait Until Element Is Enabled    ${Bread_Crumb_Icon}
    Click Element    ${Bread_Crumb_Icon}

Verify Industry Type Field Is Enabled
    [Documentation]    This will verify Industry Type Field Is Enabled
    Wait Until Element Is Enabled    ${Industry_Type}
    Element Should Be Enabled    ${Industry_Type}
    Sleep    3s

Click Save Button
    [Documentation]    This will verify and click save button.
    Wait Until Element Is Enabled    ${Save_Button}
    Element Should Be Enabled    ${Save_Button}
    Click Element    ${Save_Button}
    Sleep    3s

Verify Opportunity Name in Breadcrumb
    [Documentation]    This will compare opportunity name in opportunity name field and breadcrumb.
    ${Opportunity_Name_Value}=    Get Value    ${Opportunity_Name}
    Log    ${Opportunity_Name_Value}
    ${Breadcrumb_Opportunity_Name}=    Catenate  SEPARATOR=    xpath=//div[text()='    ${Opportunity_Name_Value}    ']
    Wait Until Element Is Visible    ${Breadcrumb_Opportunity_Name}
    Element Should Be Visible    ${Breadcrumb_Opportunity_Name}

Click Create Client Button
    [Documentation]    This will click create client button in client name drop down.
    Wait Until Element Is Enabled    ${Create_Client_Button}
    Element Should Be Enabled    ${Create_Client_Button}
    Click Element    ${Create_Client_Button}

Enter Client In Create Client Name Input Field
    [Arguments]    ${Name}
    [Documentation]    This will enter client name in the client name input text box.
    Wait Until Element Is Enabled    ${Client_Name_Input_Field}
    Element Should Be Enabled    ${Client_Name_Input_Field}
    #Click Element    ${Client_Name_Input_Field}
    press keys    ${Client_Name_Input_Field}    CTRL+a+BACKSPACE
    Input Text    ${Client_Name_Input_Field}    ${Name}

Click Accept Button
    [Documentation]    This will click on accept button on create client input field.
    Wait Until Element Is Enabled    ${Accept_Button}
    Element Should Be Enabled    ${Accept_Button}
    Click Element    ${Accept_Button}

Change Opportunity Name
    [Arguments]    ${Name}
    [Documentation]    This will change change the opportunity name to value provided as argument.
    press keys    ${Opportunity_Name}    CTRL+a+BACKSPACE
    #Clear Element Text    ${Opportunity_Name}
    Input Text    ${Opportunity_Name}    ${Name}    True

Verify Oppotunity Name Value
    [Arguments]    ${Value}
    [Documentation]    This will verify that the opportunity name value is same as the value mentioned in argument.
    ${Opportunity}=    Get Value    ${Opportunity_Name}
    Should Be Equal    ${Value}    ${Opportunity}

Type Client Name in Client Name Input Text Box
    [Arguments]    ${Partial_Client_Name}
    [Documentation]    This will type the client name as mentioned in the argument in client name input text box.
    Wait Until Element Is Enabled    ${Client_Name}
    Element Should Be Enabled    ${Client_Name}
    Input Text    ${Client_Name}    ${Partial_Client_Name}    True

Verify Client Name List
    [Arguments]    ${Count}
    [Documentation]    This will count the number of elements found in the Client List
    ${Count}=    Convert To Integer    ${Count}
    ${Client_Names}=    Get WebElements    ${Client_Name_List}
    ${Length}=    Get Length    ${Client_Names}
    Should Be Equal    ${Count}    ${Length}

Click Client Name Create Button
    [Arguments]    ${Client}
    [Documentation]    This will click on client name (create client) button.
    ${Client_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Client}
    ${Client_Selected}=    Catenate    ${Client_Selected}    (Create Client)']
    Wait Until Element Is Enabled    ${Client_Selected}
    Click Element    ${Client_Selected}

Verify Client Name Field is disabled
    [Documentation]    This will verify whether client name field is disabled.
    Element Should Be Disabled    ${Client_Name}

Verify Client Name List Is Not Present
    [Documentation]    This will verify that Client Name List is not present.
    Element Should Not Be Visible    ${Client_Name_Options}

Verify Client Name Value
    [Arguments]    ${Value}
    [Documentation]    This will verify that the client name value is same as the value mentioned in argument.
    ${Client}=    Get Value    ${Client_Name}
    Should Be Equal    ${Value}    ${Client}

Add Teamlet
    [Arguments]    ${Teamlet}
    [Documentation]    This will add teamlet mentioned in argument to the opportunity.
    ${Teamlet_Selected}=    Catenate    SEPARATOR=    xpath=//span[text()='    ${Teamlet}
    ${Teamlet_Selected}=    Catenate    SEPARATOR=    ${Teamlet_Selected}    ']//parent::div//i
    Wait Until Element Is Enabled    ${Teamlet_Selected}
    Click Element    ${Teamlet_Selected}

Add Partner Team Member
    [Arguments]    ${Member}
    [Documentation]    This will add Partner Team Member mentioned in argument to the opportunity.
    ${Member_Selected}=    Catenate    SEPARATOR=    xpath=//span[text()='    ${Member}
    ${Member_Selected}=    Catenate    SEPARATOR=    ${Member_Selected}    ']//parent::div//i
    Wait Until Element Is Enabled    ${Member_Selected}
    Click Element    ${Member_Selected}

Click Core Team Category Button
    [Documentation]    This will click core team category button.
    Wait Until Element Is Enabled    ${Core_Team_Category_Button}
    Click Element    ${Core_Team_Category_Button}

Add Core Team Member
    [Arguments]    ${Member}
    [Documentation]    This will add partner team member as mentioned in the argument to the opportunity.
    ${Member_Selected}=    Catenate    SEPARATOR=    xpath=//div[text()='    ${Member}
    ${Member_Selected}=    Catenate    SEPARATOR=    ${Member_Selected}    ']//parent::span//parent::div//i
    Wait Until Element Is Enabled    ${Member_Selected}
    Click Element    ${Member_Selected}

Click Advisor Button
    [Documentation]    This will add click on add button of advisor.
    Wait Until Element Is Enabled    ${Advisor_Button}
    Click Element    ${Advisor_Button}

Click Teams Button
    [Documentation]    This will click teams button.
    Wait Until Element Is Enabled    ${Teams_Button}
    Click Element    ${Teams_Button}

Verify Anticipated Duration Value
    [Arguments]    ${Value}    ${Duration}
    [Documentation]    This will compare the value present in anticipated duration text box with the value mentioned as argument.
    Wait Until Element Is Enabled    ${Anticipated_Duration_Input_Field}
    ${Actual_Value}=    Get Value    ${Anticipated_Duration_Input_Field}
    Should Be Equal    ${Actual_Value}    ${Value}
    Wait Until Element Is Enabled    ${Anticipated_Duration_Dropdown_Option}
    ${Actual_Duration}=    Get Text    ${Anticipated_Duration_Dropdown_Option}
    Should Be Equal    ${Actual_Duration}    ${Duration}

Verify PreConfigured SKU button present
    [Documentation]    This will verify pre-configured button is present on resource panel.
    Wait Until Element Is Visible    ${Pre_Configured_SKU_Button}    10s

Click PreConfigured SKU button
    [Documentation]    This will click the pre-configured sku button.
    Wait Until Element Is Visible    ${Pre_Configured_SKU_Button}    10s
    Click Element    ${Pre_Configured_SKU_Button}

Get RoleNames from opportunity
    [Documentation]     This will fetch role names from opportunity
    @{RoleNameList}=    Create List
    #${RoleNameList}=    Create List    @{RoleNameList}
    @{Roles}=   Get WebElements         xpath=//div[@id='nameTable']//div//div//div[2]//span
    Log    ${Roles}
    FOR    ${Role}    IN    @{Roles}
        ${RoleName}=    Get Text    ${Role}
        Append To List    @{RoleNameList}   ${RoleName}
    END
    Log Many    @{RoleNameList}
    Return From Keyword     @{RoleNameList}

Get Role Allocation from opportunity
    [Documentation]     This will fetch the role allocation from opportunity
    ${RoleAllocationList}=    Create List
    @{RoleAllocationList}=
    ${Roles}=   Get WebElements    ${Role_Allocation_Block}
    FOR    ${Role}    IN    ${Roles}
        ${RoleAllocation}=    Get Element Text    ${Role}
        Append To List    @{RoleAllocationList}   ${RoleAllocation}
    END
    Log Many    @{Role_Allocation_Block}
    Return From Keyword     @{RoleAllocationList}

Add External Advisor and add AdvisorName, RateType, EstimatedTime
    [Arguments]     ${Advisor_Name}     ${Advisor_RateType}     ${Estimated_Time}
    [Documentation]     This will add external advisor and add AdvisorName, RateType, EstimatedTime to an opportunity
    Wait Until Element Is Enabled    ${External_Advisor_Button}
    Click Element    ${External_Advisor_Button}
    Sleep    3s
    #Click Element    ${Expand_Team_Composition_Container}
    Press Keys  xpath=//body    \ue00f
    Click Element    ${External_Advisor_Name_DropDown}

    IF      "${Advisor_Name}" == "Unknown Advisor (rate may vary)"
        ${Advisor_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Advisor_Name}${SPACE}    ']
        Click Element    ${Advisor_Selected}
        #Sleep    3s
        Click Element    ${External_Advisor_RateType_DropDown}
        ${Type_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Advisor_RateType}    ']
        Wait Until Element Is Enabled    ${Type_Selected}
        Click Element    ${Type_Selected}
        #Sleep    3s
        Input Text    xpath=//input[@placeholder="Enter time"]    ${Estimated_Time}
    ELSE
        ${Advisor_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Advisor_Name}    ']
        #Wait Until Element Is Enabled    ${Advisor_Selected}
        Click Element    ${Advisor_Selected}
        #Sleep    3s
        Click Element    ${External_Advisor_RateType_DropDown}
        ${Type_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='    ${Advisor_RateType}    ']
        Wait Until Element Is Enabled    ${Type_Selected}
        Click Element    ${Type_Selected}
        #Sleep    3s
        Input Text    xpath=//input[@placeholder="Enter time"]    ${Estimated_Time}
    END
Add External Advisor and Manually Enter Advisor Name
    [Documentation]     This will add External Advisor block and manually enter Advisor Name, Rate Type, EstimatedTime to an opportunity
    Wait Until Element Is Enabled    ${External_Advisor_Button}
    Click Element    ${External_Advisor_Button}
    Sleep    3s
    Wait Until Element Is Enabled    ${External_Advisor_Input_TextBox}
    #Click Element    ${Expand_Team_Composition_Container}
    Press Keys  xpath=//body    \ue00f
    Click Element       ${External_Advisor_Input_TextBox}
    #Sleep    3s
    #Manually Enter Advisor Name in Advisor textBox
    Input Text    ${External_Advisor_Input_TextBox}    Christian Spieler
    Click Element    xpath=//span[text()='Christian Spieler']
    #Sleep    3s
    # RateType is selected as Daily
    Click Element   ${External_Advisor_RateType_DropDown}
    ${Type_Selected}=    Catenate  SEPARATOR=    xpath=//span[text()='Daily']
    Wait Until Element Is Enabled    ${Type_Selected}
    Click Element    ${Type_Selected}
    Sleep    3s
    Input Text    xpath=//input[@placeholder="Enter time"]    10

Caluclate External Advisor Total Cost
    [Documentation]     This will calculate the total cost of External advisor
    ${UI_ExternalAdvisor_Rate_value}   get element attribute    xpath=//html/body/div[1]/div/div[3]/div/div/div[2]/div[2]/div[1]/div/div/div/div[2]/div/div/div[3]/div/div[3]/div/div/div/div/input      value
    ${Est_Total_Time}   Get Value    xpath=//input[@placeholder="Enter time"]
    ${Total_Cost}=      Evaluate    ${UI_ExternalAdvisor_Rate_value} * ${Est_Total_Time}
    ${var}=  convert to number  ${Total_Cost}
    ${b}=    evaluate   ${var}/1000
    ${c}    convert to integer    ${b}
    Return From Keyword     ${c}

Click Drill-In button under Teams header
    [Documentation]    This will click drill-in button under the Teams button
    Wait Until Element Is Visible    ${Show_More_Teamlet_Button}
    Click Element    ${Show_More_Teamlet_Button}

Fetch all the teamlets based on Geography from UI
    @{locators}=    Get WebElements    xpath=//span[starts-with(@class, 'mb-0 text-sm font-normal')]
    #${result}=      Create List
    @{result}=      Create List
    FOR    ${locator}    IN    @{locators}
        ${name}=    Get Text    ${locator}
        ${value}=   Replace String    ${name}    ${SPACE}    ${EMPTY}
        #${stripped}=    Strip String    ${name}     mode=both
        Log    ${value}
        Append To List    ${result}     ${value}
    END
    Log Many    @{result}
    Return From Keyword     @{result}

Fetch all the teamlets from UI
    @{locators}=    Get WebElements    xpath=//span[starts-with(@class, 'mb-0 text-sm font-normal')]
    #${result}=      Create List
    @{result}=      Create List
    FOR    ${locator}    IN    @{locators}
        ${name}=    Get Text    ${locator}
        Log    ${name}
        Append To List    ${result}     ${name}
    END
    Log Many    @{result}
    Return From Keyword     @{result}

Delete Teamlet block
    [Documentation]    This will delete all the roles from existing teamlet added in the opportunity
    #Wait Until Element Is Enabled    locator
    Click Element    ${Expand_Team_Composition_Container}
    Sleep    2s

    #Press Keys  xpath=//body    \ue00f
    Scroll Element Into View    ${Select_All_Roles_In_Teamlet_Block}
    Click Element    ${Select_All_Roles_In_Teamlet_Block}
    Sleep    3s
    Click Element    ${Remove_Teamlet_button}
    sleep   5s
    Click Element   ${Delete_Block_Confirmation}
    Sleep    3s
    Click Element    ${Expand_Team_Composition_Container}


Delete SKU Block
    [Documentation]    This will delete all the roles from existing SKU added in the opportunity
    Sleep    5s
    Click Element    ${Expand_Team_Composition_Container}
    Sleep    5s
    Scroll Element Into View    ${Select_All_Roles_In_SKU_Block}
    Click Element    ${Select_All_Roles_In_SKU_Block}
    Sleep    3s
    Click Element    ${Remove_SKU_button}
    Sleep    5s
    Click Element    ${Delete_Block_Confirmation}
    Sleep    3s
    Click Element    ${Expand_Team_Composition_Container}

Delete Other Resources Block
    [Documentation]    This will delete all OR from the opportunity
    Sleep    5s
    Click Element    ${Expand_Team_Composition_Container}
    Sleep    2s
    #Scroll Element Into View    ${Select_All_Other_Resources_Block}
    Click Element    ${Select_All_Other_Resources_Block}
    Sleep    3s
    Click Element    ${Remove_Other_Resources_Button}
    Sleep    3s
    #Click Element    ${Expand_Team_Composition_Container}

Delete External Advisor Block
    [Documentation]    This will delete all External Advisor from the opportunity
    Sleep    2s
    Click Element    ${Expand_Team_Composition_Container}
    Sleep    2s
    #Scroll Element Into View    ${Select_All_Other_Resources_Block}
    Click Element    ${Select_All_Roles_In_ExternalAdvisor_Block}
    Sleep    3s
    Click Element    ${Remove_External_Advisor_Button}
    Sleep    3s
    Click Element    ${Expand_Team_Composition_Container}


Add Other Resource
    [Documentation]     This will add the first OR from the list
    Click Element    ${Add_Other_Resources_+_Button}
    Sleep    5s
    Input Text    ${Other_Resource_Total_Price_TextField}    32

Enter UnKnown Advisor Custom Rate Value
	[Arguments]     ${Value}
	[Documentation]    This will enter the  UnKnown Advisor Custom Rate valuie as mentioned in Argument.
	Wait Until Element Is Enabled    ${Unknown_Advisor_Rate_Input_Field}
	press keys    ${Unknown_Advisor_Rate_Input_Field}    CTRL+a+BACKSPACE
	Input Text    ${Unknown_Advisor_Rate_Input_Field}  ${Value}  True







