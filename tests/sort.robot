*** Settings ***
Suite Setup				Open Browser To Login Page
Suite Teardown		Close Browser
Test Setup				Go To Login Page
Test Template			Different Sorts Should Work
Resource					resource.robot

*** Test Cases ***						SELECTION VALUE			LOCATOR
Sort By A To Z								az									css:div.inventory_list > div:nth-child(1) > div.inventory_item_img > a#item_4_img_link
Sort By Z To A								za									css:div.inventory_list > div:nth-child(1) > div.inventory_item_img > a#item_3_img_link
Sort By Price Low To High			lohi								css:div.inventory_list > div:nth-child(1) > div.inventory_item_img > a#item_2_img_link
Sort By Price High To Low			hilo								css:div.inventory_list > div:nth-child(1) > div.inventory_item_img > a#item_5_img_link

*** Keywords ***
Different Sorts Should Work
	[Arguments]					${selection value}		${locator}
	Go To Login Page
	Input Credentials   standard_user		secret_sauce
	Submit Credentials
	Select From List By Value		css:*[data-test="product_sort_container"]		${selection value}
	Page Should Contain Element		${locator}