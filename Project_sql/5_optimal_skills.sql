/*
Answer: What are the most optimal skills to learn (aka its in high demand and a high-paying skills?)
- identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (High demand) and financial benefits (high salaries),
 offering strategic insights for career development in data analysis
*/

 WITH top_skill AS
(
           SELECT     skills,
                      sd.skill_id,
                      Count(sjd.job_id) AS qtd
           FROM       job_postings_fact jf
           INNER JOIN skills_job_dim sjd
           ON         jf.job_id = sjd.job_id
           INNER JOIN skills_dim sd
           ON         sjd.skill_id = sd.skill_id
           WHERE      job_title_short = 'Data Analyst'
           AND        salary_year_avg IS NOT NULL
           GROUP BY   sd.skill_id ), top_salaries AS
(
           SELECT     sd.skill_id,
                      Round(Avg(salary_year_avg),0) AS avg_salary
           FROM       job_postings_fact jf
           INNER JOIN skills_job_dim sjd
           ON         jf.job_id = sjd.job_id
           INNER JOIN skills_dim sd
           ON         sjd.skill_id = sd.skill_id
           WHERE      job_title_short = 'Data Analyst'
           AND        salary_year_avg IS NOT NULL
           GROUP BY   sd.skill_id )
SELECT top_skill.skill_id
           ,
           top_skill.skills,
           qtd,
           avg_salary
FROM       top_skill
INNER JOIN top_salaries
ON         top_skill.skill_id = top_salaries.skill_id
WHERE      qtd > 10
ORDER BY   avg_salary DESC,
           qtd DESC limit 25; 

-- query para criacao de charts

create table temp_optimal_skills as WITH top_skill AS
(
           SELECT     skills,
                      sd.skill_id,
                      Count(sjd.job_id) AS qtd
           FROM       job_postings_fact jf
           INNER JOIN skills_job_dim sjd
           ON         jf.job_id = sjd.job_id
           INNER JOIN skills_dim sd
           ON         sjd.skill_id = sd.skill_id
           WHERE      job_title_short = 'Data Analyst'
           AND        salary_year_avg IS NOT NULL
           GROUP BY   sd.skill_id ), top_salaries AS
(
           SELECT     sd.skill_id,
                      Round(Avg(salary_year_avg),0) AS avg_salary
           FROM       job_postings_fact jf
           INNER JOIN skills_job_dim sjd
           ON         jf.job_id = sjd.job_id
           INNER JOIN skills_dim sd
           ON         sjd.skill_id = sd.skill_id
           WHERE      job_title_short = 'Data Analyst'
           AND        salary_year_avg IS NOT NULL
           GROUP BY   sd.skill_id )
SELECT top_skill.skill_id
           ,
           top_skill.skills,
           qtd,
           avg_salary
FROM       top_skill
INNER JOIN top_salaries
ON         top_skill.skill_id = top_salaries.skill_id
WHERE      qtd > 10
ORDER BY   avg_salary DESC,
           qtd DESC limit 25; 
/*

1️⃣ Top Skills with the Best Salary & Demand 🚀
🔥 Highest Paying Skills (💰 Avg. Salary Above 120K BRL/Year)

Kafka (129,999 BRL, 40 mentions) – Essential for real-time data streaming.
PyTorch (125,226 BRL, 20 mentions) – A must-have for deep learning and AI.
Perl (124,686 BRL, 20 mentions) – Valuable in scripting, automation, and backend systems.
TensorFlow (120,647 BRL, 24 mentions) – Dominates machine learning and AI development.
📈 High Demand & Strong Salaries (💰 Avg. Salary 110K-120K BRL/Year, High Mentions)

Spark (113,002 BRL, 187 mentions) – One of the most in-demand skills, key for big data processing.
Snowflake (111,578 BRL, 241 mentions) – Leading cloud data warehousing tool, highly valuable.
Hadoop (110,888 BRL, 140 mentions) – Used in big data storage and distributed computing.
Databricks (112,881 BRL, 102 mentions) – A top tool for big data and AI integration.
🔍 Emerging & Specialized Skills (💰 Avg. Salary 110K+ BRL/Year, Moderate Demand)

GCP (113,065 BRL, 78 mentions) – Google's cloud platform is growing in demand.
Pandas (110,767 BRL, 90 mentions) – Essential for data manipulation and analysis in Python.
Git (112,250 BRL, 74 mentions) – Version control expertise is essential for software and data engineers.
MongoDB (113,608 BRL, 26 mentions) – NoSQL database rising in popularity.

2️⃣ What This Means for Career Growth 🎯
✅ If you want high salaries in AI/ML, focus on TensorFlow, PyTorch, and Spark.
✅ Big Data is extremely valuable – Invest in Kafka, Hadoop, Snowflake, and Databricks.
✅ Cloud platforms (AWS, GCP, Snowflake) are key for career growth in data engineering.
✅ Master SQL, Pandas, and MongoDB if you want to excel in data analysis and database management.
✅ Version control (Git) and automation (Perl, Shell, Unix) will enhance your backend and DevOps skills.

3️⃣ Next Steps: Where to Focus 🚀
🔹 Big Data & Cloud: Learn Spark, Snowflake, and Hadoop.
🔹 AI & ML: Gain expertise in TensorFlow, PyTorch, and Pandas.
🔹 Data Engineering: Develop skills in Kafka, Airflow, Databricks, and Git.
🔹 Data Science & Analysis: Master SQL, MongoDB, and Python libraries.

[
  {
    "skill_id": 98,
    "skills": "kafka",
    "qtd": "40",
    "avg_salary": "129999"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "qtd": "20",
    "avg_salary": "125226"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "qtd": "20",
    "avg_salary": "124686"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "qtd": "24",
    "avg_salary": "120647"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "qtd": "11",
    "avg_salary": "118407"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "qtd": "15",
    "avg_salary": "117966"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "qtd": "71",
    "avg_salary": "116387"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "qtd": "59",
    "avg_salary": "115480"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "qtd": "58",
    "avg_salary": "114883"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "qtd": "62",
    "avg_salary": "114153"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "qtd": "49",
    "avg_salary": "114058"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "qtd": "26",
    "avg_salary": "113608"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "qtd": "26",
    "avg_salary": "113608"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "qtd": "78",
    "avg_salary": "113065"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "qtd": "187",
    "avg_salary": "113002"
  },
  {
    "skill_id": 193,
    "skills": "splunk",
    "qtd": "15",
    "avg_salary": "112928"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "qtd": "102",
    "avg_salary": "112881"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "qtd": "74",
    "avg_salary": "112250"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "qtd": "241",
    "avg_salary": "111578"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "qtd": "44",
    "avg_salary": "111496"
  },
  {
    "skill_id": 168,
    "skills": "unix",
    "qtd": "37",
    "avg_salary": "111123"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "qtd": "140",
    "avg_salary": "110888"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "qtd": "90",
    "avg_salary": "110767"
  },
  {
    "skill_id": 137,
    "skills": "phoenix",
    "qtd": "23",
    "avg_salary": "109259"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "qtd": "29",
    "avg_salary": "109052"
  }
]

*/

























