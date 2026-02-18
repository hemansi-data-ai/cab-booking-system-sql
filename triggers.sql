
# After inserting review → Update driver rating
DELIMITER //
CREATE TRIGGER after_review_insert
AFTER INSERT ON reviews
FOR EACH ROW
BEGIN
    UPDATE drivers d
    JOIN rides r ON d.driver_id = r.driver_id
    SET d.rating = (
        SELECT ROUND(AVG(r2.rating), 2)
        FROM reviews r2
        JOIN rides rd ON r2.ride_id = rd.ride_id
        WHERE rd.driver_id = d.driver_id
    )
    WHERE r.ride_id = NEW.ride_id;

END //
DELIMITER ;


# Before inserting ride → Prevent negative fare
DELIMITER //
CREATE TRIGGER before_ride_insert
BEFORE INSERT ON rides
FOR EACH ROW
BEGIN
    IF NEW.fare_amount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fare amount cannot be negative';
    END IF;

END //
DELIMITER ;



# After ride completion → Update driver status to Available
DELIMITER //
CREATE TRIGGER after_ride_update
AFTER UPDATE ON rides
FOR EACH ROW
BEGIN

    IF NEW.ride_status = 'Completed' THEN
        UPDATE drivers
        SET d_status = 'Available'
        WHERE driver_id = NEW.driver_id;
    END IF;

END //
DELIMITER ;


# Before deleting user → Prevent deletion if rides exist
DELIMITER //
CREATE TRIGGER before_user_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM rides 
        WHERE user_id = OLD.user_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete user with existing rides';
    END IF;

END //
DELIMITER ;


# After payment insert → Update ride status to Completed
DELIMITER //
CREATE TRIGGER after_payment_insert
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    UPDATE rides
    SET ride_status = 'Completed'
    WHERE ride_id = NEW.ride_id;

END //
DELIMITER ;
