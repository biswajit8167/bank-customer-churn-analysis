# bank-customer-churn-analysis
📊 Bank Customer Churn Analysis (SQL + Power BI)
🔹 Project Overview

This project analyzes the churn behavior of 10,000 customers from a European bank, using SQL for data exploration and Power BI for visualization. The goal was to identify key drivers of customer attrition and provide actionable insights to improve retention strategies.

🔹 Objectives

Identify attributes more common among churned vs retained customers.

Predict which customers are at high risk of churn using customer attributes.

Explore demographics and account behavior (age, geography, balance, products, credit score).

Highlight differences in churn patterns between France, Germany, and Spain.

Segment customers into groups to find high-risk categories.

🔹 Tools & Technologies

SQL → Data cleaning, transformations, churn rate calculations.

Power BI → Interactive dashboards & KPIs.

DAX → Custom measures (Churn Rate %, Average Credit Score, Segment KPIs).

Dataset → 10,000 bank customer records (Credit Score, Age, Geography, Balance, Products, Activity, Churn).

🔹 Analysis Performed

SQL Queries

Churn rate by geography, gender, age group, products, activity, balance segment.

CASE statements to create segments (Age Groups, Balance Levels, Credit Score Segments).

Aggregations (average credit score, balance, activity level by churn status).

Power BI Dashboards

Customer Overview → KPIs (Total Customers, Churn Rate, Avg. Credit Score, Age, Balance).

Churn Analysis → Churn by age, products, activity, and credit score.

Geography Analysis → Churn by France, Germany, Spain (Germany highest at 32%).

Segmentation → Risky groups by Age + Balance + Activity (Inactive & High Balance most churned).

Insights & Recommendations → Key findings and retention strategies.

🔹 Key Insights

Overall churn rate: ~20% (2,037 out of 10,000 customers).

Germany has the highest churn (32%), while France and Spain are around 16%.

Inactive members churn at 65% vs 14% for active members → activity is the strongest driver.

High balance customers (>100K) show disproportionately high churn despite being valuable.

Middle-aged customers (41–60) are the most at risk (34–56% churn).

🔹 Recommendations

Focus retention programs in Germany, especially for inactive members.

Improve customer engagement with rewards for activity (card usage, online banking).

Create loyalty programs for high-balance and multi-product customers.

Personalize offerings for middle-aged clients (41–60) to reduce churn risk.
