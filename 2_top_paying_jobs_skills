/*
Questions: What skills are required for the top_paying data analyst jobs?
- use the top 10 highest-paying Data Analyst Jobs from first query
- add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
helping jobs seekers understand which skills to develop that align with top salaries
*/

 WITH top_paying_jobs AS
(
          SELECT    jf.job_id,
                    jf.job_title,
                    jf.job_title_short,
                    jf.salary_year_avg,
                    cd.NAME
          FROM      job_postings_fact jf
          LEFT JOIN company_dim cd
          ON        jf.company_id = cd.company_id
          WHERE     job_title_short = 'Data Analyst'
          AND       job_location = 'Anywhere'
          AND       salary_year_avg IS NOT NULL
          ORDER BY  salary_year_avg DESC limit 10 )
SELECT top_paying_jobs.*
           ,
           skills_dim.skills
FROM       top_paying_jobs
INNER JOIN skills_job_dim
ON         top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON         skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY   salary_year_avg DESC; 


/*

High-Paying Data Analyst Jobs & Key Skills 💰📊
🔹 SQL & Python Are Essential for High Salaries – Almost every top-paying role, including AT&T ($255K), 
    Pinterest ($232K), and UCLA Health ($217K), requires SQL and Python, making them critical skills for job seekers.

🔹 Data Visualization & Cloud Skills Add Value – Tableau, Power BI, AWS, and Azure are frequently mentioned 
    in high-paying roles, indicating that data storytelling and cloud expertise can boost earning potential.

🔹 Big Data & Automation Tools Stand Out – Skills like Databricks, PySpark, Snowflake, and Hadoop appear 
    in well-paid positions, showing that handling large datasets and automating workflows can lead to higher salaries.

JSON Code

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "name": "Get It Recruit - Information Technology",
    "skills": "r"
  }
]

*/



