Feature: This feature is to validate read data from CSV and call POST method..

  Background: 
    #There should be single space between * and next character. Signle space should be on both side of =
    * def validUser = read('com/api/data/validUser1.json');
    * url 'https://reqres.in'

  @DataFromCSV
    Scenario Outline: Validate read data from CSV and call POST method.
    	Given path 'api/users'
    	And request {"name":<name>, "job":<job>}
    	And header Content-Type = 'application/json'
    	When method POST
    	Then status 201
    	And print 'Response ---->', response
    Examples:
    |read('com/api/data/testData.csv')|
