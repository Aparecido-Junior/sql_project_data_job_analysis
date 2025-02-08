--case expressions

select 
    count(job_id) as numb_of_jobs,
    CASE
        when job_location = 'Anywhere' then 'Remote'
        when Job_Location = 'New York, NY' then 'Local'
        else 'On site'
    end as location_category
from job_postings_fact
where job_title_short = 'Data Analyst'
group by location_category
order by numb_of_jobs desc
limit 100;

-- put salary into different buckets
-- Define whats a high, standard or low salary with our own conditions
-- Why? It is easy to determine which job posting are with looking at based on salary bucketing is a common practice in data analysis when viewing categories
-- I only want from highest to lowest