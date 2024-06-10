/* Find the best dinner spots in the city using SQL commands */

SELECT * FROM nomnom ;

/* distinct neighbourhoods */
SELECT DISTINCT neighbourhoods FROM nomnom ;

/* distinct cuisine*/
SELECT DISTINCT cuisine FROM nomnom ;


/* options for chinese food */
SELECT * from nomnom WHERE cuisine = 'Chinese' ;

/* all the restaurants with reviews of 4 and above */

SELECT * FROM nomnom WHERE review >= 4 ;

/* all restaurants that are Italian and $$$ (fancy) */

SELECT * FROM nomnom WHERE cuisine = 'Italian' AND price = '$$$' ;

/* restaurants that contains the word 'meatball' in it */
SELECT * FROM nomnom WHERE name LIKE '%meatball%' ;

/* restaurants in Midtown, Downtown, or Chinatown */
SELECT * FROM nomnom WHERE neighbourhood = 'Midtown' OR neighbourhood = 'Downtown' OR neighbourhood = 'Chinatown' ;


/* find restaurants with health grade pending */
SELECT * FROM nomnom WHERE health IS NULL ;


/* create a top 10 restaurants ranking based on reviews */
SELECT * FROM nomnom ORDER BY review DESC LIMIT 10 ;

/* use a case statement to change the rating system */
SELECT name,
    CASE 
        WHEN review > 4.5 THEN 'Extraordinary'
        WHEN review > 4 THEN 'Excellent'
        WHEN review > 3 THEN 'Good'
        WHEN review > 2 THEN 'Fair'
        ELSE 'Poor'
    END AS 'Review'
FROM nomnom ;




