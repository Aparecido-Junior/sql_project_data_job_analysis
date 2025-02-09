# Introduction
    Dive into the data job market! Focusing on data analyst roles, this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data analystics

    SQL queries? Check them out here: [project_sql folder](/sql_load/Project_sql/)
    
# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

Data hails from my [SQL Course](Link). It's packed with insights on job titles, salaries, locations and essential skills.

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
Each Query for this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To Identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

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
where job_location in ('Australia','Brazil','Anywhere') AND
salary_year_avg is not null AND
job_title_short = 'Data Analyst'
order by salary_year_avg;


SELECT job_location
from job_postings_fact
limit 500;
```
# What I learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **Comple Query Crafting:** Mastered the art of adventure SQL, mergin tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
-**Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
-**Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights

### Closing Thoughts

This Project enhaced my SQL skills and provided valuabre insights into the data analyst job amrket. The finding from the analysis serve as a guide to prioritezing skill development and job serach efforts. Aspiring data analysts can better positions themserlves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlits the importance of continous learning and adaptation to emergin trends in the field of data analytics.
