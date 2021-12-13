*** Settings ***
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Resource          resource.robot

*** Test Cases ***
Valid Login
  Input Credentials  standard_user  secret_sauce
  Submit Credentials
	Page Should Contain Element		css:img.inventory_item_img[src="/static/media/sauce-backpack-1200x1500.34e7aa42.jpg"]