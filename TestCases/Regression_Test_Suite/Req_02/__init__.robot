*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Robot_Keywords.robot
Suite Setup    Run Keywords    Open Application    Verify Opportunities Page URL
Suite Teardown    Close Browser
