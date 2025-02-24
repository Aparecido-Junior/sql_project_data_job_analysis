/*
Questions: What skills are required for the toop_paying data analyst jobs?
- use the top 10 highest-paying Data Analyst Jobs from first query
- add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
helping jobs seekers understand which skills to develop that align with top salaries
*/

 WITH top_job_location AS
(
          SELECT    job_id,
                    job_title_short,
                    salary_year_avg,
                    cd.NAME AS company_name
          FROM      job_postings_fact jf
          LEFT JOIN company_dim cd
          ON        jf.company_id = cd.company_id
          WHERE     job_location IN ('Australia',
                                     'Brazil')
          AND       salary_year_avg IS NOT NULL
          ORDER BY  salary_year_avg limit 10 )
SELECT     jl.*,
           sd.skills
FROM       top_job_location jl
INNER JOIN skills_job_dim sjd
ON         jl.job_id = sjd.job_id
INNER JOIN skills_dim sd
ON         sjd.skill_id = sd.skill_id
ORDER BY   company_name; 


-- query para criar os charts

create table temp_top_paying_jobs_skills as
 WITH top_job_location AS
(
          SELECT    job_id,
                    job_title_short,
                    salary_year_avg,
                    cd.NAME AS company_name
          FROM      job_postings_fact jf
          LEFT JOIN company_dim cd
          ON        jf.company_id = cd.company_id
          WHERE     job_location IN ('Australia',
                                     'Brazil')
          AND       salary_year_avg IS NOT NULL
          ORDER BY  salary_year_avg limit 10 )
SELECT     jl.*,
           sd.skills
FROM       top_job_location jl
INNER JOIN skills_job_dim sjd
ON         jl.job_id = sjd.job_id
INNER JOIN skills_dim sd
ON         sjd.skill_id = sd.skill_id
ORDER BY   company_name; 

/*

Key Insights: Top Skills for High-Paying Jobs 💰📊

1️⃣ What Defines a High-Paying Job?
The top 25% highest-paying jobs were analyzed to determine the most in-demand skills.
Jobs with salaries above the 75th percentile were considered.

2️⃣ Most In-Demand Skills for High Salaries 🏆
Java – Frequently required for high-paying Data Scientist roles.
Python – Essential for both Data Science and Data Analytics, appearing in multiple high-paying job descriptions.
Scala – Often used for large-scale data processing, crucial for big data engineering.
Shell Scripting – Important for automation and data pipeline optimization.
Redis – A sought-after skill in high-performance computing and real-time analytics.

3️⃣ Key Takeaways 🚀
Programming languages like Java, Python, and Scala are essential for top-paying roles.
Big data and cloud-related technologies (Redis, Shell Scripting) are also valued in high-salary positions.
If you aim for a high-paying Data Science or Engineering role, mastering Java, Python, and Scala should be a priority.

Conclusion 🎯
If you’re targeting Data Science or Engineering roles, CI&T and EBANX offer the best salaries and opportunities.
For Data Analytics roles, focusing on SQL, Python, and Tableau will boost your chances.
Be cautious of low-paying offers, especially for engineering roles at certain companies.
Cloud expertise (AWS, Azure) can provide an edge in both data science and engineering roles.

[
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "java"
  },
  {
    "job_id": 813140,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "64800.0",
    "company_name": "CI&T",
    "skills": "sql"
  },
  {
    "job_id": 813140,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "64800.0",
    "company_name": "CI&T",
    "skills": "gcp"
  },
  {
    "job_id": 955403,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "64800.0",
    "company_name": "CI&T",
    "skills": "sql"
  },
  {
    "job_id": 955403,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "64800.0",
    "company_name": "CI&T",
    "skills": "python"
  },
  {
    "job_id": 955403,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "64800.0",
    "company_name": "CI&T",
    "skills": "azure"
  },
  {
    "job_id": 955403,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "64800.0",
    "company_name": "CI&T",
    "skills": "tableau"
  },
  {
    "job_id": 955403,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "64800.0",
    "company_name": "CI&T",
    "skills": "flow"
  },
  {
    "job_id": 321125,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "72000.0",
    "company_name": "CI&T",
    "skills": "sql"
  },
  {
    "job_id": 321125,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "72000.0",
    "company_name": "CI&T",
    "skills": "sql server"
  },
  {
    "job_id": 321125,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "72000.0",
    "company_name": "CI&T",
    "skills": "azure"
  },
  {
    "job_id": 321125,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "72000.0",
    "company_name": "CI&T",
    "skills": "aws"
  },
  {
    "job_id": 321125,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "72000.0",
    "company_name": "CI&T",
    "skills": "redshift"
  },
  {
    "job_id": 321125,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "72000.0",
    "company_name": "CI&T",
    "skills": "oracle"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "python"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "scala"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "shell"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "redis"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "aws"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "redshift"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "spark"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "kafka"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "node"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "tableau"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "splunk"
  },
  {
    "job_id": 6440,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "79200.0",
    "company_name": "CI&T",
    "skills": "terraform"
  },
  {
    "job_id": 164753,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "63000.0",
    "company_name": "EBANX",
    "skills": "sql"
  },
  {
    "job_id": 164753,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "63000.0",
    "company_name": "EBANX",
    "skills": "python"
  },
  {
    "job_id": 164753,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "63000.0",
    "company_name": "EBANX",
    "skills": "tableau"
  },
  {
    "job_id": 164753,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "63000.0",
    "company_name": "EBANX",
    "skills": "qlik"
  },
  {
    "job_id": 164753,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "63000.0",
    "company_name": "EBANX",
    "skills": "looker"
  },
  {
    "job_id": 703904,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "79200.0",
    "company_name": "Gympass",
    "skills": "tableau"
  },
  {
    "job_id": 703904,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "79200.0",
    "company_name": "Gympass",
    "skills": "sql"
  },
  {
    "job_id": 1797400,
    "job_title_short": "Senior Data Analyst",
    "salary_year_avg": "30000.0",
    "company_name": "Humanity",
    "skills": "tableau"
  },
  {
    "job_id": 1797400,
    "job_title_short": "Senior Data Analyst",
    "salary_year_avg": "30000.0",
    "company_name": "Humanity",
    "skills": "sql"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "linux"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "git"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "python"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "java"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "oracle"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "aws"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "spark"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "airflow"
  },
  {
    "job_id": 635745,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "15000.0",
    "company_name": "Net2Source Inc.",
    "skills": "hadoop"
  },
  {
    "job_id": 1146822,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "75067.5",
    "company_name": "NOS SGPS",
    "skills": "sas"
  },
  {
    "job_id": 1146822,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "75067.5",
    "company_name": "NOS SGPS",
    "skills": "mysql"
  },
  {
    "job_id": 1146822,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "75067.5",
    "company_name": "NOS SGPS",
    "skills": "oracle"
  },
  {
    "job_id": 1146822,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "75067.5",
    "company_name": "NOS SGPS",
    "skills": "power bi"
  },
  {
    "job_id": 1146822,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "75067.5",
    "company_name": "NOS SGPS",
    "skills": "sas"
  },
  {
    "job_id": 1033517,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "50400.0",
    "company_name": "Turner & Townsend",
    "skills": "vba"
  },
  {
    "job_id": 1033517,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "50400.0",
    "company_name": "Turner & Townsend",
    "skills": "sql"
  },
  {
    "job_id": 1033517,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "50400.0",
    "company_name": "Turner & Townsend",
    "skills": "oracle"
  },
  {
    "job_id": 1033517,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "50400.0",
    "company_name": "Turner & Townsend",
    "skills": "power bi"
  },
  {
    "job_id": 1033517,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "50400.0",
    "company_name": "Turner & Townsend",
    "skills": "excel"
  }
]