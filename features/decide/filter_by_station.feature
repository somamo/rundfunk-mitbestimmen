@102
Feature: Filter by station
  As a user
  I want to filter suggestions by radio or TV station
  To get more relevant results if I have a favourite station

  Background:
    Given we have these broadcasts in our database:
      | Title           | Stations      | Medium |
      | heute-journal   | ZDF, Phoenix  | tv     |
      | Fernsehgarten   | ZDF           | tv     |
      | Quarks & Co     | WDR Fernsehen | tv     |
      | Leonardo        | WDR 5         | radio  |
      | Frei.Willig.Weg |               | online |
    And I visit the decision page
    And there are 5 remaining broadcasts

  Scenario: Filter for a station can yield just one result
    When I choose "Phoenix" from the list of TV stations
    Then the only broadcast I see is "heute-journal"

  Scenario: Filter for a station can yield many results
    When I choose "ZDF" from the list of TV stations
    Then there are 2 remaining broadcasts
    And the displayed broadcast is either "Fernsehgarten" or "heute-journal"

  Scenario: Choosing a medium will narrow down selectable stations
    When I filter for radio broadcasts
    Then the only station to choose from is "WDR 5"
    And the only broadcast I see is "Leonardo"

  Scenario: The medium 'online' has no stations
    When I filter for online broadcasts
    Then there are no stations to choose from
    And the only broadcast I see is "Frei.Willig.Weg"

