/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skills for data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analust and
helps identify the most financially rewarding skills to acquire or improve
*/

SELECT sd.skills,
       Round(Avg(salary_year_avg), 0) AS avg_salary
FROM   job_postings_fact jf
       INNER JOIN skills_job_dim sjd
               ON jf.job_id = sjd.job_id
       INNER JOIN skills_dim sd
               ON sjd.skill_id = sd.skill_id
WHERE  salary_year_avg IS NOT NULL
       AND job_location IN ( 'Brasil', 'Australia' )
GROUP  BY skills
ORDER  BY avg_salary DESC
LIMIT  25; 


/*

Key Insights: Highest-Paying Skills in the Job Market 💰📊

1️⃣ Top High-Paying Skills 🏆
Analyzing average salaries associated with different skills reveals the most lucrative ones:

🔥 Top Tier (💰💰💰 155,500 BRL/year)

AWS – Cloud computing expertise is in high demand.
Snowflake – A critical tool for cloud data warehousing.
Spark & Hadoop – Big data processing frameworks, crucial for data engineering roles.
💡 Mid-Tier (💰💰 136,000 - 138,000 BRL/year)

Go – A high-performance programming language used in backend and cloud services.
Excel – Still lucrative for business intelligence and financial roles.
Python & R – The go-to languages for data science and machine learning.
📊 Lower-Tier (💰 109,000 - 132,500 BRL/year)

NoSQL & Flow – Important for database management and workflow automation.
Matlab – Often used in engineering and quantitative analysis.
SQL (109,625 BRL) – Despite its high demand, it falls behind in salary compared to Python and AWS.
🚨 Low-Paying Skill (💰 30,000 BRL/year)

Tableau – Despite being a widely used visualization tool, it is associated with lower salaries.
2️⃣ What This Means for Your Career 🚀
Big Data & Cloud skills (AWS, Spark, Hadoop, Snowflake) lead to the highest salaries.
Python & R are still highly valuable, especially for Data Science roles.
SQL remains essential but is not as lucrative as cloud and big data technologies.
Excel still commands good salaries, proving its importance in business and finance.
Tableau alone may not lead to high salaries but can be valuable when combined with other skills.

3️⃣ Next Steps for Career Growth 🎯
Invest in cloud computing (AWS, Snowflake) and big data (Spark, Hadoop) to maximize salary potential.
Enhance Python or R skills for data science and analytics roles.
Combine SQL with NoSQL databases and cloud skills for a better-paying career path.

[
  {
    "skills": "aws",
    "avg_salary": "155500"
  },
  {
    "skills": "snowflake",
    "avg_salary": "155500"
  },
  {
    "skills": "spark",
    "avg_salary": "155500"
  },
  {
    "skills": "hadoop",
    "avg_salary": "155500"
  },
  {
    "skills": "go",
    "avg_salary": "138000"
  },
  {
    "skills": "excel",
    "avg_salary": "138000"
  },
  {
    "skills": "python",
    "avg_salary": "136167"
  },
  {
    "skills": "r",
    "avg_salary": "136167"
  },
  {
    "skills": "nosql",
    "avg_salary": "132500"
  },
  {
    "skills": "flow",
    "avg_salary": "132500"
  },
  {
    "skills": "matlab",
    "avg_salary": "132500"
  },
  {
    "skills": "sql",
    "avg_salary": "109625"
  },
  {
    "skills": "tableau",
    "avg_salary": "30000"
  }
]

*/