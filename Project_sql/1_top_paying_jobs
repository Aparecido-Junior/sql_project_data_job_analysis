
/*
Questions: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available.
- Focuses on job posting with specified salaries (Remove nulls).
- Why? Highlight the top-paying opportunities for Data Analyst offering insights into 
*/

SELECT jf.job_id,
       jf.job_title,
       jf.job_title_short,
       jf.job_location,
       jf.job_schedule_type,
       jf.salary_year_avg,
       jf.job_posted_date,
       cd.name
FROM   job_postings_fact jf
       LEFT JOIN company_dim cd
              ON jf.company_id = cd.company_id
WHERE  job_title_short = 'Data Analyst'
       AND job_location = 'Anywhere'
       AND salary_year_avg IS NOT NULL
ORDER  BY salary_year_avg DESC
LIMIT  10;

/*

Top-Paying Data Analyst Opportunities 💰📊
🔹  Mantys Offers the Highest-Paying Role ($650K) – This Data Analyst 
    position significantly exceeds typical salaries, suggesting a specialized or high-impact role.

🔹  Director & Senior Roles Pay Premium Salaries – Meta ($336K) and AT&T 
    ($255K) highlight how leadership and advanced analytics expertise lead to higher earnings.

🔹  Competitive Salaries Across Industries – Companies like Pinterest ($232K),
    UCLA Health ($217K), and SmartAsset ($205K) show that tech, healthcare, and 
    finance offer strong compensation for data roles.

[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "name": "Mantys"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "name": "Meta"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "name": "AT&T"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "name": "Uclahealthcareers"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "name": "SmartAsset"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "name": "Inclusively"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "name": "Motional"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "name": "SmartAsset"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "name": "Get It Recruit - Information Technology"
  }
]

*/














