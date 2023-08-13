# SolarX App Backend Documentation

Welcome to the SolarX App Backend Documentation. This guide provides an overview of the backend structure, API endpoints, and how to set up and run the backend server for the SolarX app.

## Table of Contents

- [Introduction](#introduction)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Configuration](#configuration)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The SolarX App backend is responsible for managing data, handling API requests, and providing the necessary functionalities to power the SolarX app. This documentation outlines how to set up, configure, and interact with the backend.

## Technologies Used

- Node.js
- Express.js
- MongoDB
- Mongoose
- AWS S3 bucket , EC2 Instance (for Image storage)

## Installation

1. Clone this repository: `git clone https://github.com/ashdude1401/SolarX.git`
2. Navigate to the project directory: `cd backend`
3. Install dependencies: `npm install`

## Configuration

1. Set up your MongoDB database and AWS S3 bucket for file storage.

## API Endpoints

### Users

- `GET /api/users/:id`: Retrieve user details by ID.
- `POST /api/users/signup`: Register a new user.
- `POST /api/users/login`: Log in a user.

### Solar Panels

- `GET /api/solarPanels`: Retrieve a list of solarPanels.
- `GET /api/solarPanels/:id`: Retrieve solar panel details by ID.
- `POST /api/solarPanels`: Add a new solar panel (requires authentication).
- `POST /api/solarPanels/:id/upload-image`: Upload an image for a solar panel (requires authentication).

Refer to the API documentation for detailed request/response information.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

Thank you for using the SolarX App backend. For more details, refer to the codebase and API documentation.

[Postman Workspace](https://www.postman.com/descent-module-cosmologist-42700976/workspace/solarx)
