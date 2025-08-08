# Airline API Tests

Author: Michał Augustyn

#### Requirements:
- Docker
- Java Development Kit (JDK) version 8+
- Apache Maven 3.11+

## Overview

Airline API Tests is a comprehensive suite of unit tests for validating the GET and POST endpoints of a third-party airline API. Covering bookings and users, this project enforces correct behavior across valid, invalid, edge-case, and error scenarios. \
<sub>Swagger API Interface:</sub>
<img width="1847" height="885" alt="image" src="https://github.com/user-attachments/assets/3445c3d8-c599-4446-9236-ccbea231fd31" />

### Booking GET Tests

- @GetAllBookingsCalls Sends requests to fetch all bookings using no parameters, only user ID, only date, and both user ID and date.

- @HandleNullRequests Sends requests with null user ID and/or date parameters.

- @InvalidGetAllBookingsCalls Sends requests with invalid parameter combinations: both parameters empty; user ID equal to 0 and booking date equal to a string value; user ID equal to a string value and booking date in an invalid format.

- @InvalidUserGetAllBookingsCalls Sends requests with a valid date and invalid user ID values: 0, string, and whitespace.

- @InvalidDateGetAllBookingsCalls Sends requests with a valid user ID and invalid date values: string, wrong format, whitespace, and numeric. \
<sub>API ignores invalid dates and filters only by user. Validation error should be returned instead.</sub>

- @GetBookingCall Sends a request to fetch a booking by a valid booking ID.

- @InvalidGetBookingCalls Sends requests with invalid booking ID values: 0, string, empty, and null.

### Booking POST Tests

- @CreateBooking Sends a request to create a booking with valid parameters.

- @CreateIdenticalBookings Sends two identical requests to create a booking.

- @InvalidParamsTest Sends requests with invalid parameters: null and empty values.

- @InvalidDateTest Sends requests with invalid date values: wrong format, strings, empty, and five-digit years.

- @InvalidDestinationTest Sends requests with invalid destination codes: too short, too long, numeric, non-Latin letters, and null.

- @InvalidOriginTestSend Sends requests with invalid origin codes: too short, too long, numeric, non-Latin letters, and null.

- @InvalidUserTest Sends requests with invalid user ID values: 0, non-existent ID, and string.

### User GET Tests

- @GetAllUsers Sends a request to fetch all users.

- @ValidUserIdCall Sends a request to fetch a users by a valid user ID.

- @InvalidUserIdCalls Sends requests with invalid user ID values: 0, whitespace, null, and string.

### User POST Tests

- @CreateUser Sends a request to create a user with valid parameters.

- @CreateInvalidUserCalls Sends requests with invalid email values: duplicate, empty, overly long, and non-Latin characters. \
<sub>API does not validate email format correctly.</sub>

### Utility Methods

@GetUserId Retrieves an existing user ID.

@GetHighestUserId Retrieves the highest user ID.

@GetUserEmail Retrieves a valid user email.

@RemoveEmptyParams Removes empty parameters from a request payload.

@GetValidBookingParams Gets valid booking request parameters.

These helpers accelerate test setup and keep test code DRY.

## Deployment
- Import the API image into Docker: `docker load -i api_testing_service_latest.tar.xz`
- Run the image in a container: `docker run -d -p 8900:8900 --name apiservice api_testing_service` \
<sub> Swagger available at http://127.0.0.1:8900/docs </sub>
- Navigate to the project’s root folder
- Run the tests: `mvn test`
