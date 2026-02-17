CREATE DATABASE cab_booking_sys;

USE cab_booking_sys;

CREATE TABLE IF NOT EXISTS Users
( 	user_id INT PRIMARY KEY,
	full_name VARCHAR(200),
	email VARCHAR(50) UNIQUE,
	phone_number VARCHAR(15),
	registration_date DATETIME
);

CREATE TABLE IF NOT EXISTS Drivers
( 	driver_id INT PRIMARY KEY,
	full_name VARCHAR(200),
	phone_number VARCHAR(15),
	license_number VARCHAR(20) UNIQUE,
	experience_years INT,
	rating DECIMAL(2,1),
    d_status ENUM("Available", "Busy")
);


CREATE TABLE IF NOT EXISTS Vehicles
(	vehicle_id INT PRIMARY KEY,
	driver_id INT,
    vehicle_number VARCHAR(20) UNIQUE,
    vehicle_type ENUM ("Mini", "Sedan", "SUV"),
    model VARCHAR(20),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

CREATE TABLE IF NOT EXISTS Rides
(	ride_id INT PRIMARY KEY,
	user_id INT,
    driver_id INT,
    pickup_location TEXT,
    drop_location TEXT,
    ride_date DATE,
    ride_time TIME,
    distance_km DECIMAL(6,2),
    fare_amount DECIMAL(10,2),
    ride_status ENUM("Completed", "Cancelled", "Ongoing"),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS Payments
( 	payment_id INT PRIMARY KEY,
	ride_id INT,
	payment_method ENUM ("Cash", "UPI", "Card"),
    payment_status ENUM ("Paid", "Pending"),
    payment_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY(ride_id) REFERENCES Rides(ride_id)
);

CREATE TABLE IF NOT EXISTS Reviews
( 	review_id INT PRIMARY KEY,
	ride_id INT,
    rating DECIMAL(2,1),
    r_comment TEXT,
    review_date DATE,
    FOREIGN KEY(ride_id) REFERENCES Rides(ride_id)
);
