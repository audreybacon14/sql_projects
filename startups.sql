/* View the startups table */
SELECT * FROM startups ;

/* total number of companirs in the table */
SELECT COUNT(*) FROM startups ;

/* total value of all companies in startups table */
SELECT SUM(valuation) FROM startups ; 

/* highest amount raised by a startup during 'Seed' stage */
SELECT MAX(raised) FROM startups WHERE stage = 'Seed' ;

/* year the oldest company on the list was founded */
SELECT MIN(founded) FROM startups ;

/* return the average valuation in each category and round the averages to two decimal places */
SELECT CATEGORY, ROUND(AVG(valuation), 2) FROM startups GROUP BY category ;

/* What are the most competitive markets */
SELECT category, COUNT(*) FROM startups GROUP BY category HAVING COUNT(*) > 3 ORDER BY 2 DESC;



