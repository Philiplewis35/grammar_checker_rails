Feature: Bob can enter/leave the system

  Scenario: Bob creates a new account
    When I visit "/"
    And I click the link "Sign up"
    And I enter "bob@example.com" into "user_email"
    And I enter "Password123" into "user_password"
    And I enter "Password123" into "user_password_confirmation"
    And I click ".sign_up"
    Then I expect to see "Welcome! You have signed up successfully."
    Then I expect to see "Home"

  @bob_exists
  Scenario: Bob logs in
    When I visit '/'
    And I enter "bob@example.com" into "user_email"
    And I enter "Password123" into "user_password"
    And I click ".log_in"
    Then I expect to see "Signed in successfully."
    Then I expect to see "Home"

  @bob_signed_in
  Scenario: Bob logs out
    When I visit '/'
    And I click the link "Sign out"
    Then I expect to see "Log in"
