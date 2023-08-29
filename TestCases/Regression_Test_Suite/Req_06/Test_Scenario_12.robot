*** Settings ***
Library   SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Test Setup    Click Create New Opportunity Button
Test Teardown    Click Bread Crumb Icon

*** Test Cases ***
TC_001
    [Documentation]    This will enter partial client name (numeric) in the client name text field and verify the options in dropdown box.
    Verify Opportunity Page URL
    Verify Client Name Field
    Click Client Name
    Type Client Name in Client Name Input Text Box    Automation_Testing
    Click Client Name Create Button    Automation_Testing