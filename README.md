# Turnover Management Application

This application is designed to manage and visualize turnover data, including product information, sales data, and stock information. It provides customers with insights into their branch and product details through intuitive data visualizations.

![Screenshot_20240707_174718](https://github.com/erdemaksoy/GiroDashboard/assets/79666268/8feeb332-4a97-400b-a683-9b1daa6e4818)

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Architecture](#architecture)

## Features

- **Product Information Management:** Store and manage customer product details.
- **Sales Information Management:** Track and manage sales data.
- **Stock Information Management:** Monitor and manage stock levels.
- **Data Visualization:** Display turnover information, customer branch, and product details through data visualization on the homepage.

## Technologies Used

### Frontend

- **Flutter**
- **Dart**
- **MVVM Architecture**

### Backend

- **ASP.NET WEB API**
- **Entity Framework**
- **Onion Architecture**
- **REST API**

## Architecture

The application uses a modern architecture to ensure maintainability, scalability, and testability.

### Frontend: MVVM (Model-View-ViewModel)

- **Model:** Manages the data and business logic.
- **View:** Handles the presentation layer and UI.
- **ViewModel:** Acts as a bridge between the View and the Model, managing the state and handling user input.

### Backend: Onion Architecture

- **Core:** Contains the domain entities and repository interfaces.
- **Application:** Contains the business logic and service interfaces.
- **Infrastructure:** Implements the repository interfaces and handles data access.
- **API:** Exposes the endpoints and handles HTTP requests.
