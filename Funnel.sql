/* build a funnel to analyze if certain questions prompted users to stop working on the survey */
SELECT *
FROM survey_responses
LIMIT 10 ;

/* number of responses for each question */
SELECT question_text,
    COUNT(DISTINCT user_id)
FROM survey_responses
GROUP BY 1 ;

 -- Compare funnels for A/B tests 
 
 /* select all columns for the first 10 records from onboarding_modals */
SELECT *
FROM onboarding_modals
LIMIT 10 ;

/* number of users completing each step of the funnel */
SELECT modal_text,
    COUNT(DISTINCT user_id)
FROM onboarding_modals
GROUP BY 1
ORDER BY 1 ;


/* count the number of clicks from the variant group and control group */

SELECT modal_text,
    COUNT(DISTINCT CASE 
        WHEN ab_group = 'control' THEN user_id
        END) AS 'control_clicks',
    COUNT(DISTINCT CASE 
        WHEN ab_group = 'variant' THEN user_id
        END) AS 'variant_clicks'
FROM onboarding_modals
GROUP BY 1
ORDER BY 1 ; 

-- Build a Funnwel from Multiple Tables

SELECT *
FROM browse
LIMIT 5 ;

SELECT *
FROM checkout
LIMIT 5 ;

SELECT *
FROM purchase 
LIMIT 5 ;

/* joined three different tables */

SELECT DISTINCT b.browse_data,
    b.user.id,
    c.user_id IS NOT NULL AS 'is_checkout',
    p.user_id IS NOT NULL AS 'is_purchase'
FROM browse AS 'b'
LEFT JOIN checkout 'c'
    ON c.user_id = b.user_id
LEFT JOIN purchase 'p'
    ON p.user_id = c.user_id
LIMIT 50 ;

/* build a funnel from multiple tables */

WITH funnels AS (
    SELECT DISTINCT b.browse_data,
    b.user.id,
    c.user_id IS NOT NULL AS 'is_checkout',
    p.user_id IS NOT NULL AS 'is_purchase'
FROM browse AS 'b'
LEFT JOIN checkout 'c'
    ON c.user_id = b.user_id
LEFT JOIN purchase 'p'
    ON p.user_id = c.user_id
) 
SELECT COUNT(*) AS 'num_browse',
    SUM(is_checkout) AS 'num_checkout',
    SUM(is_purchase) AS 'num_purchase',
    1.0 * SUM(is_checkout) / COUNT(user_id) AS 'browse_to_checkout',
    1.0 * SUM(is_purchase) / SUM(is_checkout) AS
    'checkout_to_purchase'
FROM funnels ;

/* create a funnel for Mattress and More's purchase process */
WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT COUNT(*) AS 'num_browse',
   SUM(is_checkout) AS 'num_checkout',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_checkout) / COUNT(user_id) AS 'browse_to_checkout',
   1.0 * SUM(is_purchase) / SUM(is_checkout) AS 'checkout_to_purchase'
FROM funnels;



