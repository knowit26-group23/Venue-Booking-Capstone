
CREATE DATABASE bookmyvenue;
USE bookmyvenue;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE venue_owners (
    owner_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password VARCHAR(255),
    address TEXT
);

CREATE TABLE service_providers (
    provider_id INT PRIMARY KEY AUTO_INCREMENT,
    provider_name VARCHAR(100),
    service_type ENUM('Decoration','Catering','Photography'),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password VARCHAR(255)
);

CREATE TABLE admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE venues (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT,
    venue_name VARCHAR(100),
    state VARCHAR(50),
    city VARCHAR(50),
    address TEXT,
    capacity INT,
    price_per_slot DECIMAL(10,2),
    image_url VARCHAR(255),
    status ENUM('Pending','Approved','Rejected') DEFAULT 'Pending',
    FOREIGN KEY (owner_id) REFERENCES venue_owners(owner_id)
);

CREATE TABLE time_slots (
    slot_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_id INT,
    slot_date DATE,
    start_time TIME,
    end_time TIME,
    availability BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

CREATE TABLE packages (
    package_id INT PRIMARY KEY AUTO_INCREMENT,
    provider_id INT,
    package_name VARCHAR(100),
    package_type ENUM('Decoration','Catering','Photography'),
    price DECIMAL(10,2),
    description TEXT,
    FOREIGN KEY (provider_id) REFERENCES service_providers(provider_id)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    venue_id INT,
    slot_id INT,
    booking_date DATE,
    total_amount DECIMAL(10,2),
    gst_amount DECIMAL(10,2),
    booking_status ENUM('Pending','Confirmed','Cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (slot_id) REFERENCES time_slots(slot_id)
);

CREATE TABLE booking_packages (
    booking_package_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    package_id INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (package_id) REFERENCES packages(package_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    payment_method ENUM('UPI','PhonePe','Credit Card','Debit Card','Net Banking'),
    payment_amount DECIMAL(10,2),
    payment_status ENUM('Pending','Success','Failed'),
    transaction_id VARCHAR(100),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    venue_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

CREATE TABLE complaints (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    booking_id INT,
    complaint_text TEXT,
    status ENUM('Open','Resolved') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
