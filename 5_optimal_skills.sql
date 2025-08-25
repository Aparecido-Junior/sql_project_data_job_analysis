/*
Answer: What are the most optimal skills to learn (aka its in high demand and a high-paying skills?)
- identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (High demand) and financial benefits (high salaries),
 offering strategic insights for career development in data analysis
*/

SELECT skills,
       Count(skills)                  AS demand,
       Round(Avg(salary_year_avg), 0) AS avg_salary
FROM   job_postings_fact
       INNER JOIN skills_job_dim
               ON job_postings_fact.job_id = skills_job_dim.job_id
       INNER JOIN skills_dim
               ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE  job_title_short = 'Data Analyst'
       AND salary_year_avg IS NOT NULL
GROUP  BY skills
HAVING Count(skills) > 10
ORDER  BY avg_salary DESC,
          demand DESC
LIMIT  25; 


/*

Strategic Skills for Job Security & High Salaries in Data Analysis 💰📊
🔹 Snowflake & Spark Lead in Demand – Snowflake (241 postings, $111K) and Spark 
(187 postings, $113K) show strong demand, making cloud-based and big data tools essential for career stability.

🔹 High-Paying Niche Skills Exist – Kafka ($129K), PyTorch ($125K), and TensorFlow 
($120K) offer high salaries but have lower demand, suggesting specialized expertise can yield financial benefits.

🔹 Cloud & Big Data Are Key Growth Areas – Databricks (102 postings, $112K), Hadoop 
(140 postings, $110K), and GCP (78 postings, $113K) highlight the importance of cloud 
platforms and scalable data processing for career advancement.

[
  {
    "skills": "kafka",
    "demand": "40",
    "avg_salary": "129999"
  },
  {
    "skills": "pytorch",
    "demand": "20",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "demand": "20",
    "avg_salary": "124686"
  },
  {
    "skills": "tensorflow",
    "demand": "24",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "demand": "11",
    "avg_salary": "118407"
  },
  {
    "skills": "atlassian",
    "demand": "15",
    "avg_salary": "117966"
  },
  {
    "skills": "airflow",
    "demand": "71",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "demand": "59",
    "avg_salary": "115480"
  },
  {
    "skills": "linux",
    "demand": "58",
    "avg_salary": "114883"
  },
  {
    "skills": "confluence",
    "demand": "62",
    "avg_salary": "114153"
  },
  {
    "skills": "pyspark",
    "demand": "49",
    "avg_salary": "114058"
  },
  {
    "skills": "mongodb",
    "demand": "52",
    "avg_salary": "113608"
  },
  {
    "skills": "gcp",
    "demand": "78",
    "avg_salary": "113065"
  },
  {
    "skills": "spark",
    "demand": "187",
    "avg_salary": "113002"
  },
  {
    "skills": "splunk",
    "demand": "15",
    "avg_salary": "112928"
  },
  {
    "skills": "databricks",
    "demand": "102",
    "avg_salary": "112881"
  },
  {
    "skills": "git",
    "demand": "74",
    "avg_salary": "112250"
  },
  {
    "skills": "snowflake",
    "demand": "241",
    "avg_salary": "111578"
  },
  {
    "skills": "shell",
    "demand": "44",
    "avg_salary": "111496"
  },
  {
    "skills": "unix",
    "demand": "37",
    "avg_salary": "111123"
  },
  {
    "skills": "hadoop",
    "demand": "140",
    "avg_salary": "110888"
  },
  {
    "skills": "pandas",
    "demand": "90",
    "avg_salary": "110767"
  },
  {
    "skills": "phoenix",
    "demand": "23",
    "avg_salary": "109259"
  },
  {
    "skills": "php",
    "demand": "29",
    "avg_salary": "109052"
  },
  {
    "skills": "neo4j",
    "demand": "12",
    "avg_salary": "108646"
  }
]

*/