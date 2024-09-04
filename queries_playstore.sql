-- id              | 1
-- app_name        | Facebook
-- category        | SOCIAL
-- rating          | 4.1
-- reviews         | 78158306
-- size            | Varies with device
-- min_installs    | 1000000000
-- price           | 0
-- content_rating  | Teen
-- genres          | {Social}
-- last_updated    | 2018-08-03
-- current_version | Varies with device
-- android_version | Varies with device

--1
SELECT * FROM analytics 
    WHERE id = 1880;
--2
SELECT id FROM analytics 
    WHERE last_updated = '2018-08-01';
--3
SELECT category, COUNT(*) FROM analytics
    GROUP BY category
--4
SELECT * FROM analytics 
    ORDER BY reviews desc 
    LIMIT 5;
--5
SELECT * FROM analytics
    WHERE rating > 4.8
    ORDER BY reviews desc 
    LIMIT 1;
--6
SELECT category, AVG(rating) AS avg 
    FROM analytics 
    GROUP BY category
    ORDER BY avg desc;
--7
SELECT app_name, price, rating FROM analytics
    WHERE rating < 3
    ORDER BY price desc
    LIMIT 1;
--8
SELECT * FROM analytics
    WHERE rating != 0
    AND min_installs <= 50;
--9
SELECT app_name FROM analytics
    WHERE rating < 3
    AND reviews >= 10000;
--10
SELECT * FROM analytics
    WHERE price
    BETWEEN .10 AND 1.00
    ORDER BY reviews desc
    LIMIT 10;
--11
SELECT * FROM analytics
    ORDER BY last_updated
    LIMIT 1;
--11-01
SELECT * FROM analytics 
  WHERE last_updated = (
    SELECT MIN(last_updated) FROM analytics);
--12
SELECT * FROM analytics
    ORDER BY price desc
    LIMIT 1;
--13
SELECT COUNT(app_name) FROM analytics;
--14
SELECT category, COUNT(*) FROM analytics
    GROUP BY category
    HAVING COUNT(*) > 300;
--15
SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion
    FROM analytics
    WHERE min_installs >= 100000
    ORDER BY proportion desc
    LIMIT 1;