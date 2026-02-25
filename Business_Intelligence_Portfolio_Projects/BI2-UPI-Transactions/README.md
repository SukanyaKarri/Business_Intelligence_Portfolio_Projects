                                             UPI Transaction Data Analysis using Power BI 
                                            
**Problem Statement:**
- Analyzing the UPI Transaction dataset to understand transaction behavior, customer patterns, and trends.

**Dashboard Link :**
https://app.powerbi.com/groups/me/dashboards/1d8e0d4a-2f88-4457-9375-631150342d77?experience=power-bi

**Data Profiling:**

- Renamed columns for better clarity and consistency.
-  Cross-verified data types:
   - Converted exponential data types to text format for Customer Account Number and Merchant Account Number
   - Ensured that no zero values appeared after conversion.
-  Removed duplicate records.
-  Used Delimiter to split Transaction Date & Time:
    - Removed the date column post-split, as the date was identical across records.
    - Retained Transaction Time, as it provided more analytical value.
- Verified transaction uniqueness:
    - Found 990 unique and distinct Transaction IDs.
    - Identified 995 distinct and 990 unique time values.
    - Although Transaction IDs were already unique, the 5 additional time values were cross-verified and confirmed to have no duplication issues.

**Formatting & Resizing for Perfect Slicer Layout (Page 1 Report)**
- Designed the slicer layout manually for a clean and consistent UI.
- Total canvas size assumed: 1280 × 720
- Spacing between slicers maintained at 20 px
- Total horizontal spacing:
    - 6 gaps × 20 = 120 px
- Available width for slicers:
    - 1280 − 120 = 1160 px
- Number of slicers in one row: 5
- Width of each slicer:
   - 1160 ÷ 5 = 232 px

**Slicer Positioning Details**
            
            - slicer 1
             -- Size: Height 80 | Width 232
             -- Position: Horizontal 20 | Vertical 20

            - slicer 2
              -- Size: Height 80 | Width 232
             -- Postion section Horizontal- 272 ( 232+20+20)| vertical-20

           - slicer 3
             -- Size: Height 80 | Width 232
             -- Position: Horizontal- 524 ( 232+232+20+20+20)| vertical-20

           - slicer 4
             -- Size: Height 80 | Width 232
             -- Position: Horizontal- 776 ( 232+232+232+20+20+20+20)| vertical-20

            - slicer 5
             -- Size: Height 80 | Width 232
             -- Position: Horizontal- 1028 (232+232+232+232+20+20+20+20+20)|vertical-20

      
      
      
  **Calculated column**
       - Created a calculated column for Age Group classification.
       
        - **Formula Snippet:**
           - Age-group =IF (upi[customerAge] <= 25, "A1",IF (upi[customerAge] <= 35, "A2", "A3"))
  
  **Line Chart Analysis**
  - Created a Line Chart to analyze monthly transaction trends:
     - X-axis: Transaction Month (2024 data)
     - Y-axis: Transaction Amount
  - Applied Age Group filters to analyze transactions by age segment.
  - Removed the Currency column to focus purely on transaction behavior across months.
  
  **Page2 Report**
  - Created a Matrix Visual to analyze:
    - Rows: Transaction Date (Month)
    - Columns: City → Currency (Hierarchy)
    - **Values**
      - Sum of Amount
      - Sum of Remaining Balance
  - Implemented Hierarchy with Drill Down / Drill Up interaction.
  - Used column formatting:
    - Decimal places set to 0
    - Values separated by commas for better readability.
      
   **Sync Slicers**
   - Enabled Sync Slicers across multiple pages to maintain consistent filter selections
   - Applied conditional formatting to highlight:
     - High transaction values
     - Low transaction values

   **BookMarks**
   - Implemented bookmarks to switch between Line Chart and Column Chart:
     - Created separate bookmarks for each chart.
     - Managed visibility using Selection Pane.
     - Updated bookmarks accordingly.
   - Added Bookmark Navigator:
      - Insert → Buttons → Navigator → Bookmark Navigator
      - Used Selection Navigation for seamless chart switching.

***User Tip:***
  - Use Ctrl + Click on the required chart in the navigator pane to switch between visuals.

    ***Key Insights***

   **Transaction Behavior Over Time**
      - Monthly transaction trends for 2024 help identify peak and low transaction periods.

  **Customer Age-Based Analysis**
     - Age group classification (A1, A2, A3) allows comparison of transaction volume and value across age segments.

  **Geographical & Currency Insights**
    - Matrix visual with city and currency hierarchy provides granular insight into regional transaction distribution.

  **Account & Balance Monitoring**
    - Remaining balance analysis helps assess post-transaction financial behavior.

  **User-Centric Design**
    - Manually calculated slicer layout ensures a clean, consistent, and user-friendly dashboard experience.

  **Enhanced Interactivity**
    - Drill-downs, synced slicers, and bookmarks improve exploratory analysis without cluttering the report.

             
