/*
Questions: What skills are required for the toop_paying data analyst jobs?
- use the top 10 highest-paying Data Analyst Jobs from first query
- add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
helping jobs seekers understand which skills to develop that align with top salaries
*/

with top_job_location AS(
SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    cd.name as company_name
from job_postings_fact jf
left join company_dim cd on jf.company_id = cd.company_id
where job_location in ('Australia','Brazil','Anywhere') AND
salary_year_avg is not null AND
job_title_short = 'Data Analyst'
order by salary_year_avg
limit 10
)

select 
    jl.*,
    sd.skills
from top_job_location jl
inner join skills_job_dim skd on jl.job_id = skd.job_id
inner join skills_dim sd on skd.skill_id = sd.skill_id
order by company_name;

select * from skills_dim limit 10;

/*
Key Insights on Data Analyst Skills (2023)
SQL & Excel are Essential – Both appear most frequently in job postings, highlighting their importance for data manipulation and analysis.
Programming is Valued but Less Common – Python and R are mentioned but less frequently than SQL and Excel.
SAS Still Has Demand – Some industries continue to use SAS, though open-source tools are more popular.
🔹 Takeaway: Prioritize SQL & Excel, then enhance with Python or R for a competitive edge. Let me know if you need deeper insights!

[
  {
    "job_id": 512966,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "41000.0",
    "company_name": "BayOne Solutions",
    "skills": "sql"
  },
  {
    "job_id": 512966,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "41000.0",
    "company_name": "BayOne Solutions",
    "skills": "tableau"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "excel"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "sql"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "sas"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "sharepoint"
  },
  {
    "job_id": 994565,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "39000.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "excel"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "oracle"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "46500.0",
    "company_name": "Get It Recruit - Administrative",
    "skills": "sas"
  },
  {
    "job_id": 1349849,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "36000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 1349849,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "36000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "sql"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "python"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "r"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "spark"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "hadoop"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "35000.0",
    "company_name": "Jobmatchingpartner Ltd",
    "skills": "looker"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "flow"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "excel"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "power bi"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "powerpoint"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "sql"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "python"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "r"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "c++"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "c"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "47500.0",
    "company_name": "Men's Health Clinic (MHC)",
    "skills": "aws"
  },
  {
    "job_id": 473213,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "42500.0",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "skills": "excel"
  },
  {
    "job_id": 473213,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "42500.0",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "skills": "windows"
  },
  {
    "job_id": 473213,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "42500.0",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "skills": "wire"
  }
]

*/

















