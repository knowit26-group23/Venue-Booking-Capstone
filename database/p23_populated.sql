USE bookmyvenue;

-- Roles
INSERT INTO roles(role_name) VALUES
('Admin'),
('Customer'),
('Venue Owner'),
('Service Provider');

-- Users
INSERT INTO users(username,password,first_name,last_name,email,contact_number,role_id) VALUES
('admin01','admin123','Dev','Borse','admin@gmail.com','9876543210',1),
('rahul01','rahul123','Rahul','Patil','rahul@gmail.com','9876543211',2),
('owner01','owner123','Amit','Sharma','amit@gmail.com','9876543212',3),
('provider01','provider123','Priya','Joshi','priya@gmail.com','9876543213',4);

-- State
INSERT INTO state(state_name) VALUES
('Maharashtra'),
('Gujarat'),
('Delhi');

-- City
INSERT INTO city(state_id,city_name) VALUES
(1,'Pune'),
(1,'Mumbai'),
(2,'Ahmedabad'),
(3,'New Delhi');

-- Venue Types
INSERT INTO venue_type(venue_type_name) VALUES
('Marriage Hall'),
('College Ground'),
('Apartment Lawn'),
('School Ground');

-- Venues
INSERT INTO venue(venue_type_id,user_id,venue_name,address,capacity,price_per_day,availability_status,city_id) VALUES
(1,3,'Royal Marriage Hall','Baner Pune',500,50000,1,1),
(2,3,'Sunshine College Ground','Kothrud Pune',1000,30000,1,1),
(3,3,'Green Lawn','Andheri Mumbai',300,20000,1,2);

-- Venue Images
INSERT INTO venue_image(venue_id,image_path) VALUES
(1,'images/royalhall.jpg'),
(2,'images/collegeground.jpg'),
(3,'images/greenlawn.jpg');

-- Time Slots
INSERT INTO time_slot(venue_id,start_time,end_time,slot_status) VALUES
(1,'09:00:00','14:00:00',1),
(1,'15:00:00','22:00:00',1),
(2,'08:00:00','18:00:00',1);

-- Bookings
INSERT INTO booking(user_id,venue_id,booking_date,booking_status,slot_id) VALUES
(2,1,'2026-07-10',1,1),
(2,2,'2026-07-15',1,3);

-- Spot Booking
INSERT INTO slot_booking(booking_id) VALUES
(1),
(2);

-- Payment
INSERT INTO payment(booking_id,total_amount,payment_date) VALUES
(1,50000,'2026-07-03'),
(2,30000,'2026-07-03');

-- Reviews
INSERT INTO review(user_id,venue_id,rating,review_text) VALUES
(2,1,5,'Excellent venue and good service'),
(2,2,4,'Good ground for events');

-- Service Types
INSERT INTO service_type(service_name,description,price) VALUES
('Catering','Food service for events',25000),
('Decoration','Stage and hall decoration',15000),
('Photography','Photo and video coverage',20000);

-- Service Providers
INSERT INTO service_provider(provider_name,user_id,gst_no,city,address,city_id) VALUES
('Foodies Caterers',4,'GST12345','Pune','FC Road Pune',1),
('Dream Decorators',4,'GST67890','Mumbai','Bandra Mumbai',2);

-- Service Provider Types
INSERT INTO service_provider_type(service_type_id,provider_id) VALUES
(1,1),
(2,2);

-- Service Details
INSERT INTO service_details(user_id,booking_id,provider_id) VALUES
(2,1,1),
(2,2,2);