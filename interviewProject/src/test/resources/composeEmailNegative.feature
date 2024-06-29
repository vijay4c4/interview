Feature: Compose Email

  Background: 
    Given I am logged into Gmail
    When I click on the "Compose" button

  Scenario: Compose Email with Invalid Recipient Email Address

    And I enter an invalid recipient email "invalid-email"
    And I enter a subject "Test Subject"
    And I enter the email body "This is a test email."
    And I click on the "Send" button
    Then I should see an error message indicating the email address is invalid
    
  Scenario: Compose Email with Missing Recipient
 
    And I leave the recipient field empty
    And I enter a subject "Test Subject"
    And I enter the email body "This is a test email."
    And I click on the "Send" button
    Then I should see an error message indicating the recipient field is required
    
  Scenario: Compose Email with Oversized Attachment

    And I enter a valid recipient email "test@example.com"
    And I enter a subject "Test Subject"
    And I enter the email body "This is a test email."
    And I attach a file "largefile.zip" larger than the allowed size limit
    And I click on the "Send" button
    Then I should see an error message indicating the file size exceeds the limit
    
  Scenario: Compose Email with Invalid Characters in Subject

    And I enter a valid recipient email "test@example.com"
    And I enter special characters in the subject field "$$$"
    And I enter the email body "This is a test email."
    And I click on the "Send" button
    Then I should see an error message indicating invalid characters in the subject
    
  Scenario: Compose Email with Empty Subject and Body

    And I enter a valid recipient email "test@example.com"
    And I leave the subject and body fields empty
    And I click on the "Send" button
    Then I should see a warning message about sending an email without a subject or body
    
  Scenario: Compose Email and Cancel

    And I start composing an email
    And I click on the "Cancel" button
    Then the email should not be sent and no draft should be saved unless explicitly saved
    
  Scenario: Compose Email and Lose Internet Connection

    And I start composing an email
    And I lose internet connection before sending the email
    And I click on the "Send" button
    Then I should see an error message indicating the email could not be sent
    And the email should be saved in drafts
    
  Scenario: Compose Email with Email Body Exceeding Character Limit

    And I enter a valid recipient email "test@example.com"
    And I enter a subject "Test Subject"
    And I enter a very long text exceeding the character limit for the email body
    And I click on the "Send" button
    Then I should see an error message indicating the body text exceeds the limit
    
    
    
