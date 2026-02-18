🚖 Cab Booking System – SQL Database Project
📌 Project Overview

This project is a relational database system designed for a Cab Booking Platform.
It manages users, drivers, vehicles, rides, payments, and reviews while ensuring data integrity and business rule enforcement using SQL.

The system is built using MySQL and demonstrates advanced database concepts including joins, subqueries, stored procedures, and triggers.

🛠 Technologies Used

MySQL Workbench

🗂 Database Structure

The database consists of the following main tables:

Users – Stores customer details

Drivers – Stores driver information and ratings

Vehicles – Vehicle details assigned to drivers

Rides – Core transactional table for ride bookings

Payments – Payment information for rides

Reviews – Customer feedback and ratings

The database follows normalization principles (3NF) and includes:

Primary Keys

Foreign Keys

UNIQUE Constraints

NOT NULL Constraints

ENUM and DECIMAL data types

📊 Analytical Queries Implemented

The project includes business insight queries such as:

Total revenue generated

Revenue per driver

Monthly revenue report

Most active users

Top earning drivers

Cancellation percentage

Drivers completing above-average rides

Users spending above average

Second highest fare

Revenue ranking using window functions

Advanced SQL features used:

JOIN operations

GROUP BY

Aggregate functions (SUM, COUNT, AVG)

Subqueries

CASE statements

Window functions

⚙ Stored Procedures

The project includes reusable stored procedures such as:

Driver Performance Summary

Rides Between Two Dates

Monthly Revenue Report

Revenue by Driver

These procedures encapsulate business logic within the database for better reusability and maintainability.

🔁 Triggers Implemented

To enforce business rules and automate logic:

Automatically update driver rating after new review

Prevent negative fare insertion

Automatically update driver status after ride completion

Prevent deletion of users with existing rides

Automatically mark ride as completed after payment

These triggers ensure data integrity and backend automation.

🎯 Key Learning Outcomes

Through this project, I gained hands-on experience in:

Designing relational database systems

Implementing normalization

Writing complex SQL queries

Using subqueries and window functions

Creating stored procedures

Implementing triggers for automation

Applying real-world business logic in SQL

👩‍💻 Author

Hemansi
Data Analytics & AI/ML Learner
GitHub: https://github.com/hemansi-data-ai
