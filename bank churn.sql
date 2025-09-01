CREATE DATABASE bank_churn;
USE bank_churn;

CREATE TABLE customers (
    CustomerId BIGINT PRIMARY KEY,
    Surname VARCHAR(50),
    CreditScore INT,
    Geography VARCHAR(20),
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    Balance DECIMAL(15,2),
    NumOfProducts INT,
    HasCrCard TINYINT,
    IsActiveMember TINYINT,
    EstimatedSalary DECIMAL(15,2),
    Exited TINYINT
);
select * from customers
select count(*) from customers;


SELECT 
    SUM(CASE WHEN CustomerId IS NULL THEN 1 ELSE 0 END) AS CustomerId_nulls,
    SUM(CASE WHEN Surname IS NULL THEN 1 ELSE 0 END) AS Surname_nulls,
    SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS CreditScore_nulls,
    SUM(CASE WHEN Geography IS NULL THEN 1 ELSE 0 END) AS Geography_nulls,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_nulls,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_nulls,
    SUM(CASE WHEN Tenure IS NULL THEN 1 ELSE 0 END) AS Tenure_nulls,
    SUM(CASE WHEN Balance IS NULL THEN 1 ELSE 0 END) AS Balance_nulls,
    SUM(CASE WHEN NumOfProducts IS NULL THEN 1 ELSE 0 END) AS NumOfProducts_nulls,
    SUM(CASE WHEN HasCrCard IS NULL THEN 1 ELSE 0 END) AS HasCrCard_nulls,
    SUM(CASE WHEN IsActiveMember IS NULL THEN 1 ELSE 0 END) AS IsActiveMember_nulls,
    SUM(CASE WHEN EstimatedSalary IS NULL THEN 1 ELSE 0 END) AS EstimatedSalary_nulls,
    SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END) AS Exited_nulls
FROM customers;

-----1. What attributes are more common among churners than non-churners?-----
-- Average attributes of churners vs non-churners with CASE
SELECT 
    CASE 
        WHEN Exited = 1 THEN 'Churned'
        WHEN Exited = 0 THEN 'Retained'
    END AS Customer_Status,
    ROUND(AVG(CreditScore),2) AS avg_credit_score,
    ROUND(AVG(Age),2) AS avg_age,
    ROUND(AVG(Balance),2) AS avg_balance,
    ROUND(AVG(NumOfProducts),2) AS avg_products,
    ROUND(AVG(IsActiveMember),2) AS avg_activity
FROM customers
GROUP BY Customer_Status;

--2. Can churn be predicted using the variables?--



-- Churn rate by number of products 
SELECT 
    CASE 
        WHEN NumOfProducts = 1 THEN '1 Product'
        WHEN NumOfProducts = 2 THEN '2 Products'
        WHEN NumOfProducts = 3 THEN '3 Products'
        WHEN NumOfProducts >= 4 THEN '4+ Products'
    END AS Product_Category,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Product_Category
ORDER BY churn_rate DESC;
---- churn rate by age group--
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE 'Above 60'
    END AS Age_Group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Age_Group
ORDER BY churn_rate DESC;

-- Churn rate by Balance Segments 
SELECT 
    CASE 
        WHEN Balance = 0 THEN 'No Balance'
        WHEN Balance BETWEEN 1 AND 50000 THEN 'Low Balance (1-50K)'
        WHEN Balance BETWEEN 50001 AND 100000 THEN 'Medium Balance (50K-100K)'
        ELSE 'High Balance (100K+)'
    END AS Balance_Segment,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Balance_Segment
ORDER BY churn_rate DESC;


-- Churn rate by activity (Active vs Inactive) ----
SELECT 
    CASE 
        WHEN IsActiveMember = 1 THEN 'Active Member'
        WHEN IsActiveMember = 0 THEN 'Inactive Member'
    END AS Activity_Status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Activity_Status
ORDER BY churn_rate DESC;

-- Churn rate by Gender 
SELECT 
    CASE 
        WHEN Gender = 'Male' THEN 'Male'
        WHEN Gender = 'Female' THEN 'Female'
    END AS Gender_Group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Gender_Group
ORDER BY churn_rate DESC;


-- Churn rate by Geography 
SELECT 
    CASE 
        WHEN Geography = 'France' THEN 'France'
        WHEN Geography = 'Germany' THEN 'Germany'
        WHEN Geography = 'Spain' THEN 'Spain'
        ELSE 'Other'
    END AS Country,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Country
ORDER BY churn_rate DESC;





