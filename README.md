# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics in two countries, Australia and Brasil. 
    
     
# Background
Driven by a quest to navigate the data scenario job market more effectively , this project was born from a desire to pinpoint top-paid 💰 and in-demand skills 📊, streamlining others' work to find optimal jobs 🎯.


## The questions I wanted to answer through my SQL queries were:
1. What are the top-paying jobs?
2. What are the skills required for these top-paying roles?
3. What are the most in-demand for data roles?
4. What are the top skills based on salary?
5. What are the most optimal skills to learn?

# Tools I used
For my deep dieve into the data analyst job market, I harnessed the power of several key tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code**: My go-to for database management and executing SQl queries.
- **Git & Github**: Essetial for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market📊. Here's how I approached each question 🔍:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high-paying opportunities in Australia and Brasil .

```sql
SELECT job_id,
       job_title_short,
       job_location,
       job_schedule_type,
       salary_year_avg,
       job_posted_date,
       cd.name AS company_name
FROM   job_postings_fact jf
       LEFT JOIN company_dim cd
              ON jf.company_id = cd.company_id
WHERE  job_location IN ( 'Australia', 'Brazil' )
       AND salary_year_avg IS NOT NULL
ORDER  BY salary_year_avg DESC
LIMIT  10; 
```
![image alt](https://github.com/Aparecido-Junior/sql_project_data_job_analysis/blob/195d2801f7c80bfdfec8e0462054f9a03518ca70/1.%20Top%20Paying%20Data%20Analyst%20Jobs.png)
_Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results_

### Key Insights from the Job Data 📊

- Mantys Offers the Highest-Paying Role ($650K) – This Data Analyst position significantly exceeds typical salaries, suggesting a specialized or high-impact role.

- Director & Senior Roles Pay Premium Salaries – Meta ($336K) and AT&T ($255K) highlight how leadership and advanced analytics expertise lead to higher earnings.

- Competitive Salaries Across Industries – Companies like Pinterest ($232K), UCLA Health ($217K), and SmartAsset ($205K) show that tech, healthcare, and finance offer strong compensation for data roles.

### 2. skills required for the top-paying roles

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
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
```
![image alt](https://github.com/Aparecido-Junior/sql_project_data_job_analysis/blob/473b267a2e2c31b03d1f636cc44179e61123f559/2.%20skills%20required%20for%20the%20top-paying%20roles.png)
_Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results_

Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023:

### Key Insights: Top Skills for High-Paying Jobs 💰📊

- SQL & Python Are Essential for High Salaries – Almost every top-paying role, including AT&T ($255K), Pinterest ($232K), and UCLA Health ($217K), requires SQL and Python, making them critical skills for job seekers.

- Data Visualization & Cloud Skills Add Value – Tableau, Power BI, AWS, and Azure are frequently mentioned in high-paying roles, indicating that data storytelling and cloud expertise can boost earning potential.

- Big Data & Automation Tools Stand Out – Skills like Databricks, PySpark, Snowflake, and Hadoop appear in well-paid positions, showing that handling large datasets and automating workflows can lead to higher salaries.

### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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
```
![In-Demand Skills for Data Analysts](https://github.com/Aparecido-Junior/sql_project_data_job_analysis/blob/83a1570e7393eed0ae5a299e58f88a464b4f6310/3.%20In-Demand%20Skills%20for%20Data%20Analysts.png)

_Table of the demand for the top 5 skills in data analyst job postings_


### Key Insights: Most In-Demand Skills in Job Postings 📊🔥

- SQL Leads the Market in Demand – With 92,628 job postings, SQL remains the most essential skill for data professionals, making it a must-learn for job seekers.

- Excel & Python Are Key Competitors – Excel (67,031) and Python (57,326) follow closely, proving that both traditional spreadsheet skills and programming knowledge are highly valuable.

- Data Visualization is Critical – Tableau (46,554) and Power BI (39,468) highlight the need for strong data storytelling and dashboard creation, making isualization tools crucial for career growth.

### 4. Skills Based on Salary

Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
select
    sd.skills,
    round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact jf
inner join skills_job_dim sjd on jf.job_id = sjd.job_id
inner join skills_dim sd on sjd.skill_id = sd.skill_id
where 
  salary_year_avg is not null 
  and job_location in ('Brasil','Australia')
group by 
  skills
ORDER BY 
  avg_salary DESC
limit 25;
```
![Skills Based on Salary](https://github.com/Aparecido-Junior/sql_project_data_job_analysis/blob/62d3fb9af98ae8b2e194bf52650ca9b9f7816e4c/4.%20Skills%20Based%20on%20Salary.png)

_Table of the average salary for the top 10 paying skills for data analysts_

### Key Insights: Highest-Paying Skills in the Job Market 💰📊

- Highest-Paying Skills: SVN ($400K), Solidity ($179K), and Couchbase ($160K) lead in salary, indicating their strong demand and niche value.

- Data & AI Tools Boost Earnings: DataRobot, MXNet, TensorFlow, PyTorch, and Keras command high salaries, showing that machine learning and AI expertise pay well.

- Cloud & DevOps Skills Are Lucrative: Terraform, VMware, Kafka, and Ansible demonstrate that cloud infrastructure and automation skills significantly impact salary levels for Data Analysts.

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
           WHERE      salary_year_avg IS NOT NULL
           GROUP BY   sd.skill_id ), top_salaries AS
(
           SELECT     sd.skill_id,
                      Round(Avg(salary_year_avg),0) AS avg_salary
           FROM       job_postings_fact jf
           INNER JOIN skills_job_dim sjd
           ON         jf.job_id = sjd.job_id
           INNER JOIN skills_dim sd
           ON         sjd.skill_id = sd.skill_id
           WHERE      salary_year_avg IS NOT NULL
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
```
### 1️⃣ Top Skills with the Best Salary & Demand 🚀

Strategic Skills for Job Security & High Salaries in Data Analysis 💰📊
- Snowflake & Spark Lead in Demand – Snowflake (241 postings, $111K) and Spark 
(187 postings, $113K) show strong demand, making cloud-based and big data tools essential for career stability.

- High-Paying Niche Skills Exist – Kafka ($129K), PyTorch ($125K), and TensorFlow 
($120K) offer high salaries but have lower demand, suggesting specialized expertise can yield financial benefits.

- Cloud & Big Data Are Key Growth Areas – Databricks (102 postings, $112K), Hadoop 
(140 postings, $110K), and GCP (78 postings, $113K) highlight the importance of cloud 
platforms and scalable data processing for career advancement.

# Conclusions

### Insights

From the analysis, several general insights emerged:

1. Top-Paying Data Analyst Jobs: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!

2. Skills for Top-Paying Jobs: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.

3. Most In-Demand Skills: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.

4. Skills with Higher Salaries: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.

5. Optimal Skills for Job Market Value: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.
