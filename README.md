# Introduction
Dive into the Data Job Market! Focusing on data analyst roles📊, this project explores top-paying jobs 💰, in-demand skills 🧠, and where high demand 📈 meets high salary 💵 in data analytics 🔥. Get ready to uncover key insights!

SQL queries? Check them out here: [Project_sq folder](https://github.com/Aparecido-Junior/sql_project_data_job_analysis) 
    
     
# Background
Driven by a quest to navigate the data analyst job market more effectively 🚀, this project was born from a desire to pinpoint top-paid 💰 and in-demand skills 📊, streamlining others' work to find optimal jobs 🎯.


### The questions I wanted to answer through my SQL queries were:
1. What are the top-paying jbs for my role?
2. What are the skills required for these top-paying roles?
3. What are the most in-demand on salary for my role?
4. What are the top skills based on salary for my role?
5. What are the most optimal skills to learn?

# Tools I used
For my deep dieve into the data analyst job market, I harnessed the power of several key tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code**: My go-to for database management and executing SQl queries.
- **Git & Github**: Essetial for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market.📊 🔍

Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles 💰, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs 🌍. This query highlights the high-paying opportunities in the field 📊.

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
where job_location in ('Australia','Brazil','Anywhere') 
ANDsalary_year_avg is not null 
ANDjob_title_short = 'Data Analyst'
order by salary_year_avg
limit 10;
```
**💰 Insights on Top-Paying Data Analyst Jobs**

**🔎 Key Findings from the SQL Query:**

**🔎 Key Findings from the SQL Query:**
- The query focuses on high-paying remote jobs by filtering locations like Australia, Brazil, and Anywhere (fully remote).
- The query focuses on high-paying remote jobs by filtering locations like Australia, Brazil, and Anywhere (fully remote).
- This suggests that top-paying Data Analyst roles are not restricted to the U.S./Europe but extend globally.

**2️⃣ 💲 Salary Disparities by Location**
- The ORDER BY salary_year_avg clause sorts jobs by salary, helping identify the best-paying roles.
- Expect Australia to offer higher salaries compared to other locations due to market demand and cost of living.

**3️⃣ 🏢 Company Influence on Salary**
- By joining the company_dim table, we can identify which companies pay the highest salaries for Data Analysts.
- Certain tech and finance companies tend to offer above-average compensation.

**4️⃣ 📅 Fresh Job Listings Considered**
- Including job_posted_date allows filtering by recent postings, ensuring relevance.


### 2. skills required for the top-paying roles

```sql
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
inner join skills_job_dim sjd on jl.job_id = sjd.job_id
inner join skills_dim sd on sjd.skill_id = sd.skill_id
order by company_name;
```
**Key Insights on Data Analyst Skills (2023)SQL & Excel are Essential** 

- Both appear most frequently in job postings, highlighting their importance for data manipulation and analysis.
- Programming is Valued but Less Common 
- Python and R are mentioned but less frequently than SQL and Excel.
SAS Still Has Demand 
- Some industries continue to use SAS, though open-source tools are more popular.
 
🔹 **Takeaway:** Prioritize SQL & Excel, then enhance with Python or R for a competitive edge. Let me know if you need deeper insights!


# What I learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **Comple Query Crafting:** Mastered the art of adventure SQL, mergin tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
-**Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
-**Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights

### Closing Thoughts

This Project enhaced my SQL skills and provided valuabre insights into the data analyst job amrket. The finding from the analysis serve as a guide to prioritezing skill development and job serach efforts. Aspiring data analysts can better positions themserlves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlits the importance of continous learning and adaptation to emergin trends in the field of data analytics.
