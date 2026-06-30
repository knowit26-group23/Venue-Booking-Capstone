CREATE DATABASE bookmyvenue;
USE bookmyvenue;

-- Role Table
CREATE TABLE role (
    rid INT PRIMARY KEY AUTO_INCREMENT,
    rname VARCHAR(50) NOT NULL UNIQUE
);

-- Users Table
CREATE TABLE users (
    uid INT PRIMARY KEY AUTO_INCREMENT,
    rid INT,
    uname VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    FOREIGN KEY (rid) REFERENCES role(rid)
);

-- State Table
CREATE TABLE state (
    state_id INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(100) NOT NULL
);

-- City Table
CREATE TABLE city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    state_id INT,
    cname VARCHAR(100) NOT NULL,
    FOREIGN KEY (state_id) REFERENCES state(state_id)
);

-- Venue Table
CREATE TABLE venue (
    vid INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    registration_no VARCHAR(50),
    gst_no VARCHAR(50),
    venue_name VARCHAR(150),
    address TEXT,
    phone VARCHAR(15),
    capacity INT,
    cost DECIMAL(10,2),
    city_id INT,
    FOREIGN KEY (uid) REFERENCES users(uid),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- Venue Images Table
CREATE TABLE venue_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    vid INT,
    image_url VARCHAR(255),
    FOREIGN KEY (vid) REFERENCES venue(vid)
);

-- Slot Table
CREATE TABLE slot (
    slot_id INT PRIMARY KEY AUTO_INCREMENT,
    vid INT,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (vid) REFERENCES venue(vid)
);

-- Booking Table
CREATE TABLE booking (
    bid INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    vid INT,
    slot_id INT,
    booking_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (uid) REFERENCES users(uid),
    FOREIGN KEY (vid) REFERENCES venue(vid),
    FOREIGN KEY (slot_id) REFERENCES slot(slot_id)
);

-- Slot Booking Table
CREATE TABLE slot_booking (
    sbid INT PRIMARY KEY AUTO_INCREMENT,
    slot_id INT,
    bid INT,
    booked_date DATE,
    FOREIGN KEY (slot_id) REFERENCES slot(slot_id),
    FOREIGN KEY (bid) REFERENCES booking(bid)
);

-- Service Provider Table
CREATE TABLE service_provider (
    sid INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    sname VARCHAR(100),
    email VARCHAR(100),
    gst_no VARCHAR(50),
    city_id INT,
    FOREIGN KEY (uid) REFERENCES users(uid),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- Service Type Table
CREATE TABLE service_type (
    stid INT PRIMARY KEY AUTO_INCREMENT,
    stname VARCHAR(100)
);

-- Service Provider Type Table (Many-to-Many)
CREATE TABLE service_provider_type (
    spt_id INT PRIMARY KEY AUTO_INCREMENT,
    sid INT,
    stid INT,
    cost DECIMAL(10,2),
    FOREIGN KEY (sid) REFERENCES service_provider(sid),
    FOREIGN KEY (stid) REFERENCES service_type(stid)
);

-- Service Order Details Table
CREATE TABLE service_order_details (
    ser_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    spt_id INT,
    uid INT,
    bid INT,
    FOREIGN KEY (spt_id) REFERENCES service_provider_type(spt_id),
    FOREIGN KEY (uid) REFERENCES users(uid),
    FOREIGN KEY (bid) REFERENCES booking(bid)
);

-- Payment Table
CREATE TABLE payment (
    pay_id INT PRIMARY KEY AUTO_INCREMENT,
    bid INT,
    total_amt DECIMAL(10,2),
    payment_status VARCHAR(30),
    payment_date DATETIME,
    FOREIGN KEY (bid) REFERENCES booking(bid)
);

-- Insert Roles
INSERT INTO role (rname) VALUES
('Admin'),
('Customer'),
('Venue Owner'),
('Service Provider');

-- Insert Service Types
INSERT INTO service_type (stname) VALUES
('Catering'),
('Decoration'),
('Photography'),
('DJ');