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
    Input Text    name:EmailAddress    ${email}
    Input Text    name:LastName        ${lastname}  
    Input Text    name:FirstGivenName  ${firstname}
    Input Text    name:CompanyName     ${companyname}
    Scroll Element Into View    id:ContactUsForm_productText
# id Locater Exercise 
    Input Text    id:ContactUsForm_Address1  ${address}
    Input Text    id:ContactUsForm_City      ${city}    
    Scroll Element Into View    name:submit-qcta
 # xpath Locater Exercise    
    Click Element   xpath://input[@value='Other']      
    Click Button    name:submit-qcta 
BrowserAlert
    [Tags]  Regrassion   
   Alert Should Be Present    Provide details about your inquiry.
   Close Browser 
   
    


    
