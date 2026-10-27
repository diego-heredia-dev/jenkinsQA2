Feature: APIs comments

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


    @Comments
    Scenario: Comments on a post
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

        * def postID = response.id

        Given path 'posts', postID, 'comments'
        And headers req_headers
        When method get
        Then status 200
        
        And match response == "#[]"

    @Comments
    Scenario: Add a comment to a post
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

        * def postID = response.id 

        * def body = dataGenerator.getRandomBody()

        Given path 'posts', postID, 'comments'
        And headers req_headers
        And request
        """
        {
            "name": "#(newUser.name)",
            "email": "#(newUser.email)",
            "body": "#(body)"
        }
        """
        When method post
        Then status 201

        And match response.name == newUser.name
        And match response.email == newUser.email
        And match response.body == body