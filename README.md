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
![Top Paying Roles](https://github.com/Aparecido-Junior/sql_project_data_job_analysis/blob/5dce5ea1dc255c72b70d0a9836480af2ad24c0d2/1.jpg)

### Key Insights from the Job Data 📊
**1️⃣ Job Distribution by Location**

- Brazil dominates the job market with 7 out of 10 job postings.
- Australia has fewer postings (3), but they are from top companies like Commonwealth Bank and DoorDash.

**2️⃣ Job Role Breakdown**

- The most common roles are Senior Data Engineers (3) and Senior Data Scientists (2).
- Other roles include Data Engineers (2), Senior Data Analysts (2), and Data Scientists (1).
- CI&T is the most active employer, listing 5 out of 10 job postings.

**3️⃣ Salary Insights 💰**

- The highest-paying role is Senior Data Scientist in Brazil at 171,121 BRL/year.
- Senior Data Analysts earn an average of 165,000 BRL/year.
- Senior Data Engineers earn slightly less, averaging 152,833 BRL/year.
- Data Engineers (mid-level roles) have a lower average salary of 151,500 BRL/year.
- Australia vs. Brazil: While Australia's salaries are competitive, Brazil has more high-paying senior roles.

**4️⃣ Market Trends & Recommendations 🚀**

- Companies are prioritizing senior roles. If you aim for a high-paying job, gaining expertise in data science, engineering, and analytics is crucial.
- CI&T dominates hiring in Brazil. If you’re targeting jobs in Brazil, CI&T is a key employer to watch.
- Data Engineers have steady demand. This role appears twice and is a solid choice for career growth.
- Australia offers part-time flexibility. Unlike Brazil, where all jobs are full-time, Commonwealth Bank lists a part-time option.

**Conclusion 🎯**
- If your goal is to work in Brazil, focus on CI&T and senior-level positions.
- If you're aiming for Australia, Data Engineering and Data Science roles are your best bet.
- Keep building your skills in data analytics, Python, and SQL to align with market trends.

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
Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023:

### Key Insights: Top Skills for High-Paying Jobs 💰📊

**1️⃣ What Defines a High-Paying Job?**

- The top 25% highest-paying jobs were analyzed to determine the most in-demand skills.
- Jobs with salaries above the 75th percentile were considered.

**2️⃣ Most In-Demand Skills for High Salaries 🏆**

- Java – Frequently required for high-paying Data Scientist roles.
- Python – Essential for both Data Science and Data Analytics, appearing in multiple high-paying job descriptions.
- Scala – Often used for large-scale data processing, crucial for big data engineering.
- Shell Scripting – Important for automation and data pipeline optimization.
- Redis – A sought-after skill in high-performance computing and real-time analytics.

**3️⃣ Key Takeaways 🚀**

- Programming languages like Java, Python, and Scala are essential for top-paying roles.
- Big data and cloud-related technologies (Redis, Shell Scripting) are also valued in high-salary positions.
- If you aim for a high-paying Data Science or Engineering role, mastering Java, Python, and Scala should be a priority.

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
![In-Demand Skills for Data Analysts](https://github.com/Aparecido-Junior/sql_project_data_job_analysis/blob/cac7292aefceabb13c7c3208626a5dafdf449aeb/3.jpg)
### Key Insights: Most In-Demand Skills in Job Postings 📊🔥

**1️⃣ Top 5 Most Requested Skills 🏆**
Based on job postings, these are the most frequently required skills:

- SQL (1,679 mentions) – The most in-demand skill, essential for data querying and database management.
- Python (1,264 mentions) – Widely used in data analysis, machine learning, and automation.
- Excel (733 mentions) – Still highly relevant, particularly for business intelligence and reporting.
- Power BI (680 mentions) – A key tool for data visualization and business analytics.
- AWS (612 mentions) – Shows the increasing importance of cloud computing in data roles.

**2️⃣ What This Means for Your Career 🚀**
- SQL and Python are fundamental skills for almost all data-related positions.
- Excel remains crucial, especially for roles involving financial and operational data.
- Power BI is a must-have if you’re working in data visualization and business intelligence.
- Cloud skills (AWS) are becoming increasingly valuable, indicating that employers seek professionals who can work with scalable data solutions.

**3️⃣ Next Steps for Career Growth 🎯**
- Prioritize SQL and Python – These skills open doors to data analysis, engineering, and science roles.
- Enhance data visualization expertise by learning Power BI or alternatives like Tableau.
- Develop cloud computing skills (AWS, Azure, or Google Cloud) to stay ahead in the industry.
- Would you like recommendations on courses or resources to improve these skills? 😊

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
![Skills Based on Salary](https://github.com/Aparecido-Junior/sql_project_data_job_analysis/blob/92c43e9cd84bb244972e6fc997876fc2dc2cf4b5/4.jpg)
### Key Insights: Highest-Paying Skills in the Job Market 💰📊

**1️⃣ Top High-Paying Skills 🏆**

Analyzing average salaries associated with different skills reveals the most lucrative ones:

**🔥 Top Tier (💰💰💰 155,500 BRL/year)**

- AWS – Cloud computing expertise is in high demand.
- Snowflake – A critical tool for cloud data warehousing.
- Spark & Hadoop – Big data processing frameworks, crucial for data engineering roles.

**💡 Mid-Tier (💰💰 136,000 - 138,000 BRL/year)**

- Go – A high-performance programming language used in backend and cloud services.
- Excel – Still lucrative for business intelligence and financial roles.
- Python & R – The go-to languages for data science and machine learning.

**📊 Lower-Tier (💰 109,000 - 132,500 BRL/year)**

- NoSQL & Flow – Important for database management and workflow automation.
- Matlab – Often used in engineering and quantitative analysis.
- SQL (109,625 BRL) – Despite its high demand, it falls behind in salary compared to Python and AWS.

**🚨 Low-Paying Skill (💰 30,000 BRL/year)**

- Tableau – Despite being a widely used visualization tool, it is associated with lower salaries.

**2️⃣ What This Means for Your Career 🚀**

- Big Data & Cloud skills (AWS, Spark, Hadoop, Snowflake) lead to the highest salaries.
- Python & R are still highly valuable, especially for Data Science roles.
- SQL remains essential but is not as lucrative as cloud and big data technologies.
- Excel still commands good salaries, proving its importance in business and finance.
- Tableau alone may not lead to high salaries but can be valuable when combined with other skills.

**3️⃣ Next Steps for Career Growth 🎯**

- Invest in cloud computing (AWS, Snowflake) and big data (Spark, Hadoop) to maximize salary potential.
- Enhance Python or R skills for data science and analytics roles.
- Combine SQL with NoSQL databases and cloud skills for a better-paying career path.

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

**🔥 Highest Paying Skills** (💰 Avg. Salary Above 120K BRL/Year)

- Kafka (129,999 BRL, 40 mentions) – Essential for real-time data streaming.
- PyTorch (125,226 BRL, 20 mentions) – A must-have for deep learning and AI.
- Perl (124,686 BRL, 20 mentions) – Valuable in scripting, automation, and backend systems.
- TensorFlow (120,647 BRL, 24 mentions) – Dominates machine learning and AI development.

**📈 High Demand & Strong Salaries** (💰 Avg. Salary 110K-120K BRL/Year, High Mentions)

- Spark (113,002 BRL, 187 mentions) – One of the most in-demand skills, key for big data processing.
- Snowflake (111,578 BRL, 241 mentions) – Leading cloud data warehousing tool, highly valuable.
- Hadoop (110,888 BRL, 140 mentions) – Used in big data storage and distributed computing.
 Databricks (112,881 BRL, 102 mentions) – A top tool for big data and AI integration.

**🔍 Emerging & Specialized Skills** (💰 Avg. Salary 110K+ BRL/Year, Moderate Demand)

- GCP (113,065 BRL, 78 mentions) – Google's cloud platform is growing in demand.
- Pandas (110,767 BRL, 90 mentions) – Essential for data manipulation and analysis in Python.
- Git (112,250 BRL, 74 mentions) – Version control expertise is essential for software and data engineers.
- MongoDB (113,608 BRL, 26 mentions) – NoSQL database rising in popularity.

### 2️⃣ What This Means for Career Growth 🎯
 ✅ If you want high salaries in AI/ML, focus on TensorFlow, PyTorch, and Spark.

 ✅ Big Data is extremely valuable – Invest in Kafka, Hadoop, Snowflake, and Databricks.

 ✅ Cloud platforms (AWS, GCP, Snowflake) are key for career growth in data engineering.

 ✅ Master SQL, Pandas, and MongoDB if you want to excel in data analysis and database management.

 ✅ Version control (Git) and automation (Perl, Shell, Unix) will enhance your backend and DevOps skills.

### 3️⃣ Next Steps: Where to Focus 🚀
- Big Data & Cloud: Learn Spark, Snowflake, and Hadoop.
- AI & ML: Gain expertise in TensorFlow, PyTorch, and Pandas.
- Data Engineering: Develop skills in Kafka, Airflow, Databricks, and Git.
- Data Science & Analysis: Master SQL, MongoDB, and Python libraries.

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
