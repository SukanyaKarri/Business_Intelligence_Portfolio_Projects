                                                    *Student Depression Data Analysis*

**Overview**
- This project focuses on analyzing a student mental health dataset to understand which factors contribute most to student depression.
The goal is not just to look at individual attributes in isolation, but to explore how academic pressure, sleep patterns, financial stress, family history, and study habits relate to depressive tendencies among students.
  
  **Tableau Public Dasboard Link:** [https://public.tableau.com/app/profile/sukanya.k1148/viz/Tableau-Project-Student_Depression_Analysis/Student_Count_Analysis?publish=yes](https://public.tableau.com/app/profile/sukanya.k1148/viz/Tableau-Project-Student_Depression_Analysis/Student_Count_Analysis?publish=yes)

  **Data Sourcing & Understanding (Using SQL)**
  - The initial data exploration and validation were performed using SQL Server Management Studio (SSMS).
  
  **Data Import**
  - Connected to SQL Server
  - Selected the database
  - Imported the student dataset using:
    - Tasks → Import Flat File
  - Dataset contains:
     - 502 student records
     - 13 columns, including a newly created **Age_Group** & **Index_column**
 
   **Data Validation & Profiling**
  - Used INFORMATION_SCHEMA.COLUMNS to review column metadata
  - Created individual SQL queries to understand value distribution across key columns:
    - Sleep duration
    - Suicidal thought:
      - 0 → 242 students
      - 1 → 260 students
    - Sleep pattern
      - More than 8 hours → 128 students
      - Less than 8 hours → 123 students
    - Financial stress
      - 110 students reported the highest stress level
    - Family history of mental illness
      - 0 → 265
      - 1 → 237
    - Depression indicator:
      - 0 → 250
      - 1 → 252
  - ***At this stage, each column was analyzed individually.
These checks helped confirm distributions, but deeper insights required interlinking multiple attributes, which was later handled through visualization***

**Data Quality Checks**
  - No duplicate records found
  - Added an Index column using IDENTITY(1,1) for unique row identification
  - Updated data types:
    - Converted depression and family_history from BIT to VARCHAR
    - Transformed values from 0/1 to Yes/No and True/False for better readability

**SQL Scripts**
 - SQL queries were used to:
   - Validate null values
   - Check distributions
   - Update column formats
-***View SQL Script:*** [Tableau Student Depression Analysis – SQL Script](./TB1/SQL_Script/Tableau_Project_Udemy_Student_Dep_Analysis.sql)
   
  **Analysis & Reporting Using Tableau**

  **Data Connection Options**
  - Option 1: Connect Tableau Desktop (Trial) directly to SQL Server
  - Option 2: Export SQL results to Excel/CSV and load into Tableau Public
The second approach was used for Tableau Public compatibility.

  **Data Preparation in Tableau**
  - Cross-verified all data types after import
  - Converted Academic Pressure from Measure to Dimension:
    - Values range from 1 to 5
    - Represents categorical stress levels
    - Prevents incorrect aggregation by Tableau  
  
  **Charts Created**
  - Academic Pressure vs Student Count (Bar Chart)
    - Academic Pressure on Columns
    - Count of Index on Rows
    - Used CTRL selection to keep fields aligned
    - Helps understand how many students experience different pressure levels
  - Financial Stress vs Student Count
  - Suicidal Thoughts vs Student Count
  - Sleep Duration vs Student Count (Pie Chart)
  - Study Hours vs Student Count (Area Chart)
  - Percentage of Depression for students due to academic pressure is calculated using percent of total (Bar Chart)
 Each chart focuses on one contributing factor while maintaining consistent context across the analysis.
  
  **Dashboard**
  - Combined all relevant charts into a single interactive Tableau dashboard
  - Designed to allow users to visually compare factors contributing to depression without overwhelming complexity

    **Key Insights**

    Based on the analysis and dashboard exploration:
    - ***Academic pressure*** shows a strong presence across the student population, indicating it as a major stress contributor.
    - A nearly even split between ***depressed and non-depressed*** students highlights the seriousness and prevalence of mental health challenges.
    - ***Sleep deprivation*** appears frequently among students, suggesting a potential link between reduced sleep and mental well-being.
    - ***Financial stress*** affects a significant portion of students, reinforcing its role as a non-academic but impactful factor.
    - ***Family history*** shows a noticeable association, indicating that background factors may compound academic and lifestyle stress.
      
