*** Settings ***
Library  SeleniumLibrary 
  
*** Variables ***
${homeURL}  https://www.keysight.com/us/en/home.html
${browser}  Chrome  
${email}  john.smith@gmail.com
${lastname}  Smith
${firstname}  John 
${companyname}  Keysight
${address}  Kodiak Dr
${city}  Austin

*** Keywords ***
Enter Email       Input Text    name:EmailAddress          ${email}
Enter Lastname    Input Text    name:LastName              ${lastname}  
Enter Firstname   Input Text    name:FirstGivenName        ${firstname}
Enter Comanyname  Input Text    name:CompanyName           ${companyname}
Enter Address     Input Text    id:ContactUsForm_Address1  ${address}
Enter City        Input Text    id:ContactUsForm_City      ${city}        

*** Test Cases ***
#This is he Test to Contact Us page.It makes sure that the user must provicde all mandatory field before submittting a contact request 
GoToHomePage
    [Tags]  Smoke
    Open Browser  ${homeURL}  ${browser}
    Maximize Browser Window
GoToContactUsPage 
    [Tags]  Sanity
    Sleep  1s 
# Link Locater Exercise 
    Click Link    link:Contact Us    
EnterFormFields
    [Tags]  Functional
    Scroll Element Into View    id:ContactUsForm_StateProvince 
# name Locater Exercise  
    Enter Email       
    Enter Lastname      
    Enter Firstname   
    Enter Comanyname  
    Scroll Element Into View    id:ContactUsForm_productText
# id Locater Exercise 
    Enter Address
    Enter City
    Scroll Element Into View    name:submit-qcta
# xpath Locater Exercise    
    Click Element   xpath://input[@value='Other']      
    Click Button    name:submit-qcta 
BrowserAlert
    [Tags]  Regrassion   
   Alert Should Be Present    Provide details about your inquiry.
   Close Browser 
   
    


    
