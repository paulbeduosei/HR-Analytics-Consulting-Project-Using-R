📊 HR Analytics Consulting Project

Answering Five Critical Workforce Questions with Data
#📌 Project Overview

This project simulates a real-world HR consulting engagement where data is used to answer five high-impact business questions related to hiring, engagement, compensation, performance, and workplace safety.

The goal of the project is to show how a data analyst can:

Translate business questions into analysis

Use data responsibly to uncover patterns

Support HR leaders with evidence-based recommendations

Each question was analyzed as a standalone deliverable, similar to how a consultant would present findings to a client.

#🧠 Business Questions Answered

Which recruiting source produces the best employees?

What is driving low employee engagement?

Are new hires getting paid too much?

Are performance ratings given consistently?

How can workplace safety be improved using data?

#🛠 Tools & Technologies Used
R

dplyr – data cleaning, grouping, and transformation

readr – importing datasets

ggplot2 – data visualization

tidyr – reshaping data

#Statistical tests:

Welch two-sample t-tests

Chi-square tests

Regression models:

Linear regression

Logistic regression

#🔹 Question 1: Identifying the Best Recruiting Source

#🎯 Business Goal

Determine whether different recruiting sources produce different employee outcomes.

#🔍 Approach

Grouped employees by recruiting source

Compared sales performance and attrition rates

Visualized differences across sources

#📈 Key Findings

Applied Online hires show strong performance and lower attrition

Referral hires perform well but may be limited in scale

Search Firm hires have the highest attrition

Campus hires show lower short-term performance

#💡 Recommendation

Prioritize Applied Online and Referral channels, and reevaluate reliance on Search Firms.

🔹 Question 2: What Is Driving Low Employee Engagement?

🎯 Business Goal

Identify factors associated with disengaged employees.

#🔍 Approach

Analyzed engagement scores by department

Created a disengaged flag (engagement ≤ 2)

Compared disengagement, salary, and vacation usage

Ran statistical tests to validate patterns

#📈 Key Findings

Sales has the highest disengagement rate

Sales employees take significantly fewer vacation days

Salary alone does not explain low engagement

#💡 Recommendation

Address workload and time-off policies in Sales to reduce burnout and disengagement.

#🔹 Question 3: Are New Hires Getting Paid Too Much?

#🎯 Business Goal

Assess whether new hires are overpaid compared to existing employees.

#🔍 Approach

Compared average salaries of new hires vs. existing employees

Ran t-tests and regression models

Controlled for job level

#📈 Key Findings

New hires appear to earn more at first glance

Once job level is controlled for, the pay difference disappears

#💡 Recommendation

Current compensation practices are fair; focus pay equity reviews on role and level, not hire status.

🔹 Question 4: Are Performance Ratings Given Consistently?

🎯 Business Goal

Determine whether performance ratings differ unfairly across groups.

#🔍 Approach

Compared ratings by gender

Defined high performers (ratings ≥ 4)

Used chi-square tests and logistic regression

Controlled for job level

#📈 Key Findings

Initial gender differences appear in ratings

Job level explains most of the variation

Managers and salaried employees are more likely to be rated highly

#💡 Recommendation

Performance ratings are largely role-driven, but HR should continue monitoring for consistency.

🔹 Question 5: Improving Workplace Safety Using Data

#🎯 Business Goal

Identify factors contributing to workplace accidents and recommend improvements.

🔍 Approach

Merged HR, accident, overtime, and engagement data

Created an accident indicator

Analyzed trends by year and location

Built a logistic regression model

#📈 Key Findings

Accident rates increased significantly in 2017

Southfield and East Valley are high-risk locations

Overtime alone does not explain accidents

Employee disengagement is the strongest predictor of accidents

#💡 Recommendation

Improving engagement—especially in high-risk locations—should be part of the company’s safety strategy.

#✅ Final Executive Summary

Across all five questions, one theme consistently emerged:

Employee outcomes are driven by structure, workload, and engagement—not assumptions.

This project demonstrates how data can:

Improve hiring decisions

Reduce turnover and disengagement

Support fair pay and performance systems

Enhance workplace safety

#🚀 Skills Demonstrated

HR & People Analytics

Business problem framing

Statistical analysis

Regression modeling

Data visualization

Insight communication




