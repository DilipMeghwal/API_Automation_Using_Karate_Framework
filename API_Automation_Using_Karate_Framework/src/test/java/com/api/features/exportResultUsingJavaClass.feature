@exportResultUsingJavaClass
Feature: This feature is used to validate exporting of result using java class.

  Background: 
    #There should be single space between * and next character. Signle space should be on both side of =
    * def globalFeature = call read('healthCheck.feature');
    * def exportFile = Java.type('com.api.features.ExportResults')
    * url 'https://reqres.in'

  Scenario Outline: Validate export of response using java class.
    Given path 'api/users'
    * def requestPayload = {"name":<name>, "job":<job>}
    And request requestPayload
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    And print 'Response ---->', response
    * def SC = response.name + "_" + response.job
    * def responseJson = response
    * def exportResult = exportFile.writeToCSVinTargetFolder("userRegistrationData",SC , requestPayload, responseJson)
    And print " Data exported sucessfully!!!!"
    * def result = new exportFile().dataSaveStatus()
		And print "To test of the non static function call --> ", result
    Examples: 
      | read('com/api/data/testData.csv') |
