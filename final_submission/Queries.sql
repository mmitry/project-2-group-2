--1. Total backers count group by campaign success, failure, cancelled or ongoing one!
SELECT 
    outcome,
    SUM(backers_count) AS total_backers
FROM 
    campaign
GROUP BY 
    outcome;


--2. Most category per backers count 
SELECT c.category,
       SUM(cd.backers_count) AS total_backers
FROM campaign cd
JOIN category c
  ON cd.category_id = c.category_id
GROUP BY c.category
ORDER BY total_backers DESC;

--3. Succesful campaigns based on Countries
SELECT
    co.country,
    COUNT(*) AS successful_campaigns
FROM
    campaign co
WHERE
    outcome = 'successful'
GROUP BY
    co.country
ORDER BY
    successful_campaigns DESC;

--4.Earliest Launch Date per Category
SELECT
    category,
    MIN(launch_date) AS earliest_launch_date
FROM
    campaign
GROUP BY
    category
ORDER BY
    earliest_launch_date ASC;

--5Total pledged amount per subcategory
SELECT
    subcategory,
    SUM(pledged) AS total_pledged
FROM
    campaign
GROUP BY
    subcategory
ORDER BY
    total_pledged DESC;

--6.Subcategory based on successful campaign
SELECT co.subcategory, 
	COUNT(co.cf_id) AS successful_campaigns
FROM campaign co 
	WHERE co.outcome = 'successful'
GROUP BY co.subcategory 
ORDER BY successful_campaigns DESC;









	