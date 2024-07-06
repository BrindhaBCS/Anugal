*** Settings ***
Resource    ../Tests/Resource/User Administration.robot
Test Tags    useradmin01

*** Test Cases ***
Start TestCase
    Start TestCase

Submit Anugal username and password
    Submit Anugal username and password  

Create User_id
    Create User_id 
    View the User id 
    Edit the User id 
    Delete user id  

Finish TestCase 
    Finish TestCase         



