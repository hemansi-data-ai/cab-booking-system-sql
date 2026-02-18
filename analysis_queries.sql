USE cab_booking_sys;

SELECT * FROM users;

SELECT *  FROM rides WHERE ride_status = "Ongoing";

SELECT * FROM drivers WHERE d_status = "Available";

SELECT * FROM rides WHERE fare_amount > 3000;

# Join 
SELECT r.ride_id, u.full_name, d.full_name, r.fare_amount 
FROM rides r 
JOIN users u ON r.user_id = u.user_id
JOIN drivers d ON r.driver_id = d.driver_id;

# Show ride details with user name and driver name
SELECT ride_id, d.full_name as driver_name, u.full_name as user_name, pickup_location, drop_location, ride_date, ride_time, distance_km, fare_amount, ride_status 
FROM rides r
JOIN drivers d ON r.driver_id = d.driver_id 
JOIN users u on r.user_id = u.user_id;

# Show vehicle details for each driver
SELECT d.*, v.vehicle_number, v.vehicle_type, v.model 
FROM drivers d  
LEFT JOIN vehicles v ON d.driver_id = v.driver_id; 

# Show payment method used for each ride
SELECT r.* , p.payment_method
FROM rides r 
JOIN payments p 
ON r.ride_id = p.ride_id;

# Show user name, driver name, and fare amount together
SELECT u.full_name AS user_name, d.full_name AS driver_name, r.fare_amount
FROM rides r 
JOIN drivers d ON r.driver_id = d.driver_id 
JOIN users u ON r.user_id = u.user_id;

# Show rides along with payment status
SELECT r.ride_id, pickup_location, drop_location, ride_date, ride_time, distance_km, fare_amount, ride_status, payment_status 
FROM payments p 
JOIN rides r ON p.ride_id = r.ride_id;

# Total revenue per driver
SELECT driver_id, SUM(fare_amount) AS revenue
FROM rides 
WHERE ride_status = "Completed" 
GROUP BY driver_id;

# Total rides per driver
SELECT driver_id AS id, COUNT(*) AS total_rides 
FROM rides 
GROUP BY id;

# Total rides per user
SELECT user_id AS id, COUNT(*) AS total_rides 
FROM rides 
GROUP BY id;

# Average fare per ride
SELECT driver_id, ROUND(AVG(fare_amount), 2) AS average_fare
FROM rides 
GROUP BY driver_id;

SELECT driver_id, ROUND(SUM(fare_amount), 2) AS total_fare
FROM rides 
GROUP BY driver_id
ORDER BY total_fare;

# Cancellation count
SELECT count(*) AS Cancelled FROM rides WHERE ride_status = "Cancelled";

# Average driver rating
SELECT ROUND(AVG(rating), 2) as avg_rating FROM drivers;

# Top Earning Driver
SELECT driver_id, SUM(fare_amount) AS revenue
FROM rides 
GROUP BY driver_id 
ORDER BY revenue DESC
LIMIT 1;

# **************** OR ***********************
SELECT driver_id, SUM(fare_amount) AS revenue
FROM rides
GROUP BY driver_id
HAVING revenue = (
   SELECT MAX(total)
   FROM (
      SELECT SUM(fare_amount) AS total
      FROM rides
      GROUP BY driver_id
   ) AS temp
);

# Case 
SELECT ride_id, pickup_location, drop_location, distance_km, 
CASE WHEN fare_amount > 5000 THEN "Premium"
	 WHEN fare_amount BETWEEN 2000 AND 5000 THEN "Standard"
	 ELSE "Budget"
	 END as fare_category
from rides;

SELECT *, 
CASE 
	WHEN rating > 4.5 THEN "Excellent"
    WHEN rating BETWEEN 4 AND 4.5 THEN "Good"
    ELSE "Average"
END AS rating_category 
FROM drivers;

# Find driver who earned maximum revenue
SELECT  r.driver_id, full_name, phone_number, license_number, experience_years, rating, d_status, SUM(r.fare_amount) total_fare 
FROM rides r
JOIN drivers d ON r.driver_id = d.driver_id
GROUP BY r.driver_id
ORDER BY total_fare DESC 
LIMIT 1;

# Find users whose total spending is above average
SELECT u.user_id, u.full_name, SUM(r.fare_amount) AS total_spent
FROM users u
JOIN rides r ON u.user_id = r.user_id
WHERE r.ride_status = "Completed"
GROUP BY u.user_id, u.full_name
HAVING SUM(r.fare_amount) > (
        SELECT AVG(user_total)
        FROM (
            SELECT SUM(fare_amount) AS user_total
            FROM rides
            WHERE ride_status = "Completed"
            GROUP BY user_id
        ) AS avg_table
);

# Find drivers who completed more rides than average
SELECT d.driver_id, d.full_name, COUNT(r.ride_id) AS completed_rides
FROM drivers d
JOIN rides r ON d.driver_id = r.driver_id
WHERE r.ride_status = "Completed"
GROUP BY d.driver_id, d.full_name
HAVING COUNT(r.ride_id) > (
        SELECT AVG(driver_ride_count)
        FROM (
            SELECT COUNT(*) AS driver_ride_count
            FROM rides
            WHERE ride_status = "Completed"
            GROUP BY driver_id
        ) AS avg_table
);

# Window Function	
SELECT driver_id,
SUM(fare_amount) OVER(PARTITION BY driver_id) AS driver_total
FROM rides;

