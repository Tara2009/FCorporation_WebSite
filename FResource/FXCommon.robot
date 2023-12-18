*** Settings ***
Library                         QForce
Library                         QWeb
Library                         String


*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${BROWSER}                      chrome
${username}                     tarasrinivas50@brave-wolf-hcwlsf.com
${login_url}                    https://www.foxcorporation.com/management/executive-team/     #https://kuchifamily.in/     # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     https://www.foxcorporation.com/management/executive-team/           #https://kuchifamily.in


*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example
    # if you need to use multiple libraries containing keywords with duplicate names
    Set Library Search Order    QWeb                        QForce
    Open Browser                about:blank                 ${BROWSER}
    SetConfig                   LineBreak                   ${EMPTY}                    #\ue000
    SetConfig                   DefaultTimeout              20s                         #sometimes salesforce is slow
    Evaluate                    random.seed()               random                      # initialize random generator


End suite
    Close All Browsers


Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
   # ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                              2
    #Run Keyword If              ${login_status}             Login
    #ClickText                   Home
    #VerifyTitle                 Home | Salesforce


    # Example of custom keyword with robot fw syntax
