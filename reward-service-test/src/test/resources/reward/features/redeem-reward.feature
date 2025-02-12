Feature: Test Reward Redemption

  Background:
    * url 'http://localhost:58987'

  Scenario: Redeem Rewards Successfully
    Given path '/redeem'
    And request { userId: 'user123', points: 500 }
    When method post
    Then status 200
    And match response == { success: true, message: 'Rewards redeemed successfully' }

  Scenario: Redeem Rewards with Insufficient Points
    Given path '/redeem'
    And request { userId: 'user123', points: 100 }
    When method post
    Then status 400
    And match response == { success: false, message: 'Insufficient points to redeem rewards' }