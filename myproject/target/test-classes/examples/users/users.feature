Feature: APIs users
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://gorest.co.in/public/v2'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer 700d0c7a86eb84028bf5cd204b11587f812f9d7cd880dc4edbdbd1d407ae9954'
    * def req_headers = {Authorization: 'Bearer 700d0c7a86eb84028bf5cd204b11587f812f9d7cd880dc4edbdbd1d407ae9954'}
    * def dataGenerator = Java.type('Utils.DataGenerator')
    * def newUser =
        """
            {
                "gender":"male", 
                "status":"active"
            }
        """    
    * newUser.name = dataGenerator.getUserRandom().name
    * newUser.email = dataGenerator.getUserRandom().email 
  
  @Users
  Scenario: List users
    Given path 'users'
    When method get
    Then status 200

    And match response == '#[]'
    And match response[0].id == '#number'
    And match response[0].name == '#string'
    And match response[0].email == '#string'
    And match response[0].gender == '#string'
    And match response[0].status == '#string'

  @Users
  Scenario: Get user #n
    Given path 'users'
    And request newUser
    When method post
    Then status 201
    * def userID = response.id
    
    #Se pone And headers req_headers cuando hay 2 peticiones
    #Como en este Scenario 
    Given path 'users' , userID
    And headers req_headers
    When method get
    Then status 200
    And match response.email == newUser.email
  
  @Users
  Scenario: Create user
    Given path 'users'
    And request newUser
    When method post
    Then status 201

    And match response.name == newUser.name
    And match response.email == newUser.email
    And match response.gender == newUser.gender
    And match response.status == newUser.status

  @Users
  Scenario: Update user
    Given path 'users'
    And request newUser
    When method post
    Then status 201

    * def userID = response.id

    * def updatedName = dataGenerator.getUserRandom().name

    Given path 'users', userID
    And headers req_headers
    And request
    """
      {
        "name": '#(updatedName)'
      }
    """
    When method put
    Then status 200
    And match response.id == userID
    And match response.name == updatedName

  @Users
  Scenario: Delete user
    Given path 'users'
    And request newUser
    When method post
    Then status 201

    * def userID = response.id

    Given path 'users', userID
    And headers req_headers
    When method delete
    Then status 204

