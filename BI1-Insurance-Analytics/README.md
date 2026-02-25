**Power BI Insurance Analytics Dashboard**
 
 **Overview**
- An end-to-end Insurance Analytics Dashboard built in Microsoft Power BI, focusing on policy performance, customer demographics, premium vs claim insights, sentiment analysis, and role-based security.
- This project demonstrates data preparation, analytical thinking, Python integration, Power Query transformations, interactive reporting, and secure deployment. Designed as a portfolio project for BI/Data Analyst roles.

**Live Dashboard (Power BI Service)**
- https://app.powerbi.com/groups/me/dashboards/e2968347-5e42-4d0c-94b8-24ff8ab6ffc1?experience=power-bi

**Business Problem**
- Insurance stakeholders need a single dashboard to:
- Monitor premium and claim amounts
- Understand customer demographics
- Analyze policy performance
- Evaluate customer feedback sentiment
- Restrict data access by policy type

This dashboard addresses those needs through interactive visuals, drill-through analysis, and row-level security.

**Skills Demonstrated**
- Power BI Desktop & Power BI Service
- Data Profiling & Data Transformation
- Power Query (M Language)
- Python Scripting inside Power BI
- Interactive Visual Design
- Drill-Through Navigation
- Sentiment & Semantic Analysis (rule-based)
- Row-Level Security (RLS)
- Dashboard Publishing & Sharing

***Note: This project intentionally does not use DAX. All calculations were handled using Power Query, Python, and built-in aggregations.***

**Project Assets**

- .pbix Power BI report file
- Published Power BI dashboard
- Saved report screenshots
- Python script for sentiment scoring
- Power Query conditional column logic

**Dashboard Features & Analysis**
***Data Profiling***
- Initial exploration and validation of insurance data
- Column standardization and preparation for analysis

**Premium & Claim Metrics**

Cards used to display:
- Total Premium Amount
- Total Claim Amount

Enables quick executive-level insights

**Comparative Analysis**

Ribbon Chart used to compare values across dimensions

**Filters & User Interactivity**
- Dropdown slicers for flexible filtering
- All visuals respond dynamically to selections

**Customer Demographics Analysis** -Created:

**Age Group column**
- Active / Inactive customer column

***Visuals used:***
- Line Chart → Age group trends
- Donut Chart → Active vs Inactive distribution

**Drill-Through Analysis**

Drill-through enabled using Policy Type-Navigation between:
- Main overview page
- Detailed policy-specific pages

Improves focused analysis without cluttering visuals

## Sentiment & Semantic Analysis

Due to **Power BI AI Insights limitations**, sentiment analysis was implemented
using **rule-based logic** through **Power Query (M Language)** and **Python scripting**.

### Power Query (M Language) – Semantic Score
A conditional column was created to assign **semantic scores** based on
keyword matching in customer feedback.

**View M Query Code**  
- [View M-Query Code](./Scripts/M_Query_Semantic_Score.txt)

 ###  Python Script – Sentiment Scoring & Labeling
Python was used inside Power BI to:
- Calculate sentiment scores
- Classify feedback as **Positive, Neutral, or Negative**

**View Python Script**  
- [View Python-Script Code](./Scripts/Python_Semantic_Score_PowerQuery.txt)

**Sentiment Visualization**
- Bar Chart created to analyze:
 - count of Sentiment score using score categories *positive*,*negative*,*netural* sentiment based on 

- **Word-Cloud Visulaization**
   - A Word Cloud visualization was used to highlight frequently occurring
keywords in customer feedback, helping identify dominant themes,
common concerns, and positive expressions that complement the
sentiment score analysis

- <img width="1584" height="993" alt="Image" src="https://github.com/user-attachments/assets/08d03b61-0c7d-4c87-8d31-4c45729efc4c" />

**Sentiment Score**
- Helps identify patterns in customer feedback quality

**Security & Access Control**
- Row-Level Security (RLS) implemented
- Roles created by Policy Type:
  - Health
  - Travel
- Ensures users see only authorized data

**Deployment**
- Report published to Power BI Service
- Dashboard accessible via live link

**Key Takeaways**
- Demonstrates real-world Power BI development workflow
- Shows problem-solving under licensing constraints
- Focuses on clean logic, transparency, and usability

