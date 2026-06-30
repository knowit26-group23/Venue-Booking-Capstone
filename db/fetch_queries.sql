-- 1. Fetch all users with roles
SELECT u.uid, u.uname, u.email, u.phone, r.rname
FROM users u
JOIN role r ON u.rid = r.rid;

-- 2. Fetch all venues with city and owner
SELECT v.vid, v.venue_name, v.capacity, v.cost,
       c.cname AS city,
       u.uname AS owner_name
FROM venue v
JOIN city c ON v.city_id = c.city_id
JOIN users u ON v.uid = u.uid;

-- 3. Fetch venue images
SELECT v.venue_name, vi.image_url
FROM venue_image vi
JOIN venue v ON vi.vid = v.vid;

-- 4. Fetch venue slots
SELECT v.venue_name, s.slot_id, s.start_time, s.end_time
FROM slot s
JOIN venue v ON s.vid = v.vid;

-- 5. Fetch booking details
SELECT b.bid,
       u.uname AS customer_name,
       v.venue_name,
       b.booking_date,
       b.status
FROM booking b
JOIN users u ON b.uid = u.uid
JOIN venue v ON b.vid = v.vid;

-- 6. Fetch booked slots
SELECT sb.sbid,
       s.slot_id,
       s.start_time,
       s.end_time,
       sb.booked_date
FROM slot_booking sb
JOIN slot s ON sb.slot_id = s.slot_id;

-- 7. Fetch service providers
SELECT sp.sid, sp.sname, sp.email, c.cname
FROM service_provider sp
JOIN city c ON sp.city_id = c.city_id;

-- 8. Fetch service provider types
SELECT sp.sname,
       st.stname,
       spt.cost
FROM service_provider_type spt
JOIN service_provider sp ON spt.sid = sp.sid
JOIN service_type st ON spt.stid = st.stid;

-- 9. Fetch services ordered in booking
SELECT sod.ser_detail_id,
       u.uname,
       b.bid,
       st.stname
FROM service_order_details sod
JOIN users u ON sod.uid = u.uid
JOIN booking b ON sod.bid = b.bid
JOIN service_provider_type spt ON sod.spt_id = spt.spt_id
JOIN service_type st ON spt.stid = st.stid;

-- 10. Fetch payment details
SELECT p.pay_id,
       b.bid,
       u.uname,
       p.total_amt,
       p.payment_status,
       p.payment_date
FROM payment p
JOIN booking b ON p.bid = b.bid
JOIN users u ON b.uid = u.uid;

-- 11. Fetch full booking summary
SELECT u.uname AS customer,
       v.venue_name,
       c.cname AS city,
       b.booking_date,
       s.start_time,
       s.end_time,
       p.total_amt,
       p.payment_status
FROM booking b
JOIN users u ON b.uid = u.uid
JOIN venue v ON b.vid = v.vid
JOIN city c ON v.city_id = c.city_id
JOIN slot s ON b.slot_id = s.slot_id
JOIN payment p ON b.bid = p.bid;
