/*
Find the companies that have the most job openings.
- Get the total number of job posting per company id
- Return the total number of jobs with the company name
*/
select 
    jf.company_id,
    cd.name,
    count(*) as job_posted_qtd
from job_postings_fact as jf
join company_dim as cd on jf.company_id = cd.company_id
GROUP BY jf.company_id, cd.name
order by job_posted_qtd desc;

with job_posted as
(
select 
    company_id,
    count(*) as job_posted_qtd
from job_postings_fact
group by company_id
)

select 
    jp.company_id,
    cd.name,
    jp.job_posted_qtd 
from job_posted jp
join company_dim cd on jp.company_id = cd.company_id
order by jp.job_posted_qtd DESC;


/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
- Include skill ID, Name and count of posting requing the skill
*/
SELECT * from job_postings_fact limit 10;
select * from skills_job_dim limit 10;
select * from skills_dim limit 10;

with skill_count as
(
select
    sd.skill_id,
    count(*) as qtd,
    jf.job_title_short, 
    jf.job_work_from_home
from skills_job_dim sd
join job_postings_fact jf on sd.job_id = jf.job_id
where jf.job_work_from_home = 'true' and 
jf.job_title_short = 'Data Analyst' 
GROUP BY sd.skill_id, jf.job_title_short, jf.job_work_from_home
limit 100
)

SELECT
    sc.skill_id,
    sc.qtd,
    sk.skills,
    sc.job_title_short, 
    sc.job_work_from_home
from skill_count sc
join skills_dim sk on sc.skill_id = sk.skill_id
order by qtd desc
limit 5;























