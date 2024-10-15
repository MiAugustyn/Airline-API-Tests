
Feature: Utility

    Background:
        Given url baseUrl

    @GetUserId
    Scenario: Get existing valid user ID
        Given path "/user"
        When method GET
        Then status 200
        Then match response == "#array"
        Then match each response == {id: "#number", email: "#string", name: "#string", surname: "#string"}
        * def ids = karate.jsonPath(response, "$..id")
        * def validId = ids[0]

    @GetHighestUserId
    Scenario: Get highest user ID
        * def getUsers = call read('UserGet.feature@GetAllUsers')
        * def maxNumber = 
        """
            function(x) { 
                var max = x[0];
                for (var i = 1; i < x.length; i++) { 
                    if (x[i] > max) { 
                        max = x[i]; 
                    } 
                }
                return max; 
            }
        """
        * def highestId = maxNumber(getUsers.uniqueIds)

    @GetUserEmail
    Scenario: Get existing user email
        Given path "/user"
        When method GET
        Then status 200
        Then match response == "#array"
        Then match each response == {id: "#number", email: "#string", name: "#string", surname: "#string"}
        * def userEmail = response[0].email
        

        