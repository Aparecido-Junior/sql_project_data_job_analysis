# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics in two countries, Australia and Brasil. 

SQL queries? Check them out here: [Project_sq folder](https://github.com/Aparecido-Junior/sql_project_data_job_analysis) 
    
     
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
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high-paying opportunities in the field .

```sql
SELECT
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    cd.name as company_name
from job_postings_fact jf
left join company_dim cd on jf.company_id = cd.company_id
where job_location in ('Australia','Brazil') 
AND salary_year_avg is not null 
order by salary_year_avg
limit 10;
```
Here's the breakdown of the top data analyst jobs in 2023 In Australia and Brasil in 2023:

**Job Roles:** 
Positions include Data Engineer, Senior Data Analyst, Data Analyst, and Data Scientist.

**Companies::** 
Several postings come from recurring companies like CI&T, along with others such as Net2Source Inc., Humanity, Turner & Townsend, EBANX, NOS SGPS, and Gympass.

**Posting Dates:** 
Job listings were posted between March and December 2023.

### 2. skills required for the top-paying roles

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
with top_job_location AS
(
  SELECT
      job_id,
      job_title_short,
      salary_year_avg,
      cd.name as company_name
  from job_postings_fact jf
  left join company_dim cd on jf.company_id = cd.company_id
  where job_location in ('Australia','Brazil') AND
  salary_year_avg is not null
  order by salary_year_avg
  limit 10
)
select 
    jl.*,
    sd.skills
from top_job_location jl
inner join skills_job_dim sjd on jl.job_id = sjd.job_id
inner join skills_dim sd on sjd.skill_id = sd.skill_id
order by company_name;
```
Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023:

**SQL:**
SQL (Structured Query Language) is foundational for querying and managing relational databases. It's critical for extracting, transforming, and analyzing data—a core responsibility for Data Analysts, Data Engineers, and Data Scientists. Its high frequency in the dataset underscores its universal demand in data-related roles.

**Tableau:**
Tableau is a leading data visualization tool that enables professionals to convert raw data into interactive dashboards and reports. It supports clear, data-driven decision-making by presenting insights in an accessible visual format. The repeated requirement for Tableau highlights its significance in business intelligence and data storytelling.

**Python:**
Python is celebrated for its versatility in data science and analytics. With extensive libraries such as pandas, NumPy, and scikit-learn, Python simplifies tasks ranging from data manipulation to predictive modeling. Its robust ecosystem and ease of use make it a staple skill for modern data professionals.

**Oracle:**
Oracle is a widely deployed database management system known for handling large-scale, enterprise-level data efficiently. Familiarity with Oracle databases is essential for roles that require managing and maintaining complex data infrastructures, reflecting its continued relevance in many organizations.

**AWS (Amazon Web Services):**
AWS is a comprehensive cloud computing platform offering services for data storage, processing, and analytics. Its scalable and flexible infrastructure is particularly valuable for Data Engineers and Data Scientists dealing with big data and machine learning workflows. Proficiency in AWS indicates a strong capability in deploying and managing cloud-based data solutions.

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
Here's the breakdown of the most demanded skills for data analysts in 2023

**SQL:** Stands out as the most in-demand skill, essential for robust database querying and data management.

**Python:** Highly valued for its versatility in data manipulation and analysis, making it a close second.

**Excel:** Continues to be a go-to tool for quick data analysis and spreadsheet management.

**Power BI:** Plays a key role in transforming data into actionable insights through visualizations.

**AWS:** Represents the growing importance of cloud computing in handling and processing data.

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
Here's a breakdown of the results for top paying skills for Data Analysts:

**Summary:** The dataset lists 13 skills with their respective average salaries. At the high end, skills related to cloud computing and big data—AWS, Snowflake, Spark, and Hadoop—command the highest salaries. Mid-range salaries are seen with skills such as Go, Excel, Python, R, NoSQL, Flow, and MATLAB. SQL, while fundamental, sits at a lower salary tier, and Tableau has a significantly lower average salary compared to the others.

:**Cloud & Big Data Premium::**
AWS, Snowflake, Spark, and Hadoop top the salary chart. This underscores a strong market demand for cloud and big data expertise, reflecting the premium placed on scalable data architectures and distributed processing skills.

:**Advanced Programming & Analysis Valuation::**
Python and R offer competitive compensation, reinforcing the value placed on robust programming and data analysis capabilities in modern data roles.

:**Divergent Salary Tiers:**
There is a noticeable gap between the highest-paid technical skills and more foundational ones like SQL and Tableau. This suggests that while basic data querying and visualization remain essential, specialized, cutting-edge skills are rewarded with significantly higher salaries.

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

Here's a breakdown of the most optimal skills for Data Analysts in 2023:





