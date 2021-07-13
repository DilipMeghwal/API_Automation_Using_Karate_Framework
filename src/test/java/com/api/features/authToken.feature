@authorization
Feature: This feature is to generate auth token.

  @getToken
  Scenario: Title of your scenario
    Given url 'https://reqres.in'
    And path '/api/register'
    And request {"email": "eve.holt@reqres.in","password": "pistol"}
    When method post
    Then print ' Response --->', response 
