#assignment 1



SELECT * FROM planes;
SELECT * FROM flights;

#How many airplanes have listed speeds?
SELECT COUNT(*) FROM planes
WHERE speed IS NOT null;

#What is the minimum listed speed?qa
SELECT MIN(speed) AS 'Minimum Speed'
FROM planes;

#What is the maximum listed speed?
SELECT MAX(speed) AS 'Maximun Speed'
FROM planes;

#What is the total distance flown by all of the planes in January 2013?

SELECT SUM(distance) AS 'Total Distance' FROM flights
WHERE month = 1 and year = 2013;

#What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT SUM(distance) AS 'Total Distance' FROM flights
WHERE 
tailnum IS NULL AND
month = 1 AND
year = 2013;

#what is the total  distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? Write this statement first using an INNER JOIN, then using a LEFTOUTER JOIN. How do your results compare?


SELECT planes. manufacturer, SUM(flights.distance) 
FROM flights 
INNER JOIN planes
ON planes.tailnum = flights.tailnum
WHERE flights.year = '2013' AND flights.month ='7' AND flights.day ='5' 
GROUP BY planes.manufacturer;


SELECT planes.manufacturer, SUM(flights.distance)
FROM flights
LEFT JOIN planes
ON planes.tailnum = flights.tailnum
WHERE flights.year = '2013' AND flights.month = '7' AND flights.day ='5'
GROUP BY planes.manufacturer;

#Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database

SELECT origin, dest, distance
FROM flights
ORDER BY distance;



