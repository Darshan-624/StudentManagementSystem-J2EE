# Student Management System - J2EE

A web-based Student Management System developed using **Java, JSP, Servlets, JDBC, and MySQL**.  
The project demonstrates core **J2EE web development concepts**, database connectivity, session management, CRUD operations, and the DAO/DTO design pattern.

---

## 📌 Project Overview

The Student Management System is a Java web application designed to manage student information through a web interface.

The application allows users to register and log in, manage their profiles, view student information, and perform student management operations.

The project follows a layered architecture where:

- **JSP** handles the presentation layer.
- **Servlets** handle HTTP requests and application flow.
- **DAO** classes handle database operations.
- **DTO** classes represent student data.
- **JDBC** provides database connectivity.
- **MySQL** stores the application data.

---

## 🚀 Features

- User Registration / Signup
- User Login
- User Logout
- Session Management
- Dashboard
- View Profile
- Update Profile
- Delete Student
- View All Students
- Forgot Password
- CRUD Operations
- MySQL Database Integration
- JDBC Database Connectivity
- Request Forwarding using `RequestDispatcher`

---

## 🛠️ Technologies Used

### Backend
- Java
- Jakarta Servlets
- JSP
- JDBC
- J2EE / Jakarta EE

### Frontend
- HTML
- CSS
- JSP

### Database
- MySQL

### Server
- Apache Tomcat

### IDE & Tools
- Eclipse IDE
- Git
- GitHub

---

## 🏗️ Architecture

The application follows a layered MVC-style architecture.

```text
                    ┌───────────────────┐
                    │       JSP         │
                    │  Presentation     │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │     Servlet       │
                    │ Request Handling  │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │       DAO         │
                    │ Database Operations│
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │       JDBC        │
                    │ DB Connectivity   │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │      MySQL        │
                    │     Database      │
                    └───────────────────┘
