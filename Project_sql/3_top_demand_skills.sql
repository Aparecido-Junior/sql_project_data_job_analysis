/*
Questions: What are the most in-demand skills for data analyst?
- Join job posting to inner join table similar to query 2
- Identify the top 5 in_demand skills for a data analyst.
- Focus on all job posting
-Why? Retrives the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/

SELECT sd.skills,
       Count(sjd.job_id) AS qtd
FROM   job_postings_fact jf
       INNER JOIN skills_job_dim sjd
               ON jf.job_id = sjd.job_id
       INNER JOIN skills_dim sd
               ON sjd.skill_id = sd.skill_id
WHERE  job_location IN ( 'Australia', 'Brasil' )
GROUP  BY skills
ORDER  BY qtd DESC
LIMIT  5;  


-- query para os charts
create table temp_demand_skills as
SELECT sd.skills,
       Count(sjd.job_id) AS qtd
FROM   job_postings_fact jf
       INNER JOIN skills_job_dim sjd
               ON jf.job_id = sjd.job_id
       INNER JOIN skills_dim sd
               ON sjd.skill_id = sd.skill_id
WHERE  job_location IN ( 'Australia', 'Brasil' )
GROUP  BY skills
ORDER  BY qtd DESC
LIMIT  5; 

/*

Key Insights: Most In-Demand Skills in Job Postings 📊🔥

1️⃣ Top 5 Most Requested Skills 🏆
Based on job postings, these are the most frequently required skills:

SQL (1,679 mentions) – The most in-demand skill, essential for data querying and database management.
Python (1,264 mentions) – Widely used in data analysis, machine learning, and automation.
Excel (733 mentions) – Still highly relevant, particularly for business intelligence and reporting.
Power BI (680 mentions) – A key tool for data visualization and business analytics.
AWS (612 mentions) – Shows the increasing importance of cloud computing in data roles.

2️⃣ What This Means for Your Career 🚀
SQL and Python are fundamental skills for almost all data-related positions.
Excel remains crucial, especially for roles involving financial and operational data.
Power BI is a must-have if you’re working in data visualization and business intelligence.
Cloud skills (AWS) are becoming increasingly valuable, indicating that employers seek professionals who can work with scalable data solutions.

3️⃣ Next Steps for Career Growth 🎯
Prioritize SQL and Python – These skills open doors to data analysis, engineering, and science roles.
Enhance data visualization expertise by learning Power BI or alternatives like Tableau.
Develop cloud computing skills (AWS, Azure, or Google Cloud) to stay ahead in the industry.
Would you like recommendations on courses or resources to improve these skills? 😊

[
  {
    "skills": "sql",
    "qtd": "1679"
  },
  {
    "skills": "python",
    "qtd": "1264"
  },
  {
    "skills": "excel",
    "qtd": "733"
  },
  {
    "skills": "power bi",
    "qtd": "680"
  },
  {
    "skills": "aws",
    "qtd": "612"
  }
]

*/