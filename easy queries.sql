use flight_booking;
select * from passengers;

select first_name, last_name,email
from passengers;

select * from flights;

select * from flights
where origin_airport='BOM' ;

select * from flights
where base_fare>5000;

select * from flights
order by base_fare desc;

select * from bookings 
where booking_status='pending';

select * from passengers
where passport_no is null;

select * from flights
order by base_fare desc
limit 5;





