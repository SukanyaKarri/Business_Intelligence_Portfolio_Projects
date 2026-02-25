use test

select * from [dbo].[Depression+Student+Dataset];

-- check nulls

select Gender, count (*) as Gender_count from [dbo].[Depression+Student+Dataset]
group by gender;


select * from [dbo].[Depression+Student+Dataset]
where gender is null;

update [dbo].[Depression+Student+Dataset]
set Gender='F' where Gender ='Female'

update [dbo].[Depression+Student+Dataset]
set Gender='M' where Gender ='Male'

select Gender, count (*) as Gender_count from [dbo].[Depression+Student+Dataset]
group by gender;


-- Checking the age column
select age,count (*) [Age_count] from [dbo].[Depression+Student+Dataset]
group by age
order by age desc

-- Creation of Age_group column 
Alter table [dbo].[Depression+Student+Dataset]
add Age_group ;

-- Missed to add datatype so added using alter column
Alter table [dbo].[Depression+Student+Dataset]
Alter column Age_group VARCHAR(6);

--Validation check
select * from [dbo].[Depression+Student+Dataset]

-- updating values to age_group column
update [dbo].[Depression+Student+Dataset]
set age_group =
case when age between 18 and 24 then 'A1' 
else
case when age between 25 and 30 then 'A2'
else 'A3' 
end 
end

-- Data Understading using information_schema

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME LIKE 'Depression%Student%';

-- or 

select * from information_schema.columns
where table_schema ='dbo'
and table_name='Depression+Student+Dataset'

-- for fetching column count 
select count(*) [table_columns] from information_schema.columns  where table_name like 'Depression%student%'

-- Fiter each column to understand the frquncy of each column
select Academic_Pressure,count(*) [Rating_range] from [dbo].[Depression+Student+Dataset]
group by Academic_Pressure

select Study_Satisfaction,count(*) [Satisfaction_score] from [dbo].[Depression+Student+Dataset]
group by Study_Satisfaction

select Sleep_Duration, count(*) [Total_duration] from [dbo].[Depression+Student+Dataset]
group by Sleep_Duration

select Dietary_Habits, count(*) [Glance@Habits]from [dbo].[Depression+Student+Dataset]
group by Dietary_Habits

select Have_you_ever_had_suicidal_thoughts, count(*)[frequnecy] from [dbo].[Depression+Student+Dataset]
group by Have_you_ever_had_suicidal_thoughts

select Study_Hours, count(*)[Number_of_Hours] from [dbo].[Depression+Student+Dataset]
group by Study_Hours 

select Financial_Stress, count(*) [How_Much?]from [dbo].[Depression+Student+Dataset]
group by  Financial_Stress

select Family_History_of_Mental_Illness, count(*)[Past_track] from [dbo].[Depression+Student+Dataset]
group by Family_History_of_Mental_Illness

select Depression, count(*)[Factors] from [dbo].[Depression+Student+Dataset]
group by Depression

select age_group,count(*) as age_group_count from [dbo].[Depression+Student+Dataset]
group by age_group;

-- checking duplicates
SELECT COUNT(*) AS cnt
FROM [dbo].[Depression+Student+Dataset]
GROUP BY 
    age,
    gender,
    Depression,
    Have_you_ever_had_suicidal_thoughts,
    Academic_Pressure,
    Study_Satisfaction,
    Sleep_Duration,
    Dietary_Habits,
    Study_Hours,
    Financial_Stress,
    Family_History_of_Mental_Illness,
    Age_group
HAVING COUNT(*) > 1;

-- No duplicates are found--

-- Creattion of index column

alter table  [dbo].[Depression+Student+Dataset]
add Index_column int identity(1,1) -- 1 row and it keeps incrementing by 1

select * from [dbo].[Depression+Student+Dataset]


update [dbo].[Depression+Student+Dataset]
set Depression='No' where Depression='0'  --- Query has datatype issue

select * from information_schema.columns where table_name= 'Depression+Student+Dataset'

alter table [dbo].[Depression+Student+Dataset]
alter column depression varchar(max); -- used this to fix the above depression data_type issue

update [dbo].[Depression+Student+Dataset]
set Depression='Yes' where Depression='1'



-- similarly doing it for few other columns 
alter table [dbo].[Depression+Student+Dataset]
alter column [Have_you_ever_had_suicidal_thoughts] varchar(max)

alter table [dbo].[Depression+Student+Dataset]
alter column [Family_History_of_Mental_Illness] varchar(max); 

  update [dbo].[Depression+Student+Dataset]
  set [Have_you_ever_had_suicidal_thoughts]=
  case 
  when [Have_you_ever_had_suicidal_thoughts]='1' then 'True'
  when [Have_you_ever_had_suicidal_thoughts]='0' then 'False'
  else null
  end;

update [dbo].[Depression+Student+Dataset]
set [Family_History_of_Mental_Illness]='True' Where [Family_History_of_Mental_Illness]='1'
update [dbo].[Depression+Student+Dataset]
set [Family_History_of_Mental_Illness]='False' Where [Family_History_of_Mental_Illness]='0'

select * from [dbo].[Depression+Student+Dataset]
