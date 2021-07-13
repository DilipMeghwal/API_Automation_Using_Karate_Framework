Feature: This feature is to validate POST method.

  Background: 
    #There should be single space between * and next character. Signle space should be on both side of =
    * def validUser = read('com/api/data/validUser1.json');

  @configFileAuthTokenTest
  Scenario: Validate sucessfull implementation of callOnce function in karate-config.json file.
    Given url baseUrl
    And path '/api/users'
    And param page = '2'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And print 'response -----> ', response
    And print 'response auth -->',auth
    And print 'accesstoken -->',authInfo.response.token
    And match auth.response.token == authInfo.response.token
