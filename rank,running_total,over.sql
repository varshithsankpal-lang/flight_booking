use flight_booking;
select * from bookings;

SELECT
    booking_id,
    passenger_id,
    fare_amount,
    RANK() OVER (
        PARTITION BY booking_status
        ORDER BY fare_amount DESC
    ) AS fare_rank
FROM bookings
WHERE booking_status = 'Confirmed'
ORDER BY fare_amount DESC;

select * from bookings;

select booking_id,  passenger_id, booking_date,sum(fare_amount)  
over( partition by passenger_id order by booking_date ) as running
from bookings
where booking_status='confirmed';

select flight_id,booking_id,fare_amount, passenger_id,rank()
over( order by fare_amount desc) as highest
from bookings
where booking_status='confirmed' and fare_amount>2000;

select passenger_id, booking_id,sum(fare_amount) 
over( partition by passenger_id order by fare_amount desc ) as running,
rank() 
over(partition by passenger_id order by fare_amount desc) as rnk
from bookings
where booking_status='confirmed';  









