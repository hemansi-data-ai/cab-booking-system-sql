# Get ride history by user_id
DELIMITER //
CREATE PROCEDURE GetUserRideHistory(IN uid INT)
BEGIN
   SELECT * 
   FROM rides
   WHERE user_id = uid;
END //
DELIMITER ;


# Get total revenue by driver_id
DELIMITER //
CREATE PROCEDURE GetTotalRevenue(IN d_id INT)
BEGIN 
	SELECT SUM(fare_amount) as revenue FROM rides WHERE driver_id = d_id;
END //
DELIMITER ;


# Get driver performance summary
DELIMITER //
CREATE PROCEDURE DriverPerformance()
BEGIN

    SELECT 
        d.driver_id,
        d.full_name,

        COUNT(r.ride_id) AS total_rides,

        SUM(CASE 
                WHEN r.ride_status = 'Completed' THEN 1 
                ELSE 0 
            END) AS completed_rides,

        SUM(CASE 
                WHEN r.ride_status = 'Cancelled' THEN 1 
                ELSE 0 
            END) AS cancelled_rides,

        SUM(CASE 
                WHEN r.ride_status = 'Completed' 
                THEN r.fare_amount 
                ELSE 0 
            END) AS total_revenue

    FROM drivers d
    LEFT JOIN rides r 
        ON d.driver_id = r.driver_id

    GROUP BY d.driver_id, d.full_name;

END //
DELIMITER ;

# Get rides between two dates
DELIMITER $$
CREATE PROCEDURE GetRidesBetweenDates(IN start_date DATE, end_date DATE)
BEGIN
	SELECT * FROM rides WHERE ride_date BETWEEN start_date AND end_date;
END $$
DELIMITER ;

# Get monthly revenue report
DELIMITER //
CREATE PROCEDURE MonthlyRevenueReport()
BEGIN
    SELECT 
        DATE_FORMAT(ride_date, '%Y-%m') AS month,
        SUM(fare_amount) AS total_revenue
    FROM rides
    WHERE ride_status = 'Completed'
    GROUP BY DATE_FORMAT(ride_date, '%Y-%m')
    ORDER BY month;
END //
DELIMITER ;
