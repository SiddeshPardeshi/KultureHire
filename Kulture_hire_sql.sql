SELECT * FROM kulturehire.kulture_hire_genz_data;

/* 1. What is the gender distribution of respondents from India? */
SELECT gender, COUNT(gender) AS gender_counts FROM kulture_hire_genz_data
GROUP BY gender;

/* 2. What percentage of respondents from India are interested in education abroad and sponsorship? */
SELECT 
    ROUND((COUNT(CASE WHEN `Pursue_HigherEd_Abroad?` IN ('Yes', 'Sponsor') THEN 1 END) / COUNT(*)),2) * 100 AS Percentage_Interested
FROM 
    kulture_hire_genz_data;
    
/* 3. What are the 6 top influences on career aspirations for respondents in India? */
SELECT career_influences, COUNT(career_influences) AS top_influences 
FROM kulture_hire_genz_data
GROUP BY career_influences
ORDER BY top_influences DESC;

/* 4. How do career aspiration influences vary by gender in India? */
SELECT gender, career_influences, COUNT(gender) AS influence_count
FROM kulture_hire_genz_data
GROUP BY gender, career_influences
ORDER BY gender, influence_count DESC;

/* 5. What percentage of respondents are willing to work for a company for at least 3 years? */
SELECT
ROUND((COUNT(CASE WHEN Likely_Work_3Yrs_Plus IN ('Will work for 3 years or more') THEN 1 END)/COUNT(*)),2)*100 
AS percentage_respondents
FROM kulture_hire_genz_data;

/* 6. How many respondents prefer to work for socially impactful companies? */
SELECT Likelihood_Work_NoImpact, COUNT(Likelihood_Work_NoImpact) AS prefer_to_work
FROM kulture_hire_genz_data
GROUP BY Likelihood_Work_NoImpact
ORDER BY Likelihood_Work_NoImpact LIMIT 3;

/* 7. How does the preference for socially impactful companies vary by gender? */
SELECT gender, COUNT(Likelihood_Work_NoImpact) AS prefer_to_work
FROM kulture_hire_genz_data
WHERE Likelihood_Work_NoImpact IN (1,2,3)
GROUP BY gender
ORDER BY prefer_to_work DESC;

/* 8. What is the distribution of minimum expected salary in the first three years among respondents? */
SELECT 3Year_Salary_Expectation, COUNT(3Year_Salary_Expectation) AS count_respondents
FROM kulture_hire_genz_data
GROUP BY 3Year_Salary_Expectation
ORDER BY count_respondents DESC LIMIT 1;

/* 9. What percentage of respondents prefer remote working? */
SELECT ROUND((COUNT(CASE WHEN Preferred_Working_Environment IN ('Fully Remote') THEN 1 END)/COUNT(*)),2)*100 AS pct_fully_remote
FROM kulture_hire_genz_data;

/* 10. How does the need for work-life balance interventions vary by gender? */
SELECT gender, preferred_working_environment, COUNT(*) AS work_life_balance FROM kulture_hire_genz_data
WHERE preferred_working_environment = "Fully Remote"
GROUP BY gender, preferred_working_environment;

/* 11. What is the distribution of minimum expected salary after five years? */
SELECT 	Expected_Salary_in_5Years, COUNT(Expected_Salary_in_5Years) AS count_respondents
FROM kulture_hire_genz_data
GROUP BY Expected_Salary_in_5Years
ORDER BY count_respondents DESC LIMIT 1;

/* 12. What are the remote working preferences by gender? */
SELECT gender, Preferred_Working_Environment, COUNT(*) FROM kulture_hire_genz_data
WHERE preferred_working_environment NOT IN ('Preferred Working Environment', 'Every Day Office Environment')
GROUP BY gender, Preferred_Working_Environment;

/* 13. What percentage of respondents need sponsorship for education abroad? */
SELECT 
    ROUND((COUNT(CASE WHEN `Pursue_HigherEd_Abroad?` IN ('Sponsor') THEN 1 END) / COUNT(*)),2) * 100 AS Percentage_Interested
FROM 
    kulture_hire_genz_data;

/* 14. What are the top work frustrations for each gender? */
SELECT gender, Support_Unclear_Mission, COUNT(*) FROM kulture_hire_genz_data
WHERE Support_Unclear_Mission = 'No'
GROUP BY gender;
