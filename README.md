# Real-Time Turnover & Multi-Branch Management System

POSBACK is an enterprise-grade, data-driven financial dashboard application designed for retail businesses and chain stores to monitor, manage, and analyze point-of-sale (POS) metrics in real time. The platform processes live transactional data directly from cash registers and cashiers, transforming raw financial metrics into actionable insights. 

It empowers business owners and branch managers to seamlessly track daily, monthly, and yearly revenue, manage stock levels, analyze refund rates, and handle cross-branch performance comparisons through a multi-tenant structure.

---

## 📱 Mobile Preview
<p align="center">
  <img src="https://github.com/erdemaksoy/GiroDashboard/assets/79666268/8feeb332-4a97-400b-a683-9b1daa6e4818" alt="POSBACK Mobile Dashboard" width="320"/>
</p>

> **Note:** Backend source files and infrastructure configurations are located securely within the `master` branch.

---

## 🚀 Key Features & Business Logic

### 📊 Real-Time Financial Analytics & Dashboard
- **Live POS Sync:** Processes incoming data from cash registers to display instantaneous metrics.
- **Key Performance Indicators (KPIs):** Calculates and visualizes crucial retail metrics:
  - **Müşteri Sayısı (Footfall Metrics):** Total customer traffic trends per branch.
  - **Sepet Ortalaması (Average Order Value - AOV):** Real-time calculation of revenue generated per transaction.
  - **İade Toplamı (Refund & Return Analytics):** Monitors financial loss and product return rates to pinpoint inventory or service issues.
  - **Periodic Revenue Tracking:** Dynamic aggregation of financial data into Daily, Monthly (`Aylık Toplam`), and Yearly (`Yıllık Toplam`) analytical graphs.

### 🏢 Multi-Branch & Chain Store Architecture
- **Hierarchical Data Filtering:** Built-in multi-tenant capabilities allowing enterprise clients (e.g., supermarket chains, retail brands) to filter dashboard metrics globally or drill down into specific, individual branch stores.
- **Role-Based Access Control:** Tailored analytics screens depending on user permissions (e.g., Regional Manager vs. Branch Cashier).

### 📦 Inventory & Sales Lifecycle Automation
- **Stock Level Monitoring:** Automated tracking of stock thresholds to prevent stockouts or over-stocking.
- **Automated Feedbacks:** Real-time feedback loops providing alerts and push-notifications on daily financial target completions or critical stock drops.

---

## 🛠️ Technical Stack & Architecture

The ecosystem is split into a scalable, decoupled architecture to ensure strict maintainability, robust security, and seamless testability.

### 🖥️ Backend Architecture: .NET Core with Onion Design Pattern
Built using **Onion Architecture** to enforce separation of concerns and dependency inversion principles, ensuring the core business domain remains completely independent of databases or external UI frameworks.

- **Domain & Core Layer:** Contains pure enterprise business objects, aggregate roots, domain entities, and core abstract repository contracts.
- **Application Layer:** Implements business use cases, command/query handlers, validation rules, and service interfaces.
- **Infrastructure & Data Access:** Powered by **Entity Framework Core**, executing highly optimized and indexed relational queries on **PostgreSQL / MySQL** to maintain low-latency read operations during massive transaction peaks.
- **API Presentation Layer:** A highly secure, stateless **RESTful Web API** utilizing **JWT (JSON Web Token) Authentication** to protect corporate transactional endpoints.

### 📱 Frontend Architecture: Flutter (Cross-Platform Mobile)
A highly responsive and clean UI layer designed to run natively on both iOS and Android platforms.

- **State Management & Pattern:** Developed strictly under the **MVVM (Model-View-ViewModel)** architectural pattern to separate the UI layer from the network data state.
- **Robust Networking:** Features centralized HTTP service clients handling token refreshing, interceptors, and data serialization from the .NET Core backend API.

---

## 📐 System Architecture Overview
```
┌────────────────────────────────────────────────────────┐
 │            Multi-Branch POS Terminal Systems           │
 │  (Raw Cash Register Data: Sales, Refunds, Footfall)   │
 └───────────────────────────┬────────────────────────────┘
                             │
                             │ (HTTPS / REST API Requests)
                             ▼
 ┌────────────────────────────────────────────────────────┐
 │                  ASP.NET Core Web API                  │ ◄─── [ JWT Auth Layer ]
 └───────────────────────────┬────────────────────────────┘
                             │
                             │
                             ▼
              =================================
               BACKEND: ONION ARCHITECTURE
              =================================
              │ [API Layer]                   │
              │   └── Controllers & DTOs      │
              │                               │
              │ [Infrastructure Layer]        │
              │   └── EF Core DbContext       │
              │                               │
              │ [Application Layer]           │
              │   └── Services & Interfaces   │
              │                               │
              │ [Core Domain Layer]           │
              │   └── Entities & Repositories │
              =================================
                             │
                             │ (Optimized SQL Queries)
                             ▼
 ┌────────────────────────────────────────────────────────┐
 │                PostgreSQL / MySQL DB                   │
 └───────────────────────────┬────────────────────────────┘
                             │
                             │ (JSON Data Serialization)
                             ▼
 ┌────────────────────────────────────────────────────────┐
 │             Flutter Cross-Platform Mobile              │
 │          (MVVM State Management Architecture)          │
 └────────────────────────────────────────────────────────┘
```
