# MySQL_Capstone_project
Carbon Emission Calculator 
This project, building a "Carbon Emission Calculator" database, was a hands-on journey into relational database design and management using MySQL. Here are the key takeaways and skills I've gained:

# Database Design Principles:

Understood the importance of conceptual database design by defining entities (tables) and their attributes.
Learned to identify and establish relationships between tables (e.g., a User can have many Carbon_Emissions records), crucial for data integrity.
Applied principles of normalization to organize data efficiently and reduce redundancy.

-- Key components of table creation and relationships
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT, -- Primary Key, uniquely identifies each user
    -- ... other columns
);

CREATE TABLE Carbon_Emissions (
    emission_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL, -- Foreign Key, links to the User table
    -- ... other columns
    FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE -- Ensured referential integrity
);

# MySQL Fundamentals & DDL (Data Definition Language):

Mastered core commands for database creation and selection.
Proficiently used CREATE TABLE to define schemas, including choosing appropriate data types (INT, VARCHAR, DECIMAL, TEXT, DATETIME).
Applied essential column constraints like PRIMARY KEY, AUTO_INCREMENT, NOT NULL, and UNIQUE for data validation and efficiency.
-- Database and Table Creation
CREATE DATABASE carbon_emission_calculator;
USE carbon_emission_calculator;
CREATE TABLE Transportation (
    transportation_id INT PRIMARY KEY AUTO_INCREMENT,
    method VARCHAR(100) NOT NULL UNIQUE, -- Ensures unique methods
    carbon_per_unit DECIMAL(10, 4) NOT NULL
);

# DML (Data Manipulation Language) Basics:
Gained proficiency in inserting data into tables using INSERT INTO statements.
Practiced retrieving data using SELECT statements with various clauses.
-- Inserting Sample Data
INSERT INTO User (name, email, password) VALUES
('Alice Smith', 'alice.smith@example.com', 'hashed_pass_1');
-- Basic Data Retrieval
SELECT * FROM User;
SELECT food_item, carbon_per_serving FROM Food WHERE food_id = 3;

# Advanced SQL Querying Techniques:
Utilized aggregate functions (SUM(), AVG()) to perform calculations on data sets.
Applied GROUP BY clauses to summarize data based on specific criteria (e.g., total emissions per user).
Implemented JOIN operations (specifically INNER JOIN) to combine data from multiple related tables, enabling comprehensive reporting.
-- Total emissions per user using JOIN and GROUP BY
SELECT
    u.name,
    SUM(ce.calculated_emission) AS total_emissions_kg_co2
FROM
    User u
JOIN
    Carbon_Emissions ce ON u.user_id = ce.user_id
GROUP BY
    u.user_id, u.name;
    
Explored the power of subqueries for complex data retrieval, allowing for dynamic filtering and comparisons based on other query results.
Understood the importance of aliases (AS) for creating readable column headers in query results.
-- Find users with emissions above average using a subquery
SELECT
    u.name,
    SUM(ce.calculated_emission) AS user_total_emissions
FROM
    User u
JOIN
    Carbon_Emissions ce ON u.user_id = ce.user_id
GROUP BY
    u.user_id, u.name
HAVING
    SUM(ce.calculated_emission) > (SELECT AVG(calculated_emission) FROM Carbon_Emissions);
    
# Database Management & Best Practices:

Learned to use DROP DATABASE IF EXISTS for ensuring clean and repeatable setup in development environments.
Practiced updating (UPDATE) and deleting (DELETE) records, understanding the critical importance of the WHERE clause.
Developed a habit of verifying data after operations using SELECT statements.
