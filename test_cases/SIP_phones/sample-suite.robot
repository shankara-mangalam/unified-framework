*** Settings ***
Resource    ../../api/SIP_Phones/68xx.robot


*** Test Cases ***
Suite Setup    Create new Session    http://10.211.41.215/    admin    22222

001 Get directory route
    [Documentation]    Sample
    Get directory
