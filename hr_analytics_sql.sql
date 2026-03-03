CREATE DATABASE hr_project;
USE hr_project;

CREATE TABLE HR_Analytics (
EmpID VARCHAR(50),
Age VARCHAR(50),
AgeGroup VARCHAR(50),
Attrition VARCHAR(50),
BusinessTravel VARCHAR(50),
DailyRate VARCHAR(50),
Department VARCHAR(50),
DistanceFromHome VARCHAR(50),
Education VARCHAR(50),
EducationField VARCHAR(50),
EmployeeCount VARCHAR(50),
EmployeeNumber VARCHAR(50),
EnvironmentSatisfaction VARCHAR(50),
Gender VARCHAR(50),
HourlyRate VARCHAR(50),
JobInvolvement VARCHAR(50),
JobLevel VARCHAR(50),
JobRole VARCHAR(100),
JobSatisfaction VARCHAR(50),
MaritalStatus VARCHAR(50),
MonthlyIncome VARCHAR(50),
SalarySlab VARCHAR(50),
MonthlyRate VARCHAR(50),
NumCompaniesWorked VARCHAR(50),
Over18 VARCHAR(50),
OverTime VARCHAR(50),
PercentSalaryHike VARCHAR(50),
PerformanceRating VARCHAR(50),
RelationshipSatisfaction VARCHAR(50),
StandardHours VARCHAR(50),
StockOptionLevel VARCHAR(50),
TotalWorkingYears VARCHAR(50),
TrainingTimesLastYear VARCHAR(50),
WorkLifeBalance VARCHAR(50),
YearsAtCompany VARCHAR(50),
YearsInCurrentRole VARCHAR(50),
YearsSinceLastPromotion VARCHAR(50),
YearsWithCurrManager VARCHAR(50)
);
SELECT @@sql_mode;
SHOW WARNINGS;

SELECT COUNT(*) FROM HR_Analytics;

-- total employees
SELECT COUNT(*) AS Total_Employees 
FROM HR_Analytics;

-- attrition count
SELECT COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition = 'Yes';

-- attrition rate-- 
SELECT 
ROUND(
    (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100
,2) AS Attrition_Rate_Percentage
FROM HR_Analytics;

-- active employees
SELECT 
COUNT(*) - COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) 
AS Active_Employees
FROM HR_Analytics;

-- average salary-- 
SELECT ROUND(AVG(Age),0) AS Average_Age
FROM HR_Analytics;

-- attrition by gender
SELECT 
Gender,
COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY Gender
ORDER BY Attrition_Count DESC;


-- Attrition by Department
SELECT 
Department,
COUNT(*) AS Attrition_Count,
ROUND((COUNT(*) / 
    (SELECT COUNT(*) FROM HR_Analytics WHERE Attrition='Yes')
) * 100,2) AS Percentage
FROM HR_Analytics
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- Attrition by Job Role
SELECT 
JobRole,
COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY Attrition_Count DESC;

-- Attrition by Age Group & Gender
SELECT 
AgeGroup,
Gender,
COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition='Yes'
GROUP BY AgeGroup, Gender
ORDER BY AgeGroup, Gender;

-- Attrition by Education Field
SELECT 
EducationField,
COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition='Yes'
GROUP BY EducationField
ORDER BY Attrition_Count DESC;

-- Attrition by Salary Slab
SELECT 
SalarySlab,
COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition='Yes'
GROUP BY SalarySlab
ORDER BY Attrition_Count DESC;

-- Total Employees by Salary Slab
SELECT 
SalarySlab,
COUNT(*) AS Employee_Count
FROM HR_Analytics
GROUP BY SalarySlab
ORDER BY Employee_Count DESC;

-- Attrition by Years at Company
SELECT 
YearsAtCompany,
COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition='Yes'
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

-- Attrition by Distance From Home
SELECT 
DistanceFromHome,
COUNT(*) AS Attrition_Count
FROM HR_Analytics
WHERE Attrition='Yes'
GROUP BY DistanceFromHome
ORDER BY DistanceFromHome;

-- High Performers
SELECT 
Department,
JobRole,
COUNT(*) AS High_Performers
FROM HR_Analytics
WHERE PerformanceRating = 4
GROUP BY Department, JobRole
ORDER BY High_Performers DESC;