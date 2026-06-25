USE bookmyvenue;

-- Show all customers
SELECT * FROM customers;

-- Show all venue owners
SELECT * FROM venue_owners;

-- Show all service providers
SELECT * FROM service_providers;

-- Show all admins
SELECT * FROM admins;

-- Show all venues
SELECT * FROM venues;

-- Show all time slots
SELECT * FROM time_slots;

-- Show all packages
SELECT * FROM packages;

-- Show all bookings
SELECT * FROM bookings;

-- Show all booking packages
SELECT * FROM booking_packages;

-- Show all payments
SELECT * FROM payments;

-- Show all reviews
SELECT * FROM reviews;

-- Show all complaints
SELECT * FROM complaints;

-- Booking details with customer and venue
SELECT 
    b.booking_id,
    c.full_name,
    v.venue_name,
    b.booking_date,
    b.total_amount,
    b.booking_status
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN venues v ON b.venue_id = v.venue_id;

-- Payment details with booking
SELECT 
    p.payment_id,
    b.booking_id,
    p.payment_method,
    p.payment_amount,
    p.payment_status
FROM payments p
JOIN bookings b ON p.booking_id = b.booking_id;

-- Review details
SELECT 
    r.review_id,
    c.full_name,
    v.venue_name,
    r.rating,
    r.review_text
FROM reviews r
JOIN customers c ON r.customer_id = c.customer_id
JOIN venues v ON r.venue_id = v.venue_id;