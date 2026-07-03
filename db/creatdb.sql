CREATE DATABASE bookmyvenue;
USE bookmyvenue;

-- 1. Roles Table
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);

-- 2. Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    contact_number VARCHAR(15),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- 3. Venue Type Table
CREATE TABLE venue_type (
    venue_type_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_type_name VARCHAR(100) NOT NULL
);

-- 4. Venue Table
CREATE TABLE venue (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_type_id INT,
    user_id INT,
    venue_name VARCHAR(150) NOT NULL,
    address TEXT,
    capacity INT,
    price_per_day DECIMAL(10,2),
    availability_status BOOLEAN DEFAULT TRUE,
    city_id INT,
    FOREIGN KEY (venue_type_id) REFERENCES venue_type(venue_type_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 5. State Table
CREATE TABLE state (
    state_id INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(100) NOT NULL
);

-- 6. City Table
CREATE TABLE city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    state_id INT,
    city_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (state_id) REFERENCES state(state_id)
);

ALTER TABLE venue
ADD CONSTRAINT fk_venue_city
FOREIGN KEY (city_id) REFERENCES city(city_id);

-- 7. Venue Image Table
CREATE TABLE venue_image (
    venue_image_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_id INT,
    image_path VARCHAR(255),
    image_data LONGBLOB,
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

-- 8. Review Table
CREATE TABLE review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    venue_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

-- 9. Time Slot Table
CREATE TABLE time_slot (
    slot_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_id INT,
    start_time TIME,
    end_time TIME,
    slot_status BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

-- 10. Booking Table
CREATE TABLE booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    venue_id INT,
    booking_date DATE,
    booking_status BOOLEAN DEFAULT TRUE,
    slot_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id),
    FOREIGN KEY (slot_id) REFERENCES time_slot(slot_id)
);

-- 11. Spot Booking Table
CREATE TABLE spot_booking (
    spot_booking_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

-- 12. Payment Table
CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    total_amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

-- 13. Service Type Table
CREATE TABLE service_type (
    service_type_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(100),
    description VARCHAR(255),
    price DECIMAL(10,2)
);

-- 14. Service Provider Table
CREATE TABLE service_provider (
    provider_id INT PRIMARY KEY AUTO_INCREMENT,
    provider_name VARCHAR(100),
    user_id INT,
    gst_no VARCHAR(50),
    city VARCHAR(100),
    address VARCHAR(255),
    city_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- 15. Service Provider Type Mapping Table
CREATE TABLE service_provider_type (
    service_provider_type_id INT PRIMARY KEY AUTO_INCREMENT,
    service_type_id INT,
    provider_id INT,
    FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id),
    FOREIGN KEY (provider_id) REFERENCES service_provider(provider_id)
);

-- 16. Service Details Table
CREATE TABLE service_details (
    service_details_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    booking_id INT,
    provider_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    FOREIGN KEY (provider_id) REFERENCES service_provider(provider_id)
);

-- Sample Roles Insert
INSERT INTO roles (role_name) VALUES
('Admin'),
('Customer'),
('Venue Owner'),
('Service Provider');