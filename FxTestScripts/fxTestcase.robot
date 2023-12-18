*** Settings ***
Resource               ../FResource/FXCommon.robot
Library                DateTime
Library                String
Library                QWeb
Library                QForce
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***
Verify name and Designation are in same tag
    [Tags]             NameDis
    [Documentation]    Verify the name and Designation are in the same tag
    Appstate           Home
    ${Designation}=    GetText                     //div[@class\='management-item__meta-wrapper']//h3[@class\='management-item__job-title']
    Log                ${Designation}
    ${EName}=          GetText                     //div[@class\='management-item__meta-wrapper']//a[text()\='Lachlan K. Murdoch']
    Log                ${EName}