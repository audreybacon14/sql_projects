/* combining multiple tables */

/* examine the three tables */
SELECT * FROM trips ;
SELECT * FROM riders ;
SELECT * FROM cars ;

/* cross join between riders and cars */
SELECT riders.first,
    riders.last,
    cars.model
FROM riders, cars ;

/* create a trip log with the trips and its users */
SELECT *
FROM trips
LEFT JOIN riders
    ON trip.rider_id = riders.rider_id ;


/* create a link between the trips and the cars used during those trips */
SELECT *
FROM trips
JOIN cars
    ON trips.car_id = cars.id ;

/* Stack the riders table on top of the new table named riders2 */
SELECT * 
FROM riders
UNION 
SELECT *
FROM riders2 ;

/* Average cost for a trip */
SELECT ROUND(AVG(cost), 2)
FROM trips ;


/* Find all the riders who have used Lyft less than 500 times */
SELECT *
FROM riders
WHERE total_trips < 500 ;

/* calculate the number of cars that are active */
SELECT COUNT(*)
FROM cars 
WHERE status = 'active' ;

/* find the two cars that have the highest trips_completed */
SELECT *
FROM cars
ORDER BY trips_completed DESC 
LIMIT 2;



