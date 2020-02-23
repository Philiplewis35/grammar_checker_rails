@bob_signed_in @service_exists

Feature: Bob can manage his services

  Scenario: Bob adds a service
    When I visit "/"
    And I select "Passive voice detector" from "#services"
    And I click '.save_services'
    Then I expect to see "Services Added"
    Then I expect to see "https://parser4.herokuapp.com/"

  @bob_has_a_service
  Scenario: Bob removes a service
    When I visit "/"
    Then I expect to see "https://parser4.herokuapp.com/"
    When I click the link "remove"
    Then I expect to see "Service Removed"
    Then I cannot see "https://parser4.herokuapp.com/"
