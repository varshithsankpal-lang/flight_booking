use flight_booking;
INSERT INTO airlines
(airline_id, airline_name, airline_code, country)
VALUES
(1, 'Air India', 'AI', 'India'),
(2, 'IndiGo', '6E', 'India'),
(3, 'Akasa Air', 'QP', 'India'),
(4, 'Emirates', 'EK', 'UAE'),
(5, 'Qatar Airways', 'QR', 'Qatar');

INSERT INTO passengers
(passenger_id, first_name, last_name, email,
 phone, passport_no, date_of_birth)
VALUES
(101, 'Varshith', 'Sankpal', 'varshith@gmail.com', '9876543210', 'P10001', '2002-05-15'),
(102, 'Rahul', 'Sharma', 'rahul@gmail.com', '9876543211', 'P10002', '1998-08-20'),
(103, 'Priya', 'Patel', 'priya@gmail.com', '9876543212', NULL, '1995-03-12'),
(104, 'Amit', 'Verma', 'amit@gmail.com', '9876543213', 'P10004', '1990-11-25'),
(105, 'Sneha', 'Mehta', 'sneha@gmail.com', '9876543214', 'P10005', '1999-06-18'),
(106, 'Arjun', 'Rao', 'arjun@gmail.com', '9876543215', NULL, '1997-01-30'),
(107, 'Neha', 'Singh', 'neha@gmail.com', '9876543216', 'P10007', '1994-09-10'),
(108, 'Karan', 'Shah', 'karan@gmail.com', '9876543217', 'P10008', '2000-12-05'),
(109, 'Ananya', 'Desai', 'ananya@gmail.com', '9876543218', 'P10009', '1996-04-22'),
(110, 'Rohan', 'Gupta', 'rohan@gmail.com', '9876543219', 'P10010', '1992-07-14');

INSERT INTO flights
(flight_id, airline_id, flight_number,
 origin_airport, destination_airport,
 departure_time, arrival_time,
 seat_capacity, base_fare, flight_status)
VALUES
(1, 1, 'AI101', 'BOM', 'DEL', '2026-11-05 08:00:00', '2026-11-05 10:15:00', 180, 6500, 'Scheduled'),
(2, 2, '6E202', 'DEL', 'BLR', '2026-11-05 09:00:00', '2026-11-05 12:00:00', 186, 5200, 'Scheduled'),
(3, 3, 'QP303', 'BOM', 'GOI', '2026-11-06 07:00:00', '2026-11-06 08:15:00', 189, 4200, 'Scheduled'),
(4, 4, 'EK404', 'BOM', 'DXB', '2026-11-06 22:00:00', '2026-11-07 00:30:00', 250, 25000, 'Scheduled'),
(5, 5, 'QR505', 'DEL', 'DOH', '2026-11-07 03:00:00', '2026-11-07 05:30:00', 240, 28000, 'Scheduled'),
(6, 1, 'AI106', 'BLR', 'HYD', '2026-11-08 12:00:00', '2026-11-08 13:15:00', 180, 4800, 'Delayed'),
(7, 2, '6E207', 'PNQ', 'DEL', '2026-11-08 15:00:00', '2026-11-08 17:10:00', 186, 4900, 'Scheduled'),
(8, 3, 'QP308', 'GOI', 'BOM', '2026-11-09 18:00:00', '2026-11-09 19:15:00', 189, 4300, 'Scheduled'),
(9, 1, 'AI109', 'HYD', 'MAA', '2026-10-20 06:00:00', '2026-10-20 07:30:00', 180, 5100, 'Completed'),
(10, 2, '6E210', 'MAA', 'BOM', '2026-10-22 16:00:00', '2026-10-22 18:00:00', 186, 5500, 'Completed');

INSERT INTO bookings
(booking_id, booking_reference, passenger_id,
 flight_id, booking_date, seat_number,
 fare_amount, booking_status)
VALUES
(1, 'BK1001', 101, 1, '2026-10-25 10:00:00', '12A', 6500, 'Confirmed'),
(2, 'BK1002', 102, 1, '2026-10-25 11:00:00', '12B', 6500, 'Confirmed'),
(3, 'BK1003', 103, 1, '2026-10-29 09:00:00', '12C', 6500, 'Pending'),
(4, 'BK1004', 104, 2, '2026-10-26 12:00:00', '14A', 5200, 'Confirmed'),
(5, 'BK1005', 105, 2, '2026-10-26 13:00:00', NULL, 5200, 'Cancelled'),
(6, 'BK1006', 106, 3, '2026-10-27 10:00:00', '10A', 4200, 'Confirmed'),
(7, 'BK1007', 107, 3, '2026-10-27 11:00:00', '10B', 4200, 'Confirmed'),
(8, 'BK1008', 108, 4, '2026-10-28 14:00:00', '21A', 25000, 'Confirmed'),
(9, 'BK1009', 109, 4, '2026-10-29 15:00:00', '21B', 25000, 'Pending'),
(10, 'BK1010', 110, 5, '2026-10-29 16:00:00', '15A', 28000, 'Confirmed'),
(11, 'BK1011', 101, 6, '2026-10-30 10:00:00', '8A', 4800, 'Confirmed'),
(12, 'BK1012', 102, 7, '2026-10-30 11:00:00', '9A', 4900, 'Pending'),
(13, 'BK1013', 103, 8, '2026-10-30 12:00:00', NULL, 4300, 'Cancelled'),
(14, 'BK1014', 104, 9, '2026-09-30 10:00:00', '20A', 5100, 'Confirmed'),
(15, 'BK1015', 105, 10, '2026-10-01 12:00:00', '22A', 5500, 'Confirmed');

INSERT INTO payments
(payment_id, booking_id, payment_date,
 amount, payment_method, payment_status,
 transaction_reference)
VALUES
(1, 1, '2026-10-25 10:05:00', 6500, 'UPI', 'Paid', 'TXN10001'),
(2, 2, '2026-10-25 11:05:00', 6500, 'Card', 'Paid', 'TXN10002'),
(3, 3, '2026-10-29 09:05:00', 6500, 'UPI', 'Pending', 'TXN10003'),
(4, 4, '2026-10-26 12:05:00', 5200, 'Card', 'Paid', 'TXN10004'),
(5, 5, '2026-10-26 13:05:00', 5200, 'UPI', 'Refunded', 'TXN10005'),
(6, 6, '2026-10-27 10:05:00', 4200, 'UPI', 'Paid', 'TXN10006'),
(7, 7, '2026-10-27 11:05:00', 4200, 'NetBanking', 'Paid', 'TXN10007'),
(8, 8, '2026-10-28 14:05:00', 25000, 'Card', 'Paid', 'TXN10008'),
(9, 9, '2026-10-29 15:05:00', 25000, 'Card', 'Pending', 'TXN10009'),
(10, 10, '2026-10-29 16:05:00', 28000, 'NetBanking', 'Paid', 'TXN10010'),
(11, 11, '2026-10-30 10:05:00', 4800, 'UPI', 'Paid', 'TXN10011'),
(12, 12, '2026-10-30 11:05:00', 4900, 'Card', 'Failed', 'TXN10012'),
(13, 13, '2026-10-30 12:05:00', 4300, 'Wallet', 'Refunded', 'TXN10013'),
(14, 14, '2026-09-30 10:05:00', 5100, 'Card', 'Paid', 'TXN10014'),
(15, 15, '2026-10-01 12:05:00', 5500, 'UPI', 'Paid', 'TXN10015');

