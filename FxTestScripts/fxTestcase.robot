*** Settings ***
Resource                        ../FResource/FXCommon.robot
Library                         DateTime
Library                         String
Library                         QWeb
Library                         QForce
Suite Setup                     Setup Browser
Suite Teardown                  End suite

*** Test Cases ***
Verify name and Designation are in same tag
    [Tags]                      NameDis
    [Documentation]             Verify the name and Designation are in the same tag
    Appstate                    Home
    ${EName}=                   GetText                     //div[@class\='management-item__meta-wrapper']//a[text()\='Lachlan K. Murdoch']
    Log                         ${EName}
    ${Designation}=             GetText                     //div[@class\='management-item__meta-wrapper']//h3[@class\='management-item__job-title']
    Log                         ${Designation}
    ${Setname}=                 Set Variable                ${EName}
    Pass Execution If   '${EName}'=='Lachlan K. Murdoch'  and '${Designation}'=='EXECUTIVE CHAIRAND CHIEF EXECUTIVE OFFICER'       Two are in Same Tag
    Fail                        fail because not in same tag
