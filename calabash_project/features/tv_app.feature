Feature: Add to favourites

  Scenario: Selected show appears in the favourites list
    Given I am in the main screen
    And There is nothing in favourites
    When I add one show to favourites
    Then The show appears in favourites