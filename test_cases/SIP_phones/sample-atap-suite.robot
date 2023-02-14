*** Settings ***
Resource    ../../api/ATAP/atap.robot
Library     JSONLibrary


*** Test Cases ***
Suite Setup    Create new Session    http://10.211.41.250/    # address of ATAP endpoint deployed as a service.

001 Press any key on phone
    [Documentation]    Sample
    ${resp}    Connect to a new phone    10.211.41.215    Mitel6869i
    ${phone_id}    Get Value From Json    ${resp}    phoneId
    Press a key    ${phone_id[0]}    1
