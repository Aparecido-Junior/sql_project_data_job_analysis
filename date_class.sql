SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date at time zone 'utc' at time zone 'EST' as date_time,
    EXTRACT(MONTH FROM job_posted_date) AS MONTH_DATE,
    EXTRACT(YEAR FROM job_posted_date) AS MONTH_DATE
FROM
    job_postings_fact
    LIMIT 5;


SELECT 
    COUNT(job_id) AS QTD,
    EXTRACT(MONTH FROM job_posted_date) AS MONTH
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY MONTH
ORDER BY QTD DESC;

-- Write a query to find the average salary both yearly and hourly for job posting that were posted after june 1, 2023. Group by job schedule type.
select
    job_schedule_type,
    salary_year_avg,
    salary_hour_avg,
    job_posted_date
from job_postings_fact
where job_posted_date > '2023-07-01'
GROUP BY job_schedule_type,salary_year_avg, salary_hour_avg,  job_posted_date
limit 1000;

-- Write a query to count the number of job posting for each month in 2023, adjusting the job_posted_date 
-- to be in 'America new York' time zone before extracting the month. Assume the job_posted_date is stored in UTC. Group by and order by the month.
select
    count(job_id) as qtd,
    extract(month from job_posted_date at time zone 'utc' at time zone 'EST') as month
from job_postings_fact
where job_posted_date > '2022-12-31'
GROUP BY MONTH
order by MONTH;


--Write a query to find companies (include company name) that have posted jobs offering health insurence, 
-- where these posting were made in the second quarter of 2023. Use data extraction to filter by quarter.
select
 cd.name,
 jf.job_health_insurance,
 EXTRACT(MONTH from jf.job_posted_date) as job_posted_month
from job_postings_fact jf
join company_dim cd on jf.company_id = cd.company_id
where jf.job_health_insurance = 'true' and EXTRACT(MONTH from jf.job_posted_date) >= '7'
order by job_posted_month;

-- January
CREATE TABLE january_jobs AS 
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS 
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS 
SELECT * 
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;






