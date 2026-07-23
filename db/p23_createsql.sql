```sql
CREATE DATABASE IF NOT EXISTS bookmyvenue;
USE bookmyvenue;

-- =====================================
-- 1. Roles Table
-- =====================================
CREATE TABLE IF NOT EXISTS roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);

-- =====================================
-- 2. Users Table
-- =====================================
CREATE TABLE IF NOT EXISTS users (
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

-- =====================================
-- 3. State Table
-- =====================================
CREATE TABLE IF NOT EXISTS state (
    state_id INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(100) NOT NULL
);

-- =====================================
-- 4. City Table
-- =====================================
CREATE TABLE IF NOT EXISTS city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    state_id INT,
    city_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (state_id) REFERENCES state(state_id)
);

-- =====================================
-- 5. Venue Type Table
-- =====================================
CREATE TABLE IF NOT EXISTS venue_type (
    venue_type_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_type_name VARCHAR(100) NOT NULL
);

-- =====================================
-- 6. Venue Table
-- =====================================
CREATE TABLE IF NOT EXISTS venue (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_type_id INT,
    user_id INT,
    city_id INT,
    venue_name VARCHAR(150) NOT NULL,
    address TEXT,
    capacity INT,
    price_per_day DECIMAL(10,2),
    registration_number VARCHAR(150) NOT NULL,
    gst_no VARCHAR(150) NOT NULL,
    image_url VARCHAR(500) NOT NULL,

    FOREIGN KEY (venue_type_id) REFERENCES venue_type(venue_type_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
,
    availability_status BOOLEAN DEFAULT TRUE
);

-- =====================================
-- 7. Review Table
-- =====================================
CREATE TABLE IF NOT EXISTS review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    venue_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

-- =====================================
-- 8. Time Slot Table
-- =====================================
CREATE TABLE IF NOT EXISTS time_slot (
    slot_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_id INT,
    start_time TIME,
    end_time TIME,

    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
,
    slot_status BOOLEAN DEFAULT TRUE
);

-- =====================================
-- 9. Booking Table
-- =====================================
CREATE TABLE IF NOT EXISTS booking (
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



-- =====================================
-- 11. Payment Table
-- =====================================
CREATE TABLE IF NOT EXISTS payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    total_amount DECIMAL(10,2),
    payment_date DATE,

    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

-- =====================================
-- 12. Service Type Table
-- =====================================
CREATE TABLE IF NOT EXISTS service_type (
    service_type_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(100) NOT NULL
,
    description TEXT,
    price DECIMAL(10,2)
);

-- =====================================
-- 13. Service Provider Table
-- =====================================
CREATE TABLE IF NOT EXISTS service_provider (
    provider_id INT PRIMARY KEY AUTO_INCREMENT,
    provider_name VARCHAR(100),
    user_id INT,
    gst_no VARCHAR(50),
    city_id INT,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- =====================================
-- 14. Service Provider Type Mapping
-- =====================================
CREATE TABLE IF NOT EXISTS service_provider_type (
    service_provider_type_id INT PRIMARY KEY AUTO_INCREMENT,
    service_type_id INT,
    provider_id INT,
    cost DECIMAL(10,2),

    FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id),
    FOREIGN KEY (provider_id) REFERENCES service_provider(provider_id)
);

-- =====================================
-- 15. Service Details Table
-- =====================================
CREATE TABLE IF NOT EXISTS service_details (
    service_details_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    booking_id INT,
    provider_id INT,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    FOREIGN KEY (provider_id) REFERENCES service_provider(provider_id)
);


CREATE TABLE IF NOT EXISTS venue_image (
 image_id INT AUTO_INCREMENT PRIMARY KEY,
 venue_id INT NOT NULL,
 image_url VARCHAR(255) NOT NULL,
 FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

CREATE TABLE IF NOT EXISTS slot_booking (
 slot_booking_id INT AUTO_INCREMENT PRIMARY KEY,
 booking_id INT NOT NULL,
 slot_id INT NOT NULL,
 FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
 FOREIGN KEY (slot_id) REFERENCES time_slot(slot_id)
);
