@admin_signed_in

Feature: An Admin can manage services

  Scenario: Admin can create a new service
    When I visit "/admin/services"
    And I enter "https://parser4.herokuapp.com/" into "service_base_url"
    And I click ".add_service"
    Then I expect to see "Service created"
    Then I expect to see "https://parser4.herokuapp.com/"
    Then I expect to see "Passive voice detector"

  @service_exists
  Scenario: Admin can remove a service
    When I visit "/admin/services"
    Then I expect to see "Passive voice detector"
    When I click the link "delete"
    Then I expect to see "Service Destroyed"
    And I cannot see "Passive voice detector"

  @bob_exists
  Scenario: Bob cannot access the admin page
    When I log out
    And I log in as "bob@example.com"
    When I visit "/admin/services"
    Then I expect to see "You do not have the correct permissions to access that page"
    Then I expect to see "Browse existing (verified) grammar checkers to use"
