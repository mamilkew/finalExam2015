Feature: Normal user
  To creates a maintenance request.
  As a user, I want to create a maintenance request
#  Be sure to include seeing an empty list of maintenance requests and the result of the action
#  (seeing an open maintenance request in the list of maintenance requests)

  Scenario: Add a maintenance request.
    A normal user should be able to add a maintenance request.
    Given I am a normal user
    And I want to add a new maintenance request
    And I am signed in
    When I visit the maintenance page
    Then I should see a empty list of maintenance requests
    And I should see a link of created request
    When I click the link for creating the maintenance requests
    Then I should see a form to add a requests
    When I submit the form
    Then I should see the result of the action
    When I click the link for the maintenance requests
    Then I should see the details of my maintenance requests