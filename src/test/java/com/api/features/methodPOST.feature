Feature: This feature is to validate POST method.

  Background: 
    #There should be single space between * and next character. Signle space should be on both side of =
    * def validUser = read('com/api/data/validUser1.json');
    * url 'https://reqres.in'

  @OperationPOST
  Scenario: Validate sucessfull POST request.
    Given path '/api/users'
    And request validUser
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    Then print 'response -----> ', response
    Then match response.name == validUser.name
    Then match response.job == validUser.job
    Then match response.name contains validUser.name
    Then print "response.status --->", response.status
    Then print "response.createdAt --->", response.createdAt
