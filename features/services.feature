@bob_signed_in @service_exists

Feature: Bob can manage his services

  Scenario: Can add a service
    When I visit "/"
    And I select "Passive voice detector" from "#services"
    And I click '.save_services'
    Then I expect to see "Services Added"
    Then I expect to see "https://parser4.herokuapp.com/"
