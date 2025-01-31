
/*
    Question: What skills are required for the top paying data analyst jobs?
        - Use the top 10 highest paying Data Anayst jobs from first query.
        - Add tge specific skills required for these roles.
        - Why? It provides a detailed look at which high paying jobs demand certain skills,
        helping job seekers understand which skills ro develop that align with top salaries.
*/


WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%Canada' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    --LIMIT 10

)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Here's the brakdown of the most demanded skilld for data analysus in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableu is also higly sought after, with a bold count of 6.
Other skills like R, Snowfliak, Pandas and Excel show varying degrees of demand.


  [
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "job_location": "Canada",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "sql"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "job_location": "Canada",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "python"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "job_location": "Canada",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "spark"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "job_location": "Canada",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "hadoop"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "job_location": "Canada",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "sql"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "job_location": "Canada",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "python"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "job_location": "Canada",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "spark"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "job_location": "Canada",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "hadoop"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "job_location": "Canada",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "sql"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "job_location": "Canada",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "python"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "job_location": "Canada",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "vba"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "job_location": "Canada",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "excel"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "job_location": "Canada",
    "salary_year_avg": "109000.0",
    "company_name": "Sun Life",
    "skills": "tableau"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "job_location": "Canada",
    "salary_year_avg": "108415.5",
    "company_name": "Swiss Re",
    "skills": "python"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "job_location": "Canada",
    "salary_year_avg": "108415.5",
    "company_name": "Swiss Re",
    "skills": "typescript"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "job_location": "Canada",
    "salary_year_avg": "108415.5",
    "company_name": "Swiss Re",
    "skills": "spark"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "105000.0",
    "company_name": "ATB Financial",
    "skills": "sql"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "105000.0",
    "company_name": "ATB Financial",
    "skills": "python"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "105000.0",
    "company_name": "ATB Financial",
    "skills": "javascript"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "105000.0",
    "company_name": "ATB Financial",
    "skills": "bigquery"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "105000.0",
    "company_name": "ATB Financial",
    "skills": "tableau"
  },
  {
    "job_id": 1591043,
    "job_title": "Data Analyst, End to End Banking Operations",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "105000.0",
    "company_name": "ATB Financial",
    "skills": "sheets"
  },
  {
    "job_id": 1232872,
    "job_title": "Analytics Lab Architect",
    "job_location": "Canada",
    "salary_year_avg": "101014.0",
    "company_name": "Swiss Re",
    "skills": "azure"
  },
  {
    "job_id": 1232872,
    "job_title": "Analytics Lab Architect",
    "job_location": "Canada",
    "salary_year_avg": "101014.0",
    "company_name": "Swiss Re",
    "skills": "databricks"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "100500.0",
    "company_name": "ATB Financial",
    "skills": "sql"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "100500.0",
    "company_name": "ATB Financial",
    "skills": "python"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "100500.0",
    "company_name": "ATB Financial",
    "skills": "tableau"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "100500.0",
    "company_name": "ATB Financial",
    "skills": "looker"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "100500.0",
    "company_name": "ATB Financial",
    "skills": "sheets"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "100500.0",
    "company_name": "ATB Financial",
    "skills": "visio"
  },
  {
    "job_id": 452146,
    "job_title": "Data Analyst",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "100500.0",
    "company_name": "ATB Financial",
    "skills": "jira"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "job_location": "Canada",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "sql"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "job_location": "Canada",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "python"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "job_location": "Canada",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "sas"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "job_location": "Canada",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "excel"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "job_location": "Canada",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "sas"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "job_location": "Canada",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "spss"
  },
  {
    "job_id": 973984,
    "job_title": "Data Analyst - HoYolab and Content Creator",
    "job_location": "Canada",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "sql"
  },
  {
    "job_id": 973984,
    "job_title": "Data Analyst - HoYolab and Content Creator",
    "job_location": "Canada",
    "salary_year_avg": "100500.0",
    "company_name": "HoYoverse",
    "skills": "excel"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "job_location": "Canada",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "sql"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "job_location": "Canada",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "python"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "job_location": "Canada",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "spark"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "job_location": "Canada",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "hadoop"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "job_location": "Canada",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "express"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "job_location": "Canada",
    "salary_year_avg": "99150.0",
    "company_name": "Zynga",
    "skills": "tableau"
  },
  {
    "job_id": 1201997,
    "job_title": "Data Strategy Product Manager",
    "job_location": "Canada",
    "salary_year_avg": "99150.0",
    "company_name": "Kinaxis",
    "skills": "sap"
  },
  {
    "job_id": 610315,
    "job_title": "Data Analyst, Market Risk",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "sql"
  },
  {
    "job_id": 610315,
    "job_title": "Data Analyst, Market Risk",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "python"
  },
  {
    "job_id": 610315,
    "job_title": "Data Analyst, Market Risk",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "sas"
  },
  {
    "job_id": 610315,
    "job_title": "Data Analyst, Market Risk",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "vba"
  },
  {
    "job_id": 610315,
    "job_title": "Data Analyst, Market Risk",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "tableau"
  },
  {
    "job_id": 610315,
    "job_title": "Data Analyst, Market Risk",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "sas"
  },
  {
    "job_id": 610315,
    "job_title": "Data Analyst, Market Risk",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "sheets"
  },
  {
    "job_id": 1543969,
    "job_title": "Data Analyst Summer Student 2023, ATB Capital Markets",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "excel"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "sql"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "python"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "r"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "sas"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "javascript"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "bigquery"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "excel"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "tableau"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "sas"
  },
  {
    "job_id": 1160094,
    "job_title": "Fraud Data Analyst - 18-month Temp",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "98500.0",
    "company_name": "ATB Financial",
    "skills": "sheets"
  },
  {
    "job_id": 291779,
    "job_title": "Data and Analytics Architect",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "90000.0",
    "company_name": "The Travelers Companies, Inc",
    "skills": "azure"
  },
  {
    "job_id": 291779,
    "job_title": "Data and Analytics Architect",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "90000.0",
    "company_name": "The Travelers Companies, Inc",
    "skills": "aws"
  },
  {
    "job_id": 291779,
    "job_title": "Data and Analytics Architect",
    "job_location": "Edmonton, AB, Canada",
    "salary_year_avg": "90000.0",
    "company_name": "The Travelers Companies, Inc",
    "skills": "gcp"
  },
  {
    "job_id": 1709339,
    "job_title": "Data Analyst (Remote)",
    "job_location": "New Jersey, NB, Canada",
    "salary_year_avg": "90000.0",
    "company_name": "Covetrus, Inc.",
    "skills": "sql"
  },
  {
    "job_id": 1709339,
    "job_title": "Data Analyst (Remote)",
    "job_location": "New Jersey, NB, Canada",
    "salary_year_avg": "90000.0",
    "company_name": "Covetrus, Inc.",
    "skills": "sql server"
  },
  {
    "job_id": 1709339,
    "job_title": "Data Analyst (Remote)",
    "job_location": "New Jersey, NB, Canada",
    "salary_year_avg": "90000.0",
    "company_name": "Covetrus, Inc.",
    "skills": "snowflake"
  },
  {
    "job_id": 1709339,
    "job_title": "Data Analyst (Remote)",
    "job_location": "New Jersey, NB, Canada",
    "salary_year_avg": "90000.0",
    "company_name": "Covetrus, Inc.",
    "skills": "tableau"
  },
  {
    "job_id": 1709339,
    "job_title": "Data Analyst (Remote)",
    "job_location": "New Jersey, NB, Canada",
    "salary_year_avg": "90000.0",
    "company_name": "Covetrus, Inc.",
    "skills": "power bi"
  },
  {
    "job_id": 536017,
    "job_title": "ILI Inspection Data Analyst III",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Jobot",
    "skills": "sql"
  },
  {
    "job_id": 536017,
    "job_title": "ILI Inspection Data Analyst III",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Jobot",
    "skills": "python"
  },
  {
    "job_id": 536017,
    "job_title": "ILI Inspection Data Analyst III",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Jobot",
    "skills": "excel"
  },
  {
    "job_id": 536017,
    "job_title": "ILI Inspection Data Analyst III",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Jobot",
    "skills": "tableau"
  },
  {
    "job_id": 536017,
    "job_title": "ILI Inspection Data Analyst III",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Jobot",
    "skills": "power bi"
  },
  {
    "job_id": 139994,
    "job_title": "Procurement Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "70500.0",
    "company_name": "KBR, Inc.",
    "skills": "vba"
  },
  {
    "job_id": 139994,
    "job_title": "Procurement Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "70500.0",
    "company_name": "KBR, Inc.",
    "skills": "power bi"
  },
  {
    "job_id": 1480395,
    "job_title": "Power BI Engineer",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "65000.0",
    "company_name": "LTIMindtree",
    "skills": "sql"
  },
  {
    "job_id": 1480395,
    "job_title": "Power BI Engineer",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "65000.0",
    "company_name": "LTIMindtree",
    "skills": "power bi"
  },
  {
    "job_id": 291435,
    "job_title": "Manager, Data Analytics & Reporting",
    "job_location": "Toronto, ON, Canada",
    "salary_year_avg": "63000.0",
    "company_name": "Vialto Partners",
    "skills": "excel"
  },
  {
    "job_id": 291435,
    "job_title": "Manager, Data Analytics & Reporting",
    "job_location": "Toronto, ON, Canada",
    "salary_year_avg": "63000.0",
    "company_name": "Vialto Partners",
    "skills": "alteryx"
  },
  {
    "job_id": 1625663,
    "job_title": "Instructor- Data Analytics",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "63000.0",
    "company_name": "SAIT",
    "skills": "python"
  },
  {
    "job_id": 1625663,
    "job_title": "Instructor- Data Analytics",
    "job_location": "Calgary, AB, Canada",
    "salary_year_avg": "63000.0",
    "company_name": "SAIT",
    "skills": "c"
  },
  {
    "job_id": 1159759,
    "job_title": "Junior Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "sql"
  },
  {
    "job_id": 1159759,
    "job_title": "Junior Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "python"
  },
  {
    "job_id": 1159759,
    "job_title": "Junior Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "vba"
  },
  {
    "job_id": 1159759,
    "job_title": "Junior Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "tableau"
  },
  {
    "job_id": 218956,
    "job_title": "Data Analyst (Genshin Impact) - Fresh Grad",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "sql"
  },
  {
    "job_id": 218956,
    "job_title": "Data Analyst (Genshin Impact) - Fresh Grad",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "python"
  },
  {
    "job_id": 218956,
    "job_title": "Data Analyst (Genshin Impact) - Fresh Grad",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "sas"
  },
  {
    "job_id": 218956,
    "job_title": "Data Analyst (Genshin Impact) - Fresh Grad",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "excel"
  },
  {
    "job_id": 218956,
    "job_title": "Data Analyst (Genshin Impact) - Fresh Grad",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "sas"
  },
  {
    "job_id": 218956,
    "job_title": "Data Analyst (Genshin Impact) - Fresh Grad",
    "job_location": "Canada",
    "salary_year_avg": "57500.0",
    "company_name": "HoYoverse",
    "skills": "spss"
  },
  {
    "job_id": 176825,
    "job_title": "Business Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "49566.5",
    "company_name": "MaxPeopleHR",
    "skills": "sql"
  },
  {
    "job_id": 176825,
    "job_title": "Business Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "49566.5",
    "company_name": "MaxPeopleHR",
    "skills": "excel"
  },
  {
    "job_id": 176825,
    "job_title": "Business Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "49566.5",
    "company_name": "MaxPeopleHR",
    "skills": "word"
  },
  {
    "job_id": 176825,
    "job_title": "Business Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "49566.5",
    "company_name": "MaxPeopleHR",
    "skills": "powerpoint"
  },
  {
    "job_id": 176825,
    "job_title": "Business Data Analyst",
    "job_location": "Canada",
    "salary_year_avg": "49566.5",
    "company_name": "MaxPeopleHR",
    "skills": "outlook"
  }
]  

*/