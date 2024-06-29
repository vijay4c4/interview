Feature: Compose Email

  Background: 
  
      Given I am logged into Gmail
      When I click on the "Compose" button

  Scenario: Compose Email with All Fields Filled Correctly
    And I enter a valid recipient email "vijaykumar@gmail.com"
    And I enter a subject "Test Subject"
    And I enter the email body "This is a test email."
    And I click on the "Send" button
    Then the email should be sent successfully
    
  Scenario: Compose Email with Multiple Recipients
    And I enter multiple valid recipient emails "vijay1@gmail.com, vijay2@gmail.com"
    And I enter a subject "Test Subject"
    And I enter the email body "This is a test email."
    And I click on the "Send" button
    Then the email should be sent to all specified recipients
    
  Scenario: Compose Email with CC and BCC Recipients
    And I enter a valid recipient email "vijaykumar@gmail.com"
    And I enter valid CC email addresses "vijaykumar@gmail.com"
    And I enter valid BCC email addresses "vijaykumar2@gmail.com"
    And I enter a subject "Test Subject"
    And I enter the email body "This is a test email."
    And I click on the "Send" button
    Then the email should be sent to all specified recipients, CC, and BCC
    

  Scenario: Compose Email with Attachment
    And I enter a valid recipient email "vijay4@gmail.com"
    And I enter a subject "Test Subject"
    And I enter the email body "This is a test email."
    And I attach a file "testfile.txt"
    And I click on the "Send" button
    Then the email should be sent with the attachment
    

  Scenario: Compose Email with HTML Content
    And I enter a valid recipient email "test@example.com"
    And I enter a subject "Test Subject"
    And I enter HTML formatted text "<b>This is a test email.</b>" in the email body
    And I click on the "Send" button
    Then the email should retain HTML formatting when received
    
    
  
    
    
  
