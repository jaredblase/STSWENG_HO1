*** Settings ***
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Resource          resource.robot

*** Test Cases ***
Problem User Login
  Input Credentials  problem_user  secret_sauce
  Submit Credentials
  Page Should Contain Element		css:img.inventory_item_img[src="/static/media/sl-404.168b1cce.jpg"]