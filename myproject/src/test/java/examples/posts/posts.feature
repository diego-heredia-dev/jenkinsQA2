Feature: APIs posts

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

  @Posts
  Scenario: List posts
    Given path 'posts'
    When method get
    Then status 200
    And match response == '#[]'

  @Posts
  Scenario: Post authored by a user
    Given path 'posts'
    When method get
    Then status 200
    And match response == "#[]"

  @Posts
  Scenario: Create a post for a user
    Given path 'users'
    And request newUser
    When method post
    Then status 201

    * def userID = response.id

    * def title = dataGenerator.getRandomTitle()
    * def body = dataGenerator.getRandomBody()

    Given path 'users', userID, 'posts'
    And headers req_headers
    And request
    """
    {
        "user_id": "#(userID)",
        "title": "#(title)",
        "body": "#(body)"
    }  
    """ 
    When method post
    Then status 201

    And match response.user_id == userID
    And match response.title == title
    And match response.body == body
    
  