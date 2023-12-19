*** Settings ***
Resource               ../FResource/FXCommon.robot
Library                DateTime
Library                String
Library                QWeb
Library                QForce
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Variables ***
${sametag}=             Two are in the same Tag

*** Test Cases ***
Verify name and Designation are in same tag
    [Tags]             NameDisignation
    [Documentation]    Verify the name and Designation are in the same tag
    Appstate           Home
    ${EName}=          GetText                     //div[@class\='management-item__meta-wrapper']//a[text()\='Lachlan K. Murdoch']
    Log                ${EName}
    ${Designation}=    GetText                     //div[@class\='management-item__meta-wrapper']//h3[@class\='management-item__job-title']
    Log                ${Designation}
   
   #Option 1
    Pass Execution If     (('${EName}'=='LACHLAN K. MURDOCH') and ('${Designation}'=='EXECUTIVE CHAIRAND CHIEF EXECUTIVE OFFICER'))    Two are in the Same Tag
    Fail              Fail because not in the same tag

   #Option 1
    #Run Keyword If     (('${EName}'=='LACHLAN K. MURDOCH') and ('${Designation}'=='EXECUTIVE CHAIRAND CHIEF EXECUTIVE OFFICER'))    Test Keyword1
    #...                ELSE                        Test Keyword2
Return message practice
    ${b}=    Returnmessage    

*** Keywords ***
Test Keyword1
    Log To Console     '${sametag}''
    Log                Executed- Two are in the same tag

Test Keyword2
    Log To Console     Fail two names are not in the same tag
    Log                Executed - Two names are not in the same tag

Returnmessage
    ${a}=    Set Variable    12
    Return From Keyword If    ${a}>= 12     Hello
    Return From Keyword If    ${a}<10       Hi