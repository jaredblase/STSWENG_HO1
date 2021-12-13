*** Settings ***
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***    USERNAME                PASSWORD              ERROR MESSAGE
Locked Out User       locked_out_user         secret_sauce          Epic sadface: Sorry, this user has been locked out.
Wrong Password        standard_user           test                  Epic sadface: Username and password do not match any user in this service

*** Keywords ***
Login With Invalid Credentials Should Fail
  [Arguments]   ${username}   ${password}   ${error message}
  Input Credentials   ${username}  ${password}
  Submit Credentials
  Element Text Should Be  css:*[data-test="error"]  ${error message}