/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skills for data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analust and
helps identify the most financially rewarding skills to acquire or improve
*/

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

select * from job_postings_fact limit 5;

/*

📊 Key Insights on Data Analyst Skills & Salaries 💰
🚀 1. Highest Paying Skill: 🛠️ svn – 💵 $400,000 🔝
📉 2. Lowest Paying Skill: 📊 scala – 💵 $115,480 ⬇️
📊 3. Average Salary Across All Skills: 💰 $142,931 📈

💡 Key Observations:
✅ Niche Tech Skills Pay More: 🏆 svn, solidity, & couchbase lead with premium salaries, likely due to low supply & high demand.
🔍 Common Data Tools Pay Well: 🔢 scala, airflow, & bitbucket still offer strong pay but are on the lower end.
📈 AI & ML Skills Hold Value: 🤖 tensorflow, pytorch, & keras show competitive salaries, indicating high demand for AI expertise.

💬 Want salary trend visualizations? Let me know! 📉📊

[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  }
]

*/