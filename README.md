# Guirre Noticiero - Backend

Welcome to the **Guirre Noticiero** backend! This repository houses the server-side code for our full-stack digital newspaper application, built using Node.js and Express. The backend manages content, user authentication, and data interactions, connecting seamlessly with the frontend to deliver a dynamic user experience.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup & Installation](#setup--installation)
- [Warning: Database Setup](#warning-database-setup)
- [Usage](#usage)
- [Contributing](#contributing)
- [Future Improvements](#future-improvements)
- [Acknowledgements](#acknowledgements)
- [License](#license)

---

## Project Overview
**Guirre Noticiero** provides a comprehensive backend system to power a digital newspaper application. It includes secure user authentication, efficient content management, and structured data handling using MySQL. 

The backend API supports:
- **Readers**: Access and filter articles.
- **Editorial Staff**: Manage articles, assign roles, and facilitate communication.

---

## Features
- **User Management**: Role-based access control for writers, editors, and readers, with secure authentication.
- **Article Management**: CRUD operations for articles, managing categories and subcategories, and handling images.
- **Newsletter Subscriptions**: Automated email notifications via Nodemailer.
- **Data Security**: JWT-based authentication and data encryption using Bcrypt.js.

---

## Technologies Used
- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: MySQL
- **Authentication**: JSON Web Tokens (JWT), Bcrypt.js for password hashing
- **Email Service**: Nodemailer
- **Environment Variables**: Managed with Dotenv
- **Other Libraries**: Cors, MySQL2

---

## Setup & Installation
Follow these steps to set up and run the backend locally:

### Prerequisites
- Node.js and npm installed on your system.
- **MySQL Database**: You must have a MySQL database set up and running on your local machine or server.

---

## ⚠️ WARNING: Database Setup
> **IMPORTANT:** This backend application requires a MySQL database to function correctly. Before running the server, ensure you have a MySQL database configured with the appropriate tables and relationships.

### Database Configuration
- **Download MySQL**: If you don’t have MySQL installed, you can download it from [MySQL Community Downloads](https://dev.mysql.com/downloads/).
- **Database Schema**: The database schema, including table structures and relationships, can be found in the `db_schema.sql` file in this repository. Make sure to import this file into your MySQL instance.

---

### Installation Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/back_grupo3.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd back_grupo3
   ```
3. **Install dependencies**:
   ```bash
   npm install
   ```
4. **Create a `.env` file** in the project root and configure your environment variables:
   ```
   DB_HOST=your-database-host
   DB_USER=your-database-username
   DB_PASSWORD=your-database-password
   DB_NAME=your-database-name
   JWT_SECRET=your-jwt-secret
   EMAIL_SERVICE=your-email-service
   EMAIL_USER=your-email-username
   EMAIL_PASS=your-email-password
   ```
5. **Run the server**:
   ```bash
   npm start
   ```
6. The server will start on `http://localhost:3000`.

---

## Usage
- **API Endpoints**: Access various endpoints to manage users, articles, categories, and subscriptions.
- **Testing**: Use tools like Postman to test API requests and responses.

---

## Contributing
We welcome contributions to enhance **Guirre Noticiero**! To contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch-name`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch-name`).
5. Open a pull request with a detailed explanation of your changes.

---

## Future Improvements
- **Improved Headline Management**: Allow editors to select from published articles dynamically.
- **Enhanced Image Handling**: Integrate with free image APIs like Pixelbay or enable local image uploads.
- **Internal Communication**: Develop an integrated chat system for editorial staff.

---

## Acknowledgements
- **ID Bootcamps**: For the guidance and educational support.
- **Team Members**: Vanesa Martos, David Melián, Clàudia Turro, and Kiara Maldonado for their collaboration and hard work.
- **Mentors**: Special thanks to our mentors for their invaluable advice and support.

---

## License
This project is open-source and available under the MIT License. See the `LICENSE` file for more details.

---

Feel free to reach out with any questions or feedback. Thank you for exploring our project!
