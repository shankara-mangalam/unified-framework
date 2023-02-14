*** Settings ***
Library     RequestsLibrary


*** Keywords ***
Create new Session
    [Documentation]    expects IP address of ATAP endpoint deployed as a service.
    [Arguments]    ${ep}
    Create Session    alias=SESSION    url=${ep}
    ${resp}    GET On Session    SESSION    /admin/stats
    Should Be Equal As Strings    ${resp.status_code}    200

Connect to a new phone
    [Documentation]    Creates and connects to a phone in atap ep, and returns its phone_id
    [Arguments]    ${ip_address}    ${phone_model}    ${extension_number}=0000    ${directory_name}=unknown
    &{data}    Create Dictionary
    ...    ipAddress=${ip_address}
    ...    phoneModel=${phone_model}
    ...    extensionNumber=${extension_number}
    ...    directoryName=${directory_name}
    ${resp}    POST On Session    SESSION    /phones    json=${data}
    # Should Be Equal As Strings    ${resp.status_code}    201 # can be 200 as well.
    RETURN    ${resp.json()}

Press a key
    [Documentation]    Press any key on the phone
    [Arguments]    ${phone_id}    ${key}
    Log    ${phone_id}
    ${resp}    POST On Session    SESSION    /phones/${phone_id}/press/${key}
    Should Be Equal As Strings    ${resp.status_code}    200

Get display from phone
    [Documentation]    Get display information from phone.
