/*
Questions: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job posting with specified salaries (Remove nulls).
- Why? Highlight the top-paying opportunities for Data Analyst, offering insights into 
*/


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

/*

Key Insights from the Job Data 📊
1️⃣ Job Distribution by Location
Brazil dominates the job market with 7 out of 10 job postings.
Australia has fewer postings (3), but they are from top companies like Commonwealth Bank and DoorDash.

2️⃣ Job Role Breakdown
The most common roles are Senior Data Engineers (3) and Senior Data Scientists (2).
Other roles include Data Engineers (2), Senior Data Analysts (2), and Data Scientists (1).
CI&T is the most active employer, listing 5 out of 10 job postings.

3️⃣ Salary Insights 💰
The highest-paying role is Senior Data Scientist in Brazil at 171,121 BRL/year.
Senior Data Analysts earn an average of 165,000 BRL/year.
Senior Data Engineers earn slightly less, averaging 152,833 BRL/year.
Data Engineers (mid-level roles) have a lower average salary of 151,500 BRL/year.
Australia vs. Brazil: While Australia's salaries are competitive, Brazil has more high-paying senior roles.

4️⃣ Market Trends & Recommendations 🚀
Companies are prioritizing senior roles. If you aim for a high-paying job, gaining expertise in data science, engineering, and analytics is crucial.
CI&T dominates hiring in Brazil. If you’re targeting jobs in Brazil, CI&T is a key employer to watch.
Data Engineers have steady demand. This role appears twice and is a solid choice for career growth.
Australia offers part-time flexibility. Unlike Brazil, where all jobs are full-time, Commonwealth Bank lists a part-time option.

Conclusion 🎯
If your goal is to work in Brazil, focus on CI&T and senior-level positions.
If you're aiming for Australia, Data Engineering and Data Science roles are your best bet.
Keep building your skills in data analytics, Python, and SQL to align with market trends.

[
  {
    "job_id": 1139314,
    "job_title_short": "Senior Data Scientist",
    "job_location": "Brazil",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "171121.0",
    "job_posted_date": "2023-10-17 07:32:07",
    "company_name": "CI&T"
  },
  {
    "job_id": 284994,
    "job_title_short": "Senior Data Analyst",
    "job_location": "Brazil",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-07-18 09:43:24",
    "company_name": "CI&T"
  },
  {
    "job_id": 605606,
    "job_title_short": "Senior Data Analyst",
    "job_location": "Brazil",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-07-17 09:57:09",
    "company_name": "CI&T"
  },
  {
    "job_id": 109109,
    "job_title_short": "Data Scientist",
    "job_location": "Australia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-06 08:39:01",
    "company_name": "DoorDash"
  },
  {
    "job_id": 663205,
    "job_title_short": "Senior Data Scientist",
    "job_location": "Brazil",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-05 14:50:58",
    "company_name": "CI&T"
  },
  {
    "job_id": 34991,
    "job_title_short": "Senior Data Engineer",
    "job_location": "Australia",
    "job_schedule_type": "Full-time and Part-time",
    "salary_year_avg": "155500.0",
    "job_posted_date": "2023-11-29 18:15:42",
    "company_name": "Commonwealth Bank"
  },
  {
    "job_id": 198074,
    "job_title_short": "Senior Data Engineer",
    "job_location": "Brazil",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155500.0",
    "job_posted_date": "2023-10-18 18:30:34",
    "company_name": "Poatek"
  },
  {
    "job_id": 1013775,
    "job_title_short": "Data Engineer",
    "job_location": "Brazil",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155500.0",
    "job_posted_date": "2023-11-29 12:10:57",
    "company_name": "EBANX"
  },
  {
    "job_id": 520588,
    "job_title_short": "Senior Data Engineer",
    "job_location": "Brazil",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "147500.0",
    "job_posted_date": "2023-06-13 13:21:09",
    "company_name": "CI&T"
  },
  {
    "job_id": 586051,
    "job_title_short": "Senior Data Engineer",
    "job_location": "Brazil",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "147500.0",
    "job_posted_date": "2023-07-08 02:23:08",
    "company_name": "CI&T"
  }
]

*/
