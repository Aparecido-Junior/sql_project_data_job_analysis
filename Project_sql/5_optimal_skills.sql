/*
Answer: What are the most optimal skills to learn (aka its in high demand and a high-paying skills?)
- identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (High demand) and financial benefits (high salaries),
 offering strategic insights for career development in data analysis
*/

with top_skill as(
    select
        skills,
        sd.skill_id,
        count(sjd.job_id) as qtd
    from job_postings_fact jf
    inner join skills_job_dim sjd on jf.job_id = sjd.job_id
    inner join skills_dim sd on sjd.skill_id = sd.skill_id
    where job_title_short = 'Data Analyst' AND
    salary_year_avg is not null
    group by sd.skill_id
), top_salaries as(
    select
        sd.skill_id,
        round(avg(salary_year_avg),0) as avg_salary
    from job_postings_fact jf
    inner join skills_job_dim sjd on jf.job_id = sjd.job_id
    inner join skills_dim sd on sjd.skill_id = sd.skill_id
    where job_title_short = 'Data Analyst' AND
    salary_year_avg is not null
    group by sd.skill_id
)

SELECT
    top_skill.skill_id,
    top_skill.skills,
    qtd,
    avg_salary
from top_skill
inner join top_salaries on top_skill.skill_id = top_salaries.skill_id
where qtd > 10
order by
avg_salary desc,
qtd DESC
limit 25;



-- make it more concisely

























