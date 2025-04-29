# ATLAS Platform

## Overview
The ATLAS platform is a hybrid social media and marketplace application designed to integrate decentralized features. This project transitions from a FlutterFlow/Firebase prototype to a scalable microservice architecture utilizing React/TypeScript for the frontend, Supabase for data management, and Node.js/NestJS for backend services.

## Project Structure
The project is organized into several key directories:

- **apps/**: Contains the frontend and API gateway applications.
  - **atlas_mobile_app/**: The mobile application built with React and TypeScript.
  - **api_gateway/**: The API gateway that routes requests to various microservices.

- **services/**: Contains individual microservices that handle specific business logic.
  - **user_service/**: Manages user-related operations.
  - **content_service/**: Handles content submissions and metadata.
  - **order_service/**: Manages order processing and transactions.
  - **wallet_service/**: Manages user wallets and transactions.
  - **social_service/**: Handles social interactions and connections.
  - **governance_service/**: Manages governance proposals and voting.
  - **reward_service/**: Calculates and distributes rewards.
  - **search_service/**: Provides search functionality for content.
  - **notification_service/**: Manages user notifications.
  - **analytics_service/**: Collects and analyzes platform data.

- **shared/**: Contains shared utilities, types, and constants used across the project.

## Getting Started

### Prerequisites
- Node.js (version 14 or higher)
- Docker and Docker Compose
- A Supabase account for database management
- Auth0 account for authentication

### Installation
1. Clone the repository:
   ```
   git clone <repository-url>
   cd atlas-platform
   ```

2. Install dependencies for the entire project:
   ```
   npm install
   ```

3. Set up the Supabase project:
   - Create a new Supabase project.
   - Configure the database schema as outlined in the project documentation.

4. Set up Auth0:
   - Create a new Auth0 application.
   - Configure the necessary authentication settings.

### Running the Application
To run the application locally, use Docker Compose:
```
docker-compose up
```

This command will start all services defined in the `docker-compose.yml` file.

### Development
- For frontend development, navigate to `apps/atlas_mobile_app` and run:
  ```
  npm run dev
  ```

- For backend service development, navigate to the respective service directory (e.g., `services/user_service`) and run:
  ```
  npm run start:dev
  ```

### Testing
- Each service should have its own testing framework set up. Run tests using:
  ```
  npm test
  ```

### Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

### License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Future Enhancements
- Integration of blockchain components for decentralized features.
- Implementation of advanced analytics and reporting tools.
- Continuous optimization for performance and scalability.

For more detailed documentation on each service and component, please refer to the respective directories and files within the project.