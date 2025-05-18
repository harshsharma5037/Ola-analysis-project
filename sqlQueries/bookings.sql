Use Ola;

#1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_Status = 'Success';

# 2. Find the average ride distance for each vehicle type of successful bookings:
create view avg_distance as
select Vehicle_Type, avg(Ride_Distance)
as avg_distance from Successful_Bookings
group by Vehicle_Type;


# 3. Get the total number of cancelled rides by customers:
create view canceled_by_customer as
select count(*) as Cancelled_by_costumer
from bookings
where Booking_Status = 'Canceled by Customer';

# 4. List the top 5 customers who booked the highest number of rides:
create view top_customer as
select Customer_ID, count(Booking_ID) as total_rides
from Successful_Bookings
group by Customer_ID
order by total_rides desc limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view canceled_by_driver as
select count(*) as canceled_by_driver
from bookings 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings 
where Vehicle_Type = 'Prime Sedan';

# 7. Retrieve all rides where payment was made using UPI:
create view payment_using_upi as
select * from bookings 
where Payment_Method = 'UPI';

 #8. Find the average customer rating per vehicle type:
 create view AVG_customer_rating as
 select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
 from Successful_Bookings
 group by Vehicle_Type;
 
 # 9. Calculate the total booking value of rides completed successfully:
 create view total_successful_booking_value as
 select sum(Booking_Value) from Successful_Bookings;
 
 # 10. List all incomplete rides along with the reason:
 create view incomplete_rides as 
 select Booking_ID, Incomplete_Rides_Reason
 from bookings
 where Incomplete_Rides = 'Yes';
 
 