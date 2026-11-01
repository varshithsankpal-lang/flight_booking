create database flight_booking;
use  flight_booking;
create table airlines (
airline_id int primary key,
airline_name varchar(50) not null,
airline_code varchar(50) not null unique,
country varchar(50) not null
);

create table passengers(
passenger_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) unique not null,
phone varchar(20) unique ,
passport_no  varchar(50) unique,
date_of_birth  date not null
);

CREATE TABLE flights (
    flight_id INT  PRIMARY KEY,
    airline_id INT NOT NULL,
    flight_number VARCHAR(12) NOT NULL,
    origin_airport VARCHAR(10) NOT NULL,
    destination_airport VARCHAR(10) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    seat_capacity INT NOT NULL,
    base_fare DECIMAL(10,2) NOT NULL,
    flight_status ENUM(
        'Scheduled',
        'Delayed',
        'Completed',
        'Cancelled'
    ) NOT NULL DEFAULT 'Scheduled',

    CONSTRAINT fk_flight_airline
        FOREIGN KEY (airline_id)
        REFERENCES airlines(airline_id),

    CONSTRAINT chk_seat_capacity
        CHECK (seat_capacity > 0),

    CONSTRAINT chk_base_fare
        CHECK (base_fare >= 0),

    CONSTRAINT chk_flight_time
        CHECK (arrival_time > departure_time),

    CONSTRAINT chk_airport
        CHECK (origin_airport <> destination_airport)
);

CREATE TABLE bookings (
    booking_id INT  PRIMARY KEY,
    booking_reference VARCHAR(15) NOT NULL UNIQUE,
    passenger_id INT NOT NULL,
    flight_id INT NOT NULL,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    seat_number VARCHAR(5),
    fare_amount DECIMAL(10,2) NOT NULL,
    booking_status ENUM(
        'Pending',
        'Confirmed',
        'Cancelled'
    ) NOT NULL DEFAULT 'Pending',

    CONSTRAINT fk_booking_passenger
        FOREIGN KEY (passenger_id)
        REFERENCES passengers(passenger_id),

    CONSTRAINT fk_booking_flight
        FOREIGN KEY (flight_id)
        REFERENCES flights(flight_id),

    CONSTRAINT uq_flight_seat
        UNIQUE (flight_id, seat_number),

    CONSTRAINT chk_fare
        CHECK (fare_amount >= 0)
);

CREATE TABLE payments (
    payment_id INT  PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,

    payment_method ENUM(
        'UPI',
        'Card',
        'NetBanking',
        'Wallet',
        'Cash'
    ) NOT NULL,

    payment_status ENUM(
        'Pending',
        'Paid',
        'Failed',
        'Refunded'
    ) NOT NULL DEFAULT 'Pending',

    transaction_reference VARCHAR(40) NOT NULL UNIQUE,

    CONSTRAINT fk_payment_booking
        FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id),

    CONSTRAINT chk_payment_amount
        CHECK (amount > 0)
);

show tables;





