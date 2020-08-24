#@ignore
Feature: Demo Karate Tests

  Background: 

  @healthCheck
  Scenario: Verify that test server is up and running
    Given url baseUrl
    And path  '/api/'
    When method options
    Then status 204
    Then match header Access-Control-Allow-Methods == 'GET,HEAD,PUT,PATCH,POST,DELETE'
    * print responseHeaders
