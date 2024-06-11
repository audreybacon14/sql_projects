/* Warby Parker has a Style Quiz that has the following questions:
1. "What are you looking for?"
2. "What's your fit?"
3. "Which shapes do you like?"
4. "Which colors do you like?"
5. "When was your last eye exam?"

The users' responses are stored in a table called survey */

SELECT * 
FROM survey
LIMIT 10;

/* Analyze how many users move from Q1 to Q2 */

SELECT  question,
    COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;

/* A/B Testing was conducted in the Home Try-On stage
- 50% of the users get 3 pairs to try on
- 50% of the users get 5 pairs to try on 

find out whether or not users who get more pairs to try on at home will 
be more likely to purchase */

SELECT *
FROM Quiz
LIMIT 5;

SELECT * 
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

/* Combine the three tables starting with the top of the funnel(browse) and ending 
with the bottom of the funnel (purchase). */

SELECT DISTINCT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
LEFT JOIN purchase p
    ON p.user_id = q.user_id
LIMIT 10;




