/*
Questions: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job posting with specified salaries (Remove nulls).
- Why? Highlight the top-paying opportunities for Data Analyst, offering insights into 
*/


SELECT
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    cd.name as company_name
from job_postings_fact jf
left join company_dim cd on jf.company_id = cd.company_id
where job_location in ('Australia','Brazil','Anywhere') AND
salary_year_avg is not null AND
job_title_short = 'Data Analyst'
order by salary_year_avg;


SELECT job_location
from job_postings_fact
limit 500;