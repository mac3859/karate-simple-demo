Feature: Mock Reward Service API

  Background:
    * def successResponse = { "success": true, "message": "Rewards redeemed successfully" }
    * def insufficientPointsResponse = { "success": false, "message": "Insufficient points to redeem rewards" }

  Scenario: pathMatches('/redeem') && methodIs('post')
    * def requestBody = request
    * def responseStatus = requestBody.points >= 500 ? 200 : 400
    * def response = requestBody.points >= 500 ? successResponse : insufficientPointsResponse