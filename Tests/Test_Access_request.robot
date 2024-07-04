*** Settings ***
Resource    ../Tests/Resource/Access_request.robot

Test Tags    Access_request

*** Test Cases ***
Start TestCase
    Start TestCase

Submit Anugal username and password
    Submit Anugal username and password  

Access_Request
    Access_Request  
    Check status
