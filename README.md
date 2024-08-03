# E-commerce Project

## Overview
This project is an E-commerce application built using Java & Hibernate and Intellij IDEA. It provides functionalities for browsing products, adding them to the cart,purchasing them etc.

## Features
- User authentication and authorization
- Product catalog browsing
- Shopping cart management
- Order processing and checkout
- Admin dashboard for managing products and orders

## Technologies Used
- Java
- Intellij IDEA & MySQL Workbench
- Hibernate 
- MySQL (or other database)
- Servlet & JSP

## Setup and Installation

### Prerequisites
- Java Development Kit (JDK) 8 or higher (version 13 or 15 will be best)
- Intellij IDEA (or any other Java IDE)
- MySQL (or other database)
- Tomcat Server 10 

### Steps

1. **Clone the repository**
   ```sh
   git clone https://github.com/yashashvini15/E-commerce.git
   cd E-commerce
2. **Open the project in Intellij IDEA**

3. **Configure the database**

- Create a database named ecommerce in your MySQL (or other) database.

- Update the database connection settings in the application.properties (or application.yml) file.

- spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce

- spring.datasource.username=your_username

- spring.datasource.password=your_password

4. **Run the application**

-> Open Intellij IDEA and run the Application class to start the Spring Boot application (if applicable).

-> Alternatively, use the terminal to run the application.
./mvnw spring-boot:run

## Usage
-Access the application at http://localhost:8080 in your web browser.

-Register as a new user or log in with existing credentials.

-Browse products, add them to your cart, and proceed to checkout.

## Screenshots
Here are some screenshots of the application:

### Home Page

![image](https://github.com/user-attachments/assets/381e76ad-5fd2-4655-b7bf-8838438d066f)

### Register & Sign in Page
- Register page
![image](https://github.com/user-attachments/assets/229bd910-8012-4afc-99eb-a7e0f3a4b8a8)

- Sign In page
![image](https://github.com/user-attachments/assets/af0352a4-18db-49ba-8135-067d522494f7)

### Admin Page 
![image](https://github.com/user-attachments/assets/c44b44ae-5a6c-4cb4-9366-775db9f63792)

### Shopping Cart
- When the bag is empty.
![image](https://github.com/user-attachments/assets/d9ef3f4b-9c4e-48e1-a711-c86f187b31a0)

- When you have added any product 
![image](https://github.com/user-attachments/assets/2dc15fa3-3032-4712-9979-ee0cb251e5f8)

### Checkout Page
![image](https://github.com/user-attachments/assets/6fae200c-a651-4ba9-8e81-dfea2a20eff3)

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For any inquiries or feedback, please contact yashashwi.soni.work@gmail.com.
LinkedIn Profile - www.linkedin.com/in/yashashvini-soni

