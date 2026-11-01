use flight_booking;

select * from payments;

select booking_status, sum(booking_status) as total
from bookings
group by booking_status
order by total desc;

select payment_method, sum(amount)  as total
from payments
where payment_status='paid'
group by payment_method
order by total desc;

select * from flights;
select * from airlines;

select a.airline_name, avg(base_fare) as average
from airlines a 
inner join   flights b
on a.airline_id = b.airline_id 
group by airline_name 
having average>5000
order by average desc;

select * from flights;

select flight_number,origin_airport,destination_airport,base_fare
from flights
order by base_fare desc
limit 100 offset 3;

select  origin_airport,count(flight_id) as total_flights
from flights
group by origin_airport 
having total_flights>=2
order by total_flights desc ;

select * from bookings;
select * from passengers;

select x.passenger_id,x.first_name,count(booking_status) as total
from passengers x
inner join bookings y
on x.passenger_id = y.passenger_id
where y.booking_status='confirmed'
group by x.passenger_id , x.first_name
having total>=2
order by total desc;

select * from airlines;
select * from flights;
select * from bookings;
select * from payments;

select a.airline_name,sum(d.amount) as total_revenue
from  airlines a 
inner join flights b 
on a.airline_id = b.airline_id
inner join bookings c 
on b.flight_id = c.flight_id
inner join payments d 
on c.booking_id = d.booking_id 
where c.booking_status='confirmed'
and d.payment_status='paid'
group by a.airline_name
order by total_revenue desc;

desc payments;
DESC bookings;

select * from bookings;
select * from passengers;

select p.passenger_id,p.first_name,p.last_name, sum(b.fare_amount) as total , count(b.booking_status) as confirmed
from passengers p
inner join bookings b 
on p.passenger_id = b.passenger_id
where booking_status='confirmed'
 GROUP BY p.passenger_id, p.first_name, p.last_name
having confirmed>=2
order by confirmed desc , total desc;
















