/*
Questions: What are the most in-demand skills for data analyst?
- Join job posting to inner join table similar to query 2
- Identify the top 5 in_demand skills for a data analyst.
- Focus on all job posting
-Why? Retrives the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/

select
    sd.skills,
    count(sjd.job_id) as qtd
from job_postings_fact jf
inner join skills_job_dim sjd on jf.job_id = sjd.job_id
inner join skills_dim sd on sjd.skill_id = sd.skill_id
where job_location in ('Australia','Brasil')
group by skills
ORDER BY qtd DESC
limit 5;