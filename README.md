# Reward Service Test Project

This project demonstrates API testing using the Karate framework to test a reward redemption service. It includes mock server implementation and test scenarios for reward redemption functionality.

## Project Overview

The project implements automated API tests for a reward redemption service with the following features:
- Reward points redemption
- Points validation
- Response handling for successful and failed scenarios

## Prerequisites

- Java 17
- Maven

## Project Structure

```
reward-service-test/
├── src/
│   └── test/
│       └── resources/
│           └── reward/
│               ├── features/
│               │   └── redeem-reward.feature    # Test scenarios
│               └── mock/
│                   └── RewardMockServer.feature # Mock server implementation
└── pom.xml
```

## Mock Server Implementation

The mock server is implemented in `RewardMockServer.feature` and provides:
- Endpoint: `/redeem` (POST)
- Response based on points threshold (500 points)
- Success/failure response handling

### Response Format

Success Response (Points >= 500):
```json
{
    "success": true,
    "message": "Rewards redeemed successfully"
}
```

Failure Response (Points < 500):
```json
{
    "success": false,
    "message": "Insufficient points to redeem rewards"
}
```

## Test Scenarios

The test scenarios are defined in `redeem-reward.feature`:

1. Successful Reward Redemption
   - Points >= 500
   - Expects 200 status code
   - Validates success response

2. Insufficient Points Scenario
   - Points < 500
   - Expects 400 status code
   - Validates error response

## Running the Tests

To run the tests, use the following Maven command:

```bash
mvn test
```

Test reports will be generated in the `target/karate-reports` directory.

## Configuration

The mock server runs on `http://localhost:58987` by default. This configuration is defined in the test features.

## Test Reports

Karate generates detailed HTML reports after test execution, including:
- Request/response details
- Test execution time
- Test status (passed/failed)
- Error messages for failed tests