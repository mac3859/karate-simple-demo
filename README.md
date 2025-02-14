[Jump to Test result](#test-results-screenshot)

# Reward Service Test Project

This project demonstrates API testing using the Karate framework to test a reward redemption service. It includes mock server implementation and test scenarios for reward redemption functionality.

## Project Overview

The project implements automated API tests for a reward redemption service with the following features:
- Reward points redemption
- Points validation
- Response handling for successful and failed scenarios
- Mock server implementation with Karate's built-in mock server

## Prerequisites

- Java 17
- Maven

## Project Structure

```
reward-service-test/
├── src/
│   └── test/
│       ├── java/
│       │   └── reward/
│       │       ├── RewardServiceTest.java     # Test runner
│       │       └── mock/
│       │           └── RewardMockServer.java  # Mock server configuration
│       └── resources/
│           └── reward/
│               ├── features/
│               │   └── redeem-reward.feature  # Test scenarios
│               └── mock/
│                   └── RewardMockServer.feature # Mock server implementation
└── pom.xml
```

## Mock Server Implementation

The mock server is implemented using Karate's built-in mock server functionality:

### Mock Server Configuration

The mock server is configured in `RewardMockServer.java`:
- Runs on port 58987
- Automatically starts before test execution
- Automatically stops after test completion
- Uses feature file-based mock responses

### Mock API Endpoints

The mock server (`RewardMockServer.feature`) provides:
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

## Test Implementation

### Test Runner

The test runner (`RewardServiceTest.java`) is implemented using JUnit 5 and Karate:
- Uses `@Karate.Test` annotation for test execution
- Configures mock server URL via system property
- Handles mock server lifecycle with `@BeforeAll` and `@AfterAll`

### Test Scenarios

The test scenarios are defined in `redeem-reward.feature`:

1. Successful Reward Redemption
   - Points >= 500
   - Expects 200 status code
   - Validates success response

2. Insufficient Points Scenario
   - Points < 500
   - Expects 400 status code
   - Validates error response

## CI/CD Configuration

This project includes CI/CD configurations for both GitHub Actions and Azure Pipelines.

### GitHub Actions

The workflow in `.github/workflows/test.yml` includes:
- Automated test execution on push and pull requests
- JDK 17 setup
- Maven dependency caching
- Test execution and report generation

### Azure Pipelines (Demo)

The `azure-pipelines.yml` demonstrates a test automation setup in Azure DevOps with the following features:
- Runs on Ubuntu latest agent
- Uses Maven caching for faster builds
- Configures JDK 17
- Executes tests and publishes results
- Generates and publishes Karate test reports

Note: This is a demo configuration and requires proper Azure DevOps setup with appropriate service connections to be functional.

## Running the Tests

To run the tests, use the following Maven command:

```bash
mvn test
```

Test reports will be generated in the `target/karate-reports` directory.

## Configuration

### Mock Server
- Host: localhost
- Port: 58987
- Base URL: http://localhost:58987

## Test Reports

Karate generates comprehensive HTML reports after test execution:
- Location: `target/karate-reports/`
- Includes detailed request/response information
- Test execution timeline
- Test scenario status and duration

### Test Results Screenshot

![Screenshot 2025-02-14 at 11 43 02 AM](https://github.com/user-attachments/assets/3371d3bf-4cb8-4a21-9fdf-3af688dbc2dc)


The screenshot above shows the actual test execution results from a sample test run.
