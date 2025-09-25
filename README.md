# Task, Contact, and Appointment Management System

A **full-stack Java project** built with **Spring Boot** for the backend and **plain HTML/CSS/JavaScript** for the frontend.  
It's a lightweight app to manage **appointments, contacts, and tasks** — all running with an in-memory service layer (no database setup required).

## Features

- ➕ Add, delete, and list **appointments**, **contacts**, and **tasks**  
- 🌐 REST API (GET, POST, DELETE) accessible via browser, Postman, or curl  
- 🧠 In-memory service layer with validation and error handling  
- 💻 Frontend with **HTML/CSS/JS (Fetch API)**  
- 🧪 Unit tested with **JUnit 5**

## Tech Stack

- **Java 17+**  
- **Spring Boot 3** (REST API)  
- **HTML5 + CSS + JavaScript** (UI, Fetch API)  
- **JUnit 5**  
- **H2 in-memory database** (optional)

## Project Structure

```
src/
├── main/
│   ├── java/com/samuel/appointments/apptaskmanager/
│   │   ├── controllers/                    # REST controllers (Appointments, Contacts, Tasks)
│   │   ├── services/                       # Business logic services
│   │   ├── models/                         # Data models
│   │   └── ApptaskmanagerApplication.java  # Spring Boot entry point
│   └── resources/static/appointments-ui.html # UI served by Spring Boot
└── test/
    └── java/com/samuel/appointments/apptaskmanager/
        └── (JUnit tests for services and models)
```

## How to Run

### 1. Clone and enter project
```bash
git clone https://github.com/Samuelr2112/Task-and-Appointment-Management-System-with-Java.git
cd Task-and-Appointment-Management-System-with-Java
```

### 2. Start the Spring Boot server
With Maven:
```bash
mvn spring-boot:run
```

Or with Maven wrapper:
```bash
./mvnw spring-boot:run
```

### 3. Open the Web UI
Once the server is running, open in your browser:
```
http://localhost:8080/appointments-ui.html
```

From here you can add or delete appointments directly with the frontend.

## API Endpoints

### Get all appointments
```bash
GET http://localhost:8080/appointments
```

### Add appointment
```bash
POST http://localhost:8080/appointments
Content-Type: application/json

{
  "appointmentID": "a01",
  "appointmentDate": "2025-04-30T10:00:00.000+00:00",
  "description": "Meeting with client"
}
```

### Delete appointment
```bash
DELETE http://localhost:8080/appointments/a01
```

## Run Unit Tests

```bash
mvn test
```

Tests cover:
- AppointmentService
- ContactService  
- TaskService

## Features Included

✅ REST API (tested with Postman and curl)  
✅ UI to add/delete appointments (served directly by Spring Boot)  
✅ Full JUnit 5 test coverage for services and models  

## Preview

A simple, clean UI built with HTML, CSS, and JavaScript for managing appointments with a professional interface.

---

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).
