Create database Loan
use Loan

select * from loan_default

-- to see the columns
select column_name from INFORMATION_SCHEMA.COLUMNS where table_name='loan_default'

-- filter the count of duplicates -- checking for all columns
select  count(*) as dup from loan_default
group by loanid
having count(*) >1

SELECT count(*) as dup  
FROM loan_default
GROUP BY 
    loanid,age,income,loanamount,CreditScore,MonthsEmployed,NumCreditLines,InterestRate,
    LoanTerm,DTIRatio,Education,EmploymentType,MaritalStatus,HasMortgage,HasDependents,LoanPurpose,
    HasCoSigner,Loan_Date_DD_MM_YYYY
having count(*)>1;

-- other way
SELECT *
FROM (
    SELECT *,
           COUNT(*) OVER (
               PARTITION BY loanid, income, age,EmploymentType
           ) AS dup_count
    FROM loan_default
) t
WHERE dup_count > 1;

-- filter the null value -- checking for all columns
select * from loan_default
where loanid is null;

SELECT *
FROM loan_default
WHERE loanid IS NULL
   OR age IS NULL
   OR income IS NULL;

SELECT
    SUM(CASE WHEN loanid IS NULL THEN 1 ELSE 0 END) AS loanid_nulls,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS customerid_nulls,
    SUM(CASE WHEN income IS NULL THEN 1 ELSE 0 END) AS amount_nulls,
    SUM(CASE WHEN LoanPurpose IS NULL THEN 1 ELSE 0 END) AS default_nulls,
    SUM(CASE WHEN EmploymentType IS NULL THEN 1 ELSE 0 END) AS date_nulls
FROM loan_default;




SELECT DB_NAME();

-- checking length of columns or rows?
select count(LoanID) from Loan_default

