Feature: Reward Points Redemption

Background:
  * url mockServerUrl

Scenario: Successful Points Redemption
  Given path '/redeem'
  And request { "userId": "123", "points": 100 }
  When method POST
  Then status 200
  And match response == { "message": "Points redeemed successfully" }

Scenario: Insufficient Points for Redemption
  Given path '/redeem'
  And request { "userId": "456", "points": 1000 }
  When method POST
  Then status 400
  And match response == { "error": "Insufficient points" }