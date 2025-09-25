# 🗂️ Task, Contact, and Appointment Management System

This is a full-stack Java project I built using Spring Boot for the backend and plain HTML/CSS/JavaScript for the frontend.  
It’s a simple, clean app to manage appointments, contacts, and tasks — all running in memory without a database.

The project includes a working REST API (tested with Postman and curl), a user-friendly UI to add and delete appointments, and full JUnit test coverage for all core services.

---

## 🔍 What It Does
- ✅ Add, delete, and list **appointments**, **contacts**, and **tasks**
- 📬 REST API (GET, POST, DELETE) — testable via browser, Postman, or curl
- 🧠 In-memory service layer with input validation and error handling
- 💻 Frontend made with plain HTML/CSS/JS using Fetch API
- 🧪 Unit tested with JUnit 5 for all services and models

---

## 🧰 Tech Stack
- Java 17+
- Spring Boot 3 (REST API)
- HTML5 + CSS + JavaScript (Fetch API)
- JUnit 5
- H2 (in-memory database)

---

## 📁 Project Structure
```
src/
├── main/
│   ├── java/com/samuel/appointments/apptaskmanager/
│   │   ├── controllers/
│   │   ├── services/
│   │   ├── models/
│   │   └── ApptaskmanagerApplication.java
│   └── resources/static/appointments-ui.html
└── test/
    └── java/com/samuel/appointments/apptaskmanager/
        └── (JUnit tests)
```

---

## 🚀 How to Run

### 1. Start the API
From IntelliJ or terminal:
```
./mvnw spring-boot:run
```
2. Open the Web Interface
Visit:
```
http://localhost:8080/appointments-ui.html
You can add or delete appointments directly from the browser.
```
3. Test the API via Postman or curl
Sample POST:
```
POST /appointments
Content-Type: application/json
{
  "appointmentID": "a01",
  "appointmentDate": "2025-04-30T10:00:00.000+00:00",
  "description": "Meeting with client"
}
```
Sample DELETE:
```
DELETE /appointments/a01
```
✅ Running Unit Tests
To run all tests:
```
./mvnw test
```
Tests cover:
-AppointmentService
-ContactService
-TaskService
