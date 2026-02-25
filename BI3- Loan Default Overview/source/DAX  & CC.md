
**DAX1:** Year = YEAR('Loan_default'[Loan_Date])

**Why used:**
- Extracts year from loan date.
- Enables year-wise trend and YOY analysis.

**DAX2:** Loan Amount by Purpose =sumx(filter('Loan\_default',NOT(ISBLANK('Loan\_default'\[Loan\_Amount]))),'Loan\_default'\[Loan\_Amount])

or

**DAX2:** Loan Amount by Purpose =CALCULATE(SUM('Loan_default'[Loan_Amount]),NOT(ISBLANK('Loan_default'[Loan_Amount])))

**Why used:**
 - Calculates total loan amount.
 - Ignores blank loan records.

**DAX3**: Default Rate by Employment Type =
VAR TotalRecords =
    CALCULATE(
        COUNTROWS('Loan_default'),
        ALLEXCEPT('Loan_default', 'Loan_default'[Employment_Type])
    )

VAR DefaultCases =
    CALCULATE(
        COUNTROWS('Loan_default'),
        'Loan_default'[Default] = TRUE(),
        ALLEXCEPT('Loan_default', 'Loan_default'[Employment_Type])
    )

RETURN
DIVIDE(DefaultCases, TotalRecords)

**Why used:**
- Calculates % of defaults within each employment type.
- Keeps Employment Type filter but removes others.


**DAX4**: Average Loan by Age Group =
CALCULATE(
    AVERAGE('Loan_default'[Loan_Amount])
)

**Why used:**
- Finds average loan amount.
- Changes dynamically per selected age group.

**DAX5:** Default Rate by Year =
VAR TotalLoans =
    CALCULATE(
        COUNTROWS('Loan_default'),
        ALLEXCEPT('Loan_default', 'Loan_default'[Year])
    )

VAR DefaultLoans =
    CALCULATE(
        COUNTROWS('Loan_default'),
        'Loan_default'[Default] = TRUE(),
        ALLEXCEPT('Loan_default', 'Loan_default'[Year])
    )

RETURN
DIVIDE(DefaultLoans, TotalLoans) * 100

 **Why used:**
 - Calculates yearly default percentage.
 - Compares defaults only within same year


**DAX6:** Median by Credit Score Bins- Median Loan Amount = MEDIANX('Loan_default', 'Loan_default'[Loan_Amount])

**Why used:**
- Finds middle loan value.
- Less affected by extreme values.

**DAX7 :** Average Loan Amount (High Credit) =
CALCULATE(
    AVERAGE('Loan_default'[Loan_Amount]),
    'Loan_default'[Credit score Bins] = "High"
)

**Why used:**
- Calculates average loan for high credit customers.
- Helps compare risk segments.

**DAX8:** Total Loan (Adults) =
CALCULATE(
    SUM('Loan_default'[Loan_Amount]),
    'Loan_default'[Age Groups] = "Adults"
)

**Why used:**
- Sums loans only for adult category.
- Used for demographic segmentation.

**DAX9:** Total Loans (Middle Age) =
CALCULATE(
    SUM('Loan_default'[Loan_Amount]),
    'Loan_default'[Age Groups] = "Middle Age"
)

**Why used:**
- Calculates total exposure for middle-age borrowers.
- Helps identify dominant borrowing group.

**DAX10:** Loan by Education Type =
COUNTROWS(
    FILTER(
        'Loan_default',
        NOT(ISBLANK('Loan_default'[Loan_ID]))
    )
)

**Why used:**
- Counts valid loan records.
- Used to compare education-based distribution.

**DAX11:** YOY Loan Amount Change =
VAR CurrentYear =
    SUM('Loan_default'[Loan_Amount])

VAR PreviousYear =
    CALCULATE(
        SUM('Loan_default'[Loan_Amount]),
        SAMEPERIODLASTYEAR('Loan_default'[Loan_Date])
    )

RETURN
DIVIDE(CurrentYear - PreviousYear, PreviousYear, 0)


**Why used:**
- Measures yearly growth in loan disbursement.
- Identifies increasing or declining lending trends.

**DAX12:** YOY Default Loan Change =
VAR CurrentDefaults =
    CALCULATE(
        COUNTROWS('Loan_default'),
        'Loan_default'[Default] = TRUE()
    )

VAR PreviousDefaults =
    CALCULATE(
        COUNTROWS('Loan_default'),
        'Loan_default'[Default] = TRUE(),
        SAMEPERIODLASTYEAR('Loan_default'[Loan_Date])
    )

RETURN
DIVIDE(CurrentDefaults - PreviousDefaults, PreviousDefaults, 0)

**Why used:**
- Tracks yearly change in default count.
- Helps monitor credit risk trend.

**DAX13:** YTD Loan Amount =
CALCULATE(
    SUM('Loan_default'[Loan_Amount]),
    DATESYTD('Loan_default'[Loan_Date])
)

**Why used:**
- Calculates total loans till current date in year.
- Helps track progress against yearly targets.

**Income Bracket (Calculated Column)**
Income Bracket =
SWITCH(
    TRUE(),
    'Loan_default'[Income] < 30000, "Low Income",
    'Loan_default'[Income] >= 30000 && 'Loan_default'[Income] < 60000, "Medium Income",
    'Loan_default'[Income] >= 60000, "High Income"
)

**Why used:**
- Converts continuous income into categories.
- Enables layered breakdown analysis.
