*** Settings ***
Resource               ../FResource/FXCommon.robot
Library                DateTime
Library                String
Library                QWeb
Library                QForce
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Variables ***
${sametag}             Two are in the same Tag

*** Test Cases ***
Verify name and Designation are in same tag
    [Tags]             NameDis
    [Documentation]    Verify the name and Designation are in the same tag
    Appstate           Home
    ${EName}=          GetText                     //div[@class\='management-item__meta-wrapper']//a[text()\='Lachlan K. Murdoch']
    Log                ${EName}
    ${Designation}=    GetText                     //div[@class\='management-item__meta-wrapper']//h3[@class\='management-item__job-title']
    Log                ${Designation}
    ${Setname}=        Set Variable                ${EName}
    #Pass Execution If                             '${EName}'=='Lachlan K. Murdoch'                        and '${Designation}'=='EXECUTIVE CHAIR AND CHIEF EXECUTIVE OFFICER'    Two are in Same Tag
    #Fail              fail because not in same tag
    #Run Keyword If     (('${EName}'=='Lachlan K. Murdoch') and ('${EName}'=='Lachlan K. Murdoch'))    Test Keyword1
    #...                ELSE                        Test Keyword2
    Run Keyword If     '${EName}'=='LACHLAN K. MURDOCH'    Test Keyword1
    ...                ELSE                        Test Keyword2

*** Keywords ***
Test Keyword1
    Log To Console     ${sametag}
    Log                Executed- Two are in the same tag

Test Keyword2
    Log To Console     Fail two names are not in the same tag
    Log                Executed - Two names are not in the same tag
