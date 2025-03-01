-- Attrition by Department
-- This shows which department has the highest attrition rate.
SELECT 
    Department, 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(100 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percentage
FROM Employees
GROUP BY Department
ORDER BY Attrition_Percentage DESC;


-- Attrition by Job Role
-- Which job roles are most likely to leave?
SELECT 
    JobRole, 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(100 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percentage
FROM Employees
GROUP BY JobRole
ORDER BY Attrition_Percentage DESC;

-- Impact of Salary on Attrition
-- Are lower-paid employees more likely to leave?
SELECT 
    CASE 
        WHEN Salary < 40000 THEN 'Low Salary (<40K)'
        WHEN Salary BETWEEN 40000 AND 80000 THEN 'Mid Salary (40K-80K)'
        ELSE 'High Salary (>80K)'
    END AS Salary_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(100 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percentage
FROM Employees
GROUP BY Salary_Group
ORDER BY Attrition_Percentage DESC;

-- Impact of Work-Life Balance on Attrition
-- Does poor work-life balance lead to more attrition?
SELECT 
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(100 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percentage
FROM Employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Years at Company vs. Attrition
-- Do newer employees leave more often?
SELECT 
    YearsAtCompany,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(100 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Percentage
FROM Employees
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;


-- Create a Summary Table
--  All insights in one place.
CREATE TABLE Attrition_Analysis AS
SELECT 
    e.Department,
    e.JobRole,
    CASE 
        WHEN e.Salary < 40000 THEN 'Low Salary (<40K)'
        WHEN e.Salary BETWEEN 40000 AND 80000 THEN 'Mid Salary (40K-80K)'
        ELSE 'High Salary (>80K)'
    END AS Salary_Group,
    e.WorkLifeBalance,
    e.YearsAtCompany,
    e.Attrition
FROM Employees e;

-- Export the Summary Table as CSV
SELECT * FROM Attrition_Analysis
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/attrition_analysis_summary.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';







