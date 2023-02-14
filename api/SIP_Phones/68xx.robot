*** Settings ***
Library     RequestsLibrary


*** Keywords ***
Create new Session
    [Documentation]    We may have to write custom authorization lib to work with all apps. this is allowed as per doc.
    [Arguments]    ${ep}    ${username}    ${password}
    @{auth}    Create List    ${username}    ${password}
    Create Session    alias=SESSION    url=${ep}    auth=@{auth}
    ${resp}    GET On Session    SESSION    /
    Should Be Equal As Strings    ${resp.status_code}    200

Get directory
    [Documentation]    With the existing session, try retrieving /directory.html route.
    ${resp}    GET On Session    SESSION    /directory.html
    Should Be Equal As Strings    ${resp.status_code}    200

Configure Line 1
    [Documentation]    Configure Line 1 in the phone.
    Log    Configured!
