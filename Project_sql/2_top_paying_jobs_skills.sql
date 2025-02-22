/*
Questions: What skills are required for the toop_paying data analyst jobs?
- use the top 10 highest-paying Data Analyst Jobs from first query
- add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
helping jobs seekers understand which skills to develop that align with top salaries
*/

with top_job_location AS
(
  SELECT
      job_id,
      job_title_short,
      salary_year_avg,
      cd.name as company_name
  from job_postings_fact jf
  left join company_dim cd on jf.company_id = cd.company_id
  where job_location in ('Australia','Brazil') AND
  salary_year_avg is not null
  order by salary_year_avg
  limit 10
)
select 
    jl.*,
    sd.skills
from top_job_location jl
inner join skills_job_dim sjd on jl.job_id = sjd.job_id
inner join skills_dim sd on sjd.skill_id = sd.skill_id
order by company_name;

select * from skills_dim limit 10;

/*
tes
*/

















