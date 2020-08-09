Feature: This feature is to validate POST method.

  Background: 
    * def validUser = read('api/UserData/com/validUser1.json');
    * url 'https://reqres.in/api/users'


  @Sucess
  Scenario: Validate sucessfull POST request.
    Given request validUser
    And header Content-Type = 'application/json'
    When method post
    Then status 201
    Then print 'response -----> ', response
