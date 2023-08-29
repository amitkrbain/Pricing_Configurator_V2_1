*** Settings ***
Library           DatabaseLibrary
Library           SeleniumLibrary
Library           Collections
Library           String
Resource          ../Resources/Robot_Keywords.robot

*** Variables ***
${DBHost}         pricing-staging.chz6xtndhhej.us-east-1.rds.amazonaws.com
${DBName}         pricingstagingdb
${DBPass}         VY8Z2sueKnZJ4Map
${DBPort}         5432
${DBUser}         bainadmin

*** Keywords ***
Connect DB
     Connect To Database  psycopg2   ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}

Disconnect DB
    Disconnect From Database

Fetch the list of all Team blocks added in Opportunity from DB
    [Documentation]  This will fetch opportunity team blocks from the db.
    ${Opportunity_Name_Value}=   Get Value      ${Opportunity_Name}
    Connect DB
    @{Output}=   Query   select ac3.title from api_case ac inner join api_casescenario ac2 on ac.id= ac2.case_id inner join api_casemodule ac3 on ac2.id= ac3.scenario_id where ac.title= '${Opportunity_Name_Value}'
    Log     ${Output}
    Disconnect DB

Fetch Opportunity Name and compare with opportunity name from DB
    [Documentation]    This will fetch opportunity name from the breadcrumb.
    ${Opportunity_Name_Value}=    Get Value    ${Opportunity_Name}
    Log    ${Opportunity_Name_Value}
    ${str1}=    Catenate    ${Opportunity_Name_Value}
    Log    ${str1}
    Connect DB
    ${Output}=   Query   SELECT title from api_case WHERE title= '${Opportunity_Name_Value}'
    ${Output}=  Catenate    ${Output}
    ${Output}=  Remove String    ${Output}  (
    ${Output}=  Remove String    ${Output}  )
    ${Output}=  Remove String    ${Output}  ,
    ${Output}=  Remove String    ${Output}  '
    ${Output}=  Remove String    ${Output}  '
    ${Output}=  Remove String    ${Output}  [
    ${Output}=  Remove String    ${Output}  ]
    Log    ${Output}
    Should Be Equal   ${Output}    ${Opportunity_Name_Value}
    Disconnect DB

Fetch the team allocation added in Opportunity from DB
    [Documentation]  This will fetch the Team allocation details from DB that is added in opportunity
    ${Opportunity_Name_Value}=      Get Value   ${Opportunity_Name}
    Connect DB
    @{Output}=      Query   select distinct ac5.allocation from api_case ac inner join api_casescenario ac2 on ac.id= ac2.case_id inner join api_casemodule ac3 on ac3.scenario_id= ac2.id inner join api_casemodulerole ac4 on ac3.id= ac4.module_id inner join api_casemoduleroleperiod ac5 on ac4.id= ac5.module_role_id inner join api_role ar on ac4.role_id= ar.id inner join api_universalrole au on ar.universal_role_id= au.id where ac.title= '${Opportunity_Name_Value}' and au."name" ='Senior Partner';
    ${Output}=  Catenate    ${Output}
    ${Output}=  Remove String    ${Output}  (
    ${Output}=  Remove String    ${Output}  )
    ${Output}=  Remove String    ${Output}  ,
    ${Output}=  Remove String    ${Output}  '
    ${Output}=  Remove String    ${Output}  '
    ${Output}=  Remove String    ${Output}  [
    ${Output}=  Remove String    ${Output}  ]
    ${Output}=  Remove String    ${Output}  Decimal
    Return From Keyword     ${Output}
    #${initial_Output}=  Evaluate    ${Output} * 100
    #Log    ${Output}
    Disconnect DB

Fetch External Advisor added in Opportunity from DB
    [Documentation]  This will fetch the External Advisor details from DB that is added in opportunity
    ${Opportunity_Name_Value}=      Get Value   ${Opportunity_Name}
    Connect DB
    @{Output}=      Query   select ac3."name",ac3.rate_type, ac3.estimated_total_time from api_casescenario ac2 inner join api_caseexternaladvisor ac3 on ac2.id= ac3.scenario_id inner join api_case ac on ac.id = ac2.case_id where ac.title = '${Opportunity_Name_Value}';
    ${Output}=  Catenate    ${Output}
    ${Output}=  Remove String    ${Output}  (
    ${Output}=  Remove String    ${Output}  )
    ${Output}=  Remove String    ${Output}  ,
    ${Output}=  Remove String    ${Output}  '
    ${Output}=  Remove String    ${Output}  '
    ${Output}=  Remove String    ${Output}  [
    ${Output}=  Remove String    ${Output}  ]
    Return From Keyword     ${Output}
    Disconnect DB

Fetch list of all Teamlets based on country from DB
    [Documentation]  This will fetch all Teamlets based on the primary location
    [Arguments]     ${Primary_Location}
    Connect DB
    @{teamlets}=      Query   select distinct at2."name" from api_teamlet at2 inner join api_teamletcountryrole at3 on at3.teamlet_id= at2.id inner join api_country ac on at3.country_id= ac.id where ac."name"= '${Primary_Location}'
    ${cnt}=  Get length   ${teamlets}
    @{result}=      Create List
    FOR    ${i}    IN RANGE    ${cnt}
        ${firstRow}     Set Variable    ${teamlets}[${i}]
        ${Output}=  Catenate    ${firstRow}
        ${Output}=  Remove String    ${Output}  (
        ${Output}=  Remove String    ${Output}  )
        ${Output}=  Remove String    ${Output}  ,
        ${Output}=  Remove String    ${Output}  '
        ${Output}=  Remove String    ${Output}  '
        ${value}=   Replace String    ${Output}    ${SPACE}    ${EMPTY}
        Append To List    ${result}    ${value}
        Exit For Loop If    ${i} == ${cnt}
    END
    Log Many   @{result}
    Disconnect DB
    Return From Keyword     @{result}


Extract Country Names From Database
    Connect DB
    @{Countries_List}=    Query    select distinct ac.name as country_name from api_country ac order by country_name asc;
    Log Many    @{Countries_List}
    Disconnect DB
    Return From Keyword    @{Countries_List}
    
Extract Region Names and Ids From Database
    Connect DB
    @{Region_list}=     Query    select ar.id from api_region ar order by ar."name" asc;
    Log Many    @{Region_list}
    Disconnect DB
    Return From Keyword     @{Region_list}

Extract Country Names Based On Region from Database
    [Arguments]     ${Region_Id}
    Connect DB
    @{Countries_List_By_Region}=     Query    select distinct ac.name from api_country ac where ac.region_id= ${Region_Id}
    Log Many    @{Countries_List_By_Region}
    Disconnect DB
    Return From Keyword     @{Countries_List_By_Region}


Extract Countries list for America region from DB
    Connect DB
    @{Countries_List_By_Region}=     Query    select distinct ac.name from api_country ac where ac.region_id = '5572bda6-0299-4cc0-af99-6ad52002e28d'
    Log Many    @{Countries_List_By_Region}
    Disconnect DB
    Return From Keyword     @{Countries_List_By_Region}


Extract Countries list for APAC region from DB
    Connect DB
    @{Countries_List_By_Region}=     Query    select distinct ac.name from api_country ac where ac.region_id = '14d45049-60b4-4864-88f8-4985437ab56b'
    Log Many    @{Countries_List_By_Region}
    Disconnect DB
    Return From Keyword     @{Countries_List_By_Region}


Extract Countries list for EMEA region from DB
    Connect DB
    @{Countries_List_By_Region}=     Query    select distinct ac.name from api_country ac where ac.region_id = '670801e5-3fe6-4609-a4df-3c196c494667'
    Log Many    @{Countries_List_By_Region}
    Disconnect DB
    Return From Keyword     @{Countries_List_By_Region}


