   **Loan Transaction Analysis – KPI & Defaulter Insights**

***Project Requirement***
- Perform loan transaction analysis to identify key performance indicators (KPIs) and generate insights related to loan defaulters.

***Data Source***
- This project was developed using Power BI Dataflows (Gen1).

**Report Link**: [https://app.powerbi.com/groups/cc64e78d-7fe4-482e-b4c6-d9dc30b7775c/reports/368551af-8419-499d-90c7-e1ba3cff22ee/ac71807072348075c400?experience=power-bi](https://app.powerbi.com/groups/cc64e78d-7fe4-482e-b4c6-d9dc30b7775c/reports/368551af-8419-499d-90c7-e1ba3cff22ee/ac71807072348075c400?experience=power-bi)

**Dashboard link** : [https://app.powerbi.com/groups/cc64e78d-7fe4-482e-b4c6-d9dc30b7775c/dashboards/d99d341b-43a2-4805-938b-c3c3b4e48b91?experience=power-bi](https://app.powerbi.com/groups/cc64e78d-7fe4-482e-b4c6-d9dc30b7775c/dashboards/d99d341b-43a2-4805-938b-c3c3b4e48b91?experience=power-bi)


**On-Premises Data Gateway**
- Why Data Gateway is Required
The On-Premises Data Gateway enables Power BI Service (cloud) to securely connect to data sources hosted locally (on-premises), such as SQL Server installed on a local machine or internal server.

- It is required when:
   - Connecting Power BI Service to a local SQL Server
   - Enabling scheduled or incremental refresh
   - Maintaining secure data access between local and cloud environments

**What is On-Premises?**
- On-premises refers to data that resides locally within an organization’s internal infrastructure rather than in the cloud.

**Steps to Download and Configure Data Gateway**
- Create a new workspace in Power BI Service.
- Click on Downloads → Download Data Gateway.
- Select Standard Mode
  - Personal Mode → Used for individual desktop usage
  - Standard Mode → Used for enterprise-level shared access
- Install the gateway.
- Configure:
   - Provide gateway name
   - Create a recovery key
- Complete configuration and close the application
- If deleted later from Power BI Service:
   - Open On-Premises Gateway
   - Re-register using Power BI account

**SQL Server**
- Data was imported into SQL Server.
- Data cleaning performed:
   - Duplicate removal
   - Null value validation
   - [View SQL Script Here] [BI3- Loan Default Overview/source/SQL- Script.sql]

**Power BI Service**
- Power BI Service acts as a self-service BI platform used to:
- Connect to SQL Server via gateway
- Create Dataflows
- Perform cloud-based transformations

**Dataflow Configuration (Gen1)**

Why Gen1?
- Provides data cleaning and transformation capabilities.
- Centralized data preparation before loading into reports.

Steps:
- Select Gen1.
- Click New Table.
- Select SQL Server Database.
- Set connection type to On-Premises.
- Username:
  - Run whoami in CMD
  - Paste username
- Password:
  - Use Windows password.

  **Pulling Data into Power BI Desktop**
- Select Get Data
- Choose Dataflow (Source)
- Load Data
- Click Transform Data

**Data Profiling**
Performed the following checks:
- Data types validation
- Duplicate checks
- Null value identification
- Column formatting
- Column renaming where required

**Data Validation & DAX**
   **Why Data Validation?**

To avoid inconsistencies and ensure accuracy between:
- Source data (Excel / SQL)
- Power BI visual outputs

Validation performed using:

- Pivot tables in Excel
- Tables/Matrices in Power BI
- Cross-checking calculated values

**Page 1 – Loan Default Analysis**

Visual Design
- Inserted shape for title header.
- Used line charts for trend analysis.

Calculated Column
- Year (Extracted from Loan_Date)

Note:
- Calculated columns are created in Data View using DAX, not in Power Query.

**DAX Measures**
- Loan Amount by Purpose- Line chart (Purpose vs Loan Amount Default)
- Average Income by Employment Type
- Used:
 - CALCULATE
 - FILTER
 - ALLEXCEPT
- Default Rate by Employment Type
- Used:
  - Variables
  - COUNTROWS
  - ALL
  - ALLEXCEPT
- Age Group (Calculated Column)
- Average Loan by Age Group
- Default Rate by Year
- Logic:
  - Defaults in a year ÷ Total loans in the same year

Important Note:
-The default rate per year considers:
 - Defaults occurring in that specific year
 - Divided by total loans in that year
***All analysis on Page 1 is displayed using Line Charts.***

**Page 2 – Applicant Demographic & Financial Profile**

**DAX Measures**
- Median Loan Amount by Credit Score Bin
    - Used:MEDIANX
    - Visual: Card (KPI), later used line chart
- Validation:
   - Sorted data
   - Calculated median manually
   - Cross-verified using index
- Average Loan Amount (High Credit)
   - Used: AVERAGEX & FILTER
- Total Loan (Credit Bins – Adults)
   - Used: CALCULATE , SUM & ALLEXCEPT
- Additional Excel validation: IF(AND(B2>=20,B2<=39),"Adults","NA")
- Total Loans (Middle Age)
  - Used:SUMX 
  - Visual: Clustered Column Chart
- Loan by Education Type
   - Visual: Line Chart
- Visual Used: Donut Chart (Average Loan by Age Group & Marital Status)

**Page 3 – Metrics & KPI**

**DAX Measures**
- YOY Loan Amount Change
   - Formula:((Current Year – Previous Year) / Previous Year) * 100
   - Visual: Line Chart
- YOY Default Loan Change
   - Visual: Line Chart
- YTD Loan Amount
   - Visual: Ribbon Chart
- Income Bracket (Calculated Column)
   - Used: SWITCH function-***I used SWITCH(TRUE()) to divide income into categories like Low, Middle, and High. This helped me analyze the data layer by layer and understand patterns in loan defaults more clearly.***
   - Visual: Decomposition Tree

  **Data Refresh Types**
  - Manual Refresh
  - Scheduled Refresh
  - Incremental Refresh

  **Scheduled Refresh**
  - Workspace → Dataset → Schedule Refresh
  - Set daily/weekly frequency

**Incremental Refresh**
  - Change column data type to Date/DateTime
  - Configure incremental refresh policy
  - Select column
  - Define period
  - Enables partial data refresh instead of full refresh

Both Scheduled and Incremental Refresh were implemented for Dataflow.

To refresh report:
  - Go to Semantic Model
  - Configure Schedule Refresh

**Summary**
- This project demonstrates:
    - End-to-end loan transaction analysis
    - SQL data validation
    - Dataflow-based transformation
    - On-premises gateway configuration
    - DAX-based KPI development
    - Multi-page analytical reporting
    - Cross-platform data validation (Excel + Power BI)
    - Scheduled and incremental refresh implementation
