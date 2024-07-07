# GiroDashboard Backend

This repository contains the backend part of the Turnover Management Application, developed using ASP.NET, Entity Framework, and C#. The backend exposes RESTful APIs to interact with the frontend, following the Onion Architecture for maintainability and scalability.

## Table of Contents

- [Technologies Used](#technologies-used)
- [Architecture](#architecture)
  - [Core Layer](#core-layer)
  - [Application Layer](#application-layer)
  - [Infrastructure Layer](#infrastructure-layer)
  - [API Layer](#api-layer)

## Technologies Used

- **ASP.NET Core**
- **Entity Framework Core**
- **C#**
- **REST API**
- **SQL Server**

## Architecture

The application follows the Onion Architecture pattern, which ensures a clear separation of concerns and increases the maintainability and scalability of the codebase.

### Core Layer

This layer contains the core entities and repository interfaces.

- **Entities:** These are the POCO classes representing the data structure. Example:

Interfaces: These define the contracts for the repositories.

### Application Layer
This layer contains the business logic and service interfaces.

Services: These implement the business logic.

DTOs: Data Transfer Objects are used to transfer data between layers.

### Infrastructure Layer
This layer contains the implementation of repository interfaces and handles data access.
Repositories: These implement the data access logic using Entity Framework.

DbContext: This is the Entity Framework DbContext.

### API Layer
This layer exposes the endpoints for the frontend to interact with.

Controllers: These handle the HTTP requests and return the responses.
