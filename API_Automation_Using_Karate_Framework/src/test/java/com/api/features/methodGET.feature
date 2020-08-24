Feature: This feature is to validate POST method.

  Background: 
    #There should be single space between * and next character. Signle space should be on both side of =
    * def validUser = read('com/api/data/validUser1.json');
    * url 'https://reqres.in'

  @JavaSciptFunctionsValidatingResponse @callGET
  Scenario: Validate sucessfull GET request.
    Given path '/api/users'
    Given param page = '2'
    And request validUser
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And print 'response -----> ', response
    And match response.data[*].id contains [9,10,11]
    And match response..id contains [9,10,11]
    And print "response.total --->", response.total
    And assert response.total > 10
    * def res = response.data
    * def resFun =
      """
      	function(args){
      		for(i=0; i<args.length; i++){
      			if(args[i].id==12){
      				return args[i]
      			}
      		}
      	}
      """
    #if ther is more than one parameter dont use call. sum(1,2)
    * def userDetails = call resFun res
    * def expectedOutput = read('com/api/data/JavaSciptFunctionsValidatingResponse.json')
    Then print 'userDetails ----> ' , userDetails
    Then match response == expectedOutput
