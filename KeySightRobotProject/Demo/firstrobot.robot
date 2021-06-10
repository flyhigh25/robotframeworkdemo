*** Settings ***
Library  SeleniumLibrary    

*** Test Cases ***
#This is he Test to Contact Us page.It makes sure that the user must provicde all mandatory field before submittting a contact request 
GoToHomePage
    Open Browser    https://www.keysight.com/us/en/home.html  Chrome
    Maximize Browser Window
GoToContactUsPage 
    Sleep  1s 
# Link Locater Exercise 
    Click Link    link:Contact Us    
EnterFormFields
    Scroll Element Into View    id:ContactUsForm_StateProvince 
# name Locater Exercise  
    Input Text    name:EmailAddress    john.smith@gmail.com
    Input Text    name:LastName    Smith   
    Input Text    name:FirstGivenName    John
    Input Text    name:CompanyName    Keysight Inc
    Scroll Element Into View    id:ContactUsForm_productText
# id Locater Exercise 
    Input Text    id:ContactUsForm_Address1  Kodiak Dr
    Input Text    id:ContactUsForm_City  Austin    
    Scroll Element Into View    name:submit-qcta
 # xpath Locater Exercise    
    Click Element   xpath://input[@value='Other']      
    Click Button    name:submit-qcta 
BrowserAlert   
   Alert Should Be Present    Provide details about your inquiry.
   Close Browser
    


    
