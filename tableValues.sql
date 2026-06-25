USE bookmyvenue;

-- 1. Customers
INSERT INTO customers (full_name, email, phone, password) VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'rahul123'),
('Priya Patel', 'priya@gmail.com', '9876543211', 'priya123'),
('Amit Joshi', 'amit@gmail.com', '9876543212', 'amit123');

-- 2. Venue Owners
INSERT INTO venue_owners (owner_name, email, phone, password, address) VALUES
('Suresh Mehta', 'suresh@gmail.com', '9876543220', 'suresh123', 'Mumbai'),
('Kiran Desai', 'kiran@gmail.com', '9876543221', 'kiran123', 'Pune');

-- 3. Service Providers
INSERT INTO service_providers (provider_name, service_type, email, phone, password) VALUES
('Royal Decor', 'Decoration', 'decor@gmail.com', '9876543230', 'decor123'),
('Food Fiesta', 'Catering', 'food@gmail.com', '9876543231', 'food123'),
('SnapShot Studio', 'Photography', 'photo@gmail.com', '9876543232', 'photo123');

-- 4. Admins
INSERT INTO admins (username, password) VALUES
('admin1', 'admin123'),
('admin2', 'admin456');

-- 5. Venues
INSERT INTO venues (owner_id, venue_name, state, city, address, capacity, price_per_slot, image_url, status) VALUES
(1, 'Grand Palace', 'Maharashtra', 'Mumbai', 'Andheri East', 500, 50000, 'grand.jpg', 'Approved'),
(1, 'Royal Garden', 'Maharashtra', 'Pune', 'Baner', 300, 30000, 'royal.jpg', 'Pending'),
(2, 'Sunset Hall', 'Gujarat', 'Ahmedabad', 'Navrangpura', 400, 40000, 'sunset.jpg', 'Approved');

-- 6. Time Slots
INSERT INTO time_slots (venue_id, slot_date, start_time, end_time, availability) VALUES
(1, '2026-07-01', '10:00:00', '14:00:00', TRUE),
(1, '2026-07-01', '18:00:00', '22:00:00', TRUE),
(2, '2026-07-05', '09:00:00', '13:00:00', TRUE),
(3, '2026-07-10', '16:00:00', '20:00:00', TRUE);

-- 7. Packages
INSERT INTO packages (provider_id, package_name, package_type, price, description) VALUES
(1, 'Basic Decoration', 'Decoration', 10000, 'Flower decoration package'),
(2, 'Premium Catering', 'Catering', 25000, 'Food for 200 people'),
(3, 'Wedding Photography', 'Photography', 15000, 'Full event photography');

-- 8. Bookings
INSERT INTO bookings (customer_id, venue_id, slot_id, booking_date, total_amount, gst_amount, booking_status) VALUES
(1, 1, 1, '2026-06-25', 85000, 15300, 'Confirmed'),
(2, 2, 3, '2026-06-26', 55000, 9900, 'Pending'),
(3, 3, 4, '2026-06-27', 65000, 11700, 'Confirmed');

-- 9. Booking Packages
INSERT INTO booking_packages (booking_id, package_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

-- 10. Payments
INSERT INTO payments (booking_id, payment_method, payment_amount, payment_status, transaction_id) VALUES
(1, 'UPI', 85000, 'Success', 'TXN1001'),
(2, 'Credit Card', 55000, 'Pending', 'TXN1002'),
(3, 'Net Banking', 65000, 'Success', 'TXN1003');

-- 11. Reviews
INSERT INTO reviews (customer_id, venue_id, rating, review_text) VALUES
(1, 1, 5, 'Amazing venue and great service'),
(2, 2, 4, 'Good venue but parking was limited'),
(3, 3, 5, 'Excellent experience');

-- 12. Complaints
INSERT INTO complaints (customer_id, booking_id, complaint_text, status) VALUES
(2, 2, 'Need to change booking date', 'Open'),
(3, 3, 'Decoration service was delayed', 'Resolved');