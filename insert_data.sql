INSERT INTO users (user_id, full_name, email, phone_number, registration_date) VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', '2024-01-10 09:30:00'),
(2, 'Priya Patel', 'priya@gmail.com', '9123456780', '2024-02-05 11:00:00'),
(3, 'Amit Verma', 'amit@gmail.com', '9988776655', '2024-03-12 14:20:00'),
(4, 'Sneha Mehta', 'sneha@gmail.com', '9090909090', '2024-04-18 16:45:00'),
(5, 'Karan Singh', 'karan@gmail.com', '9812345678', '2024-05-22 08:10:00');

INSERT INTO drivers (driver_id, full_name, phone_number, license_number, experience_years, rating, d_status) VALUES
(1, 'Rakesh Kumar', '9001112233', 'DL12345', 5, 4.5, 'Available'),
(2, 'Suresh Yadav', '9011122233', 'DL67890', 3, 4.2, 'Busy'),
(3, 'Mahesh Gupta', '9021132233', 'DL54321', 7, 4.8, 'Available'),
(4, 'Anil Sharma', '9031142233', 'DL11223', 4, 4.3, 'Available'),
(5, 'Vijay Rao', '9041152233', 'DL99887', 6, 4.6, 'Busy');

INSERT INTO vehicles (vehicle_id, driver_id, vehicle_number, vehicle_type, model) VALUES
(1, 1, 'GJ01AB1234', 'Sedan', 'Honda City'),
(2, 2, 'MH02CD5678', 'SUV', 'Hyundai Creta'),
(3, 3, 'DL03EF4321', 'Mini', 'WagonR'),
(4, 4, 'RJ04GH8765', 'Sedan', 'Maruti Dzire'),
(5, 5, 'KA05IJ1122', 'SUV', 'Toyota Innova');

INSERT INTO rides (ride_id, user_id, driver_id, pickup_location, drop_location, ride_date, ride_time, distance_km, fare_amount, ride_status) VALUES
(1, 1, 1, 'Ahmedabad', 'Vadodara', '2024-06-01', '09:00:00', 110.50, 1500.00, 'Completed'),
(2, 2, 2, 'Mumbai', 'Pune', '2024-06-02', '10:30:00', 150.00, 2200.00, 'Completed'),
(3, 3, 3, 'Delhi', 'Noida', '2024-06-03', '14:00:00', 25.00, 400.00, 'Completed'),
(4, 4, 4, 'Jaipur', 'Ajmer', '2024-06-04', '16:15:00', 130.00, 1700.00, 'Completed'),
(5, 5, 5, 'Bangalore', 'Mysore', '2024-06-05', '08:45:00', 145.00, 2100.00, 'Completed'),
(6, 1, 2, 'Ahmedabad', 'Surat', '2024-06-06', '11:00:00', 260.00, 3500.00, 'Completed'),
(7, 2, 3, 'Mumbai', 'Nashik', '2024-06-07', '12:30:00', 170.00, 2400.00, 'Completed'),
(8, 3, 4, 'Delhi', 'Gurgaon', '2024-06-08', '15:45:00', 35.00, 600.00, 'Cancelled'),
(9, 4, 5, 'Jaipur', 'Udaipur', '2024-06-09', '09:20:00', 390.00, 5000.00, 'Completed'),
(10, 5, 1, 'Bangalore', 'Chennai', '2024-06-10', '07:30:00', 350.00, 4800.00, 'Completed'),
(11, 1, 3, 'Ahmedabad', 'Rajkot', '2024-06-11', '13:10:00', 215.00, 3000.00, 'Completed'),
(12, 2, 4, 'Mumbai', 'Goa', '2024-06-12', '06:40:00', 590.00, 7500.00, 'Completed'),
(13, 3, 5, 'Delhi', 'Chandigarh', '2024-06-13', '17:00:00', 245.00, 3200.00, 'Completed'),
(14, 4, 1, 'Jaipur', 'Delhi', '2024-06-14', '10:50:00', 280.00, 3700.00, 'Completed'),
(15, 5, 2, 'Bangalore', 'Hyderabad', '2024-06-15', '18:20:00', 570.00, 7200.00, 'Completed');

INSERT INTO payments (payment_id, ride_id, payment_method, payment_status, payment_date, amount) VALUES
(1, 1, 'UPI', 'Paid', '2024-06-01', 1500.00),
(2, 2, 'Card', 'Paid', '2024-06-02', 2200.00),
(3, 3, 'Cash', 'Paid', '2024-06-03', 400.00),
(4, 4, 'UPI', 'Paid', '2024-06-04', 1700.00),
(5, 5, 'Card', 'Paid', '2024-06-05', 2100.00),
(6, 6, 'UPI', 'Paid', '2024-06-06', 3500.00),
(7, 7, 'Cash', 'Paid', '2024-06-07', 2400.00),
(8, 9, 'Card', 'Paid', '2024-06-09', 5000.00),
(9, 10, 'UPI', 'Paid', '2024-06-10', 4800.00),
(10, 11, 'Card', 'Paid', '2024-06-11', 3000.00),
(11, 12, 'UPI', 'Paid', '2024-06-12', 7500.00),
(12, 13, 'Cash', 'Paid', '2024-06-13', 3200.00),
(13, 14, 'Card', 'Paid', '2024-06-14', 3700.00),
(14, 15, 'UPI', 'Paid', '2024-06-15', 7200.00);

INSERT INTO reviews (review_id, ride_id, rating, r_comment, review_date) VALUES
(1, 1, 4.5, 'Smooth ride and polite driver', '2024-06-01'),
(2, 2, 4.2, 'Good driving experience', '2024-06-02'),
(3, 3, 4.8, 'Very professional service', '2024-06-03'),
(4, 4, 4.3, 'Comfortable journey', '2024-06-04'),
(5, 5, 4.6, 'Clean vehicle and safe ride', '2024-06-05');






