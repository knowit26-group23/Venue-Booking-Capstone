-- Insert Roles
INSERT INTO role (rname) VALUES
('Admin'),
('Customer'),
('Venue Owner'),
('Service Provider');

-- Insert Users
INSERT INTO users (rid, uname, password, email, phone) VALUES
(1, 'admin1', 'admin123', 'admin@gmail.com', '9876543210'),
(2, 'devendra', 'cust123', 'dev@gmail.com', '9876543211'),
(2, 'rahul', 'cust456', 'rahul@gmail.com', '9876543212'),
(3, 'venueowner1', 'owner123', 'owner@gmail.com', '9876543213'),
(4, 'serviceprovider1', 'sp123', 'service@gmail.com', '9876543214');

-- Insert State
INSERT INTO state (sname) VALUES
('Maharashtra'),
('Gujarat'),
('Delhi');

-- Insert City
INSERT INTO city (state_id, cname) VALUES
(1, 'Pune'),
(1, 'Mumbai'),
(2, 'Ahmedabad'),
(3, 'New Delhi');

-- Insert Venue
INSERT INTO venue (uid, registration_no, gst_no, venue_name, address, phone, capacity, cost, city_id) VALUES
(4, 'REG101', 'GST101', 'Royal Palace', 'Kothrud Pune', '9988776655', 500, 50000.00, 1),
(4, 'REG102', 'GST102', 'Sunshine Hall', 'Baner Pune', '9988776656', 300, 30000.00, 1);

-- Insert Venue Images
INSERT INTO venue_image (vid, image_url) VALUES
(1, 'royal1.jpg'),
(1, 'royal2.jpg'),
(2, 'sunshine1.jpg');

-- Insert Slots
INSERT INTO slot (vid, start_time, end_time) VALUES
(1, '10:00:00', '14:00:00'),
(1, '15:00:00', '19:00:00'),
(2, '09:00:00', '13:00:00');

-- Insert Booking
INSERT INTO booking (uid, vid, slot_id, booking_date, status) VALUES
(2, 1, 1, '2026-07-15', 'Booked'),
(3, 2, 3, '2026-07-20', 'Pending');

-- Insert Slot Booking
INSERT INTO slot_booking (slot_id, bid, booked_date) VALUES
(1, 1, '2026-07-15'),
(3, 2, '2026-07-20');

-- Insert Service Provider
INSERT INTO service_provider (uid, sname, email, gst_no, city_id) VALUES
(5, 'ABC Catering', 'abc@gmail.com', 'GST501', 1),
(5, 'Dream Decoration', 'dream@gmail.com', 'GST502', 1);

-- Insert Service Type
INSERT INTO service_type (stname) VALUES
('Catering'),
('Decoration'),
('Photography'),
('DJ');

-- Insert Service Provider Type
INSERT INTO service_provider_type (sid, stid, cost) VALUES
(1, 1, 15000.00),
(2, 2, 10000.00),
(2, 4, 8000.00);

-- Insert Service Order Details
INSERT INTO service_order_details (spt_id, uid, bid) VALUES
(1, 2, 1),
(2, 2, 1),
(3, 3, 2);

-- Insert Payment
INSERT INTO payment (bid, total_amt, payment_status, payment_date) VALUES
(1, 75000.00, 'Paid', NOW()),
(2, 30000.00, 'Pending', NOW());
