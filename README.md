# Quick-Commerce-SLA-Profitability-Analysis
End-to-end Data Analytics project analyzing Quick Commerce operations, SLA breaches, delivery performance, customer feedback, and marketing profitability using Python, PostgreSQL, and Power BI.

# Project Overview
This project analyzes Quick Commerce operations to identify delivery inefficiencies, SLA breaches, customer experience patterns, and profitability drivers.
The analysis combines Python for data cleaning and exploratory analysis, PostgreSQL for business-oriented SQL analysis, and Power BI for interactive dashboard development.
The goal is to convert operational data into actionable business insights that support decision-making.

## Business Problem
Quick Commerce businesses operate in highly competitive environments where delivery speed, customer satisfaction, and profitability directly impact business success.
The company faces challenges such as:
- High SLA breach rates
- Delivery delays during peak periods
- Varying store performance
- Customer satisfaction concerns
- Marketing budget optimization
Understanding these factors is critical for improving operational efficiency and customer retention.

## Project Objectives
- Measure overall SLA performance
- Identify delivery delay patterns
- Analyze operational load across time periods
- Evaluate customer feedback and satisfaction
- Identify profitable campaigns and channels
- Build executive dashboards for decision-making

## Dataset Overview

The dataset contains **12,817 records** and **46 features**, covering various aspects of a quick commerce business including customer feedback, order management, delivery performance, marketing campaigns, and profitability.
Key characteristics of the dataset include:

- Multiple customer segments such as Gold, Premium, Regular, Loyal, New, and Inactive customers.
- 23 marketing campaigns used for customer acquisition and engagement.
- 10 acquisition and communication channels including App, Email, Social Media, Google Ads, and others.
- Delivery operations categorized into four peak periods:
  - Morning
  - Lunch
  - Evening
  - Night

The dataset provides a comprehensive view of customer behavior, delivery operations, marketing effectiveness, and business profitability, making it suitable for end-to-end analytics and dashboard development.

# Technology Stack

## Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
## SQL
- PostgreSQL
## Visualization
- Power BI
## Version Control
- Git & GitHub

# Project Workflow

Data Collection
↓
Data Cleaning
↓
Feature Engineering
↓
Exploratory Data Analysis
↓
SQL Business Analysis
↓
Dashboard Development
↓
Business Recommendations

## Data Cleaning & Preprocessing
- Removed duplicate records
- Standardized sentiment categories
- Corrected customer segment inconsistencies
- Cleaned delivery status values
- Handled missing and unknown values
- Created business metrics:
  - SLA Breach
  - Delay Minutes
  - Profit Margin
  - Peak Period
  - Order Hour
 
# Exploratory Data Analysis
The EDA focused on four business areas:
## 1. SLA & Delivery Performance
- Overall SLA Breach Rate
- Delay Distribution
- Peak Period Analysis
## 2. Profitability Analysis
- Profit Distribution
- Campaign Performance
- Channel Performance
## 3. Customer Experience
- Ratings Analysis
- Sentiment Analysis
- Feedback Categories
## 4. Operational Load Analysis
- Orders by Hour
- Orders by Day
- Peak Demand Periods

# SQL Business Analysis

Business questions answered:

## Delivery & Operations
- What percentage of orders breached SLA?
- Which peak period contributes most SLA failures?
- Which customer segments are most affected?
- Which stores generate highest delays?
## Profitability
- Which campaigns generate highest profit?
- Which channels contribute most profit?
- Which campaigns deliver best ROAS?
## Customer Experience
- How do ratings vary by delivery status?
- What are the most common feedback categories?
- What is the sentiment distribution?

# POWER BI DASHBOARD
## Executive Overview
<img width="1260" height="692" alt="Screenshot 2026-06-14 112144" src="https://github.com/user-attachments/assets/1c37db27-9a84-4891-b6e0-2ff043c094c9" />
## Delivery & Operations Performance
<img width="1296" height="730" alt="Screenshot 2026-06-14 112153" src="https://github.com/user-attachments/assets/6fee1c37-165c-4c13-be5c-ec1a690864e0" />
## Customer & Marketing Analytics
<img width="1242" height="716" alt="Screenshot 2026-06-14 112201" src="https://github.com/user-attachments/assets/0b6a229b-0fb4-441e-9a6a-bfa84098f838" />

# Key Insights

## Operations
- 45.21% of orders breached SLA commitments.
- Night period generated the highest number of SLA breaches.
- Average delay was 2.02 minutes.
## Customer Experience
- Positive sentiment accounted for 42.73% of customer feedback.
- Customer Service generated the highest feedback volume.
- Customer ratings were influenced by factors beyond delivery delay.
## Profitability
- Total profit reached 57.49M.
- Referral Program was the most profitable campaign.
- App channel generated the highest profitability.

# Business Recommendations

1. Increase delivery capacity during Night operations.

2. Implement SLA risk monitoring for high-risk orders.

3. Invest more in Referral and App-based campaigns.

4. Improve customer service processes to address frequent complaints.

5. Monitor loss-making orders and optimize promotional spending.

# Repository Structure

├── Data
├── Python
├── SQL
├── PowerBI
├── Dashboard Screenshots
├── README.md
└── Project Report.pdf

# Future Improvements

- SLA Breach Prediction Model
- Customer Churn Analysis
- Campaign Recommendation System
- Real-Time Operational Dashboard
- Demand Forecasting

## Author

Ankit Raj Yadav

Aspiring Data Analyst

Skills:
Python | SQL | Power BI | Excel | Data Visualization


