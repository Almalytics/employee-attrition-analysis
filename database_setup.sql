-- Create the HR_Analytics database
CREATE DATABASE HR_Analytics;

-- Use the HR_Analytics database
USE HR_Analytics;

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Department VARCHAR(50),
    Age INT,
    JobRole VARCHAR(50),
    Attrition VARCHAR(10),
    Salary INT,
    WorkLifeBalance INT,
    JobSatisfaction INT,
    YearsAtCompany INT
);

-- Import data from CSV (Modify the file path as needed)
LOAD DATA INFILE '/path/to/hr_employee_attrition.csv'
INTO TABLE Employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

