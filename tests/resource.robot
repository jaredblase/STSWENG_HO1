*** Settings ***
Documentation	Reusable keywords and variables.
Library	SeleniumLibrary

*** Variables ***
${BROWSER}			gc
${DEMO URL}			https://www.saucedemo.com/
${LOGIN URL}		https://www.saucedemo.com/
${PAGE TITLE}		Swag Labs

*** Keywords ***
Open Browser To Login Page
	Open Browser	${DEMO URL}	${BROWSER}
	Maximize Browser Window
	Login Page Should Be Open

Login Page Should Be Open
	Location Should Be		${DEMO URL}
	Title Should Be				${PAGE TITLE}

Go To Login Page
	Go To		${LOGIN URL}
	Login Page Should Be Open

Input Credentials
	[Arguments]	  ${username}	  ${password}
	Input Text	  user-name		  ${username}
	Input Text	  password		  ${password}

Submit Credentials
	Click Button	login-button
