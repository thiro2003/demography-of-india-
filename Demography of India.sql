-- Demographic Analysis
-- Retrieve the total population for each district.
select District_name,sum(Population) from data group by  District_name;
-- Find the top 10 districts with the highest population.
select  District_name,Population from data order by Population desc limit 10;
-- Calculate the male-to-female ratio for each district.
-- Identify the district with the highest literacy rate.
use census;
select District_name,Literate from data order by Literate desc limit 1;
-- Determine the number of districts with a population above 1 million.
select count(District_name) from data where Population>1000000;
-- Find the average literacy rate for each state.
select State_name,avg(Literate) from data group by State_name;
-- List districts where the female population is higher than the male population.
select District_name,Female-Male as diffirence  from data where Female>Male;

-- Calculate the percentage of the population in each age group (0-29, 30-49, 50) for each district.
select District_name,sum(Age_Group_0_29),sum(Age_Group_30_49),sum(Age_Group_50) from data group by District_name;
-- Find districts where the literacy rate is above 90%.
select round((Literate/Population)*100,1) as Lit_per from data where Lit_per>90;
-- List districts with more than 50% population in the age group 0-29.
select District_name,(Age_Group_0_29/Population)*100  as per from data where (Age_Group_0_29/Population)*100 >50;
-- Worker and Employment Analysis

-- Calculate the total number of workers (male and female) for each district.
select sum(Male_Workers+Female_Workers),District_name from data group by District_name;
-- Identify the district with the highest number of female workers.
select District_name,Female_Workers from data order by Female_Workers desc limit 1;
-- OR
select District_name,Female_Workers from data where Female_Workers=(select max(Female_Workers) from data);

-- Calculate the percentage of cultivator workers for each district.
select District_name,round((Cultivator_Workers/Population)*100,0)as percentage from data;
-- Determine districts where agricultural workers make up more than 30% of the workforce.
select District_name,(Agricultural_Workers/Workers)*100 from data where (Agricultural_Workers/Workers)*100> 30;

-- List the top 5 districts with the highest number of household workers.
select District_name,Household_Workers from data order by  Household_Workers desc limit 5;

-- Find the average number of workers (male and female) for each state.
select State_name,round(avg(Female_Workers),0) as Female ,round(avg(Male_Workers),0) as Male from data group by State_name;
-- Identify districts where female workers exceed male workers.
select District_name from data where Female_Workers>Male_Workers;
-- Calculate the ratio of cultivator workers to household workers for each district.
-- Find districts with no agricultural workers.
select District_name ,Agricultural_Workers from data where Agricultural_Workers=0;
-- List districts where the total workforce is less than 25% of the population.
select District_name,(Workers/Population)*100 from data where (Workers/Population)*100 <25;
-- Religion-Based Analysis
-- Calculate the percentage of Hindus in each district.
select District_name,(Hindus/Population)*100 from data ;
-- List districts with more than 40% Muslims in the population.
select District_name, (Muslims/Population)*100 from data where (Muslims/Population)*100>40;
-- Identify the district with the highest Christian population.
select District_name,max(Christians) from data group by District_name;
-- Find districts where Buddhists constitute at least 5% of the population.
select District_name,(Buddhists/Population)*100 from data where (Buddhists/Population)*100<=5;
-- Determine the average percentage of Jains across all districts.
select District_name,avg(Jains) from data group by District_name;
-- Retrieve districts where Sikhs and Christians combined are above 10% of the population.
select District_name,(Sikhs/Population)*100 + (Christians/Population)*100 as total_per from data where (Sikhs/Population)*100 + (Christians/Population)*100 >10;
-- List districts with no Hindus in the population.
select District_name from data where Hindus=0;
-- Identify districts where the Muslim population is less than 5%.
select District_name,(Muslims/Population*100 ) as muslim_percent from data where  (Muslims/Population*100 )<=5;
-- Calculate the proportion of different religions for each state.
SELECT 
    State_name,
    SUM(Hindus) AS Total_Hindus,
    SUM(Muslims) AS Total_Muslims,
    SUM(Christians) AS Total_Christians,
    SUM(Sikhs) AS Total_Sikhs,
    SUM(Buddhists) AS Total_Buddhists,
    SUM(Jains) AS Total_Jains,
    (SUM(Hindus) / SUM(Population)) * 100 AS Proportion_Hindus,
    (SUM(Muslims) / SUM(Population)) * 100 AS Proportion_Muslims,
    (SUM(Christians) / SUM(Population)) * 100 AS Proportion_Christians,
    (SUM(Sikhs) / SUM(Population)) * 100 AS Proportion_Sikhs,
    (SUM(Buddhists) / SUM(Population)) * 100 AS Proportion_Buddhists,
    (SUM(Jains) / SUM(Population)) * 100 AS Proportion_Jains
FROM 
    data
GROUP BY 
    State_name;

-- Find the top 3 districts with the highest diversity in religion (based on percentage distribution).

-- Education Level Analysis
-- Calculate the average secondary education level for each state.
select District_name,avg((Secondary_Education/Population)*100) from data group by District_name;
-- List districts where secondary education exceeds 60% of the population.
select District_name,(Secondary_Education/Population)*100 from data where (Secondary_Education/Population)*100>80;
-- Identify districts with the highest graduate education rate.
select District_name,(Graduate_Education/Population)*100 from data order by (Graduate_Education/Population)*100 desc limit 1;
-- Determine the percentage of districts with higher education rates above 20%.
select District_name,(Higher_Education/Population)*100 from data where (Higher_Education/Population)*100>20;
-- List the top 5 districts with the lowest secondary education levels.
select District_name,Secondary_Education from data order by Secondary_Education limit 5;
-- Find districts with at least 10% of the population having graduate education.
select District_name,(Graduate_Education/Population)*100 from data where (Graduate_Education/Population)*100>=10;
-- Calculate the difference between secondary and higher education percentages for each district.
select District_name,(Secondary_Education/Population)*100-(Higher_Education/Population)*100 from data ;
-- Retrieve districts with secondary education below the national average.
-- Identify districts where higher education rates exceed secondary education rates.
select District_name from data where Higher_Education>Secondary_Education;
-- Find the state with the highest average graduate education level.
select State_name,Graduate_Education from data order by Graduate_Education desc limit 1;
-- Age Group Analysis
-- Calculate the percentage of the population in each age group (0-29, 30-49, 50) by state.
select State_name,(Age_Group_0_29/Population)*100,(Age_Group_30_49/Population)*100,(Age_Group_50/Population)*100 from data;
-- Identify districts where more than half of the population is in the age group 0-29.
select District_name,(Age_Group_0_29/Population)*100 from data where (Age_Group_0_29/Population)*100>50;
-- List the top 10 districts with the highest proportion of the age group 30-49.
select District_name,Age_group_30_49 from data order by Age_Group_30_49 desc limit 10;
-- Find districts with the lowest proportion of the age group 50 and above.
select District_name,min((Age_Group_50/Population)*100) as m from data group by District_name;
-- Calculate the average population in each age group for all districts.
select District_name,avg(Age_Group_0_29), avg(Age_Group_30_49),avg(Age_Group_50) from data group by District_name;
-- Determine the age group distribution for each district as a percentage of the total population.
select District_name,((Age_Group_0_29/Population)*100, (Age_Group_30_49/Population)*100,(Age_Group_50/Population)*100 from data group by District_name ;

-- Identify districts where the age group 50 and above is less than 10%.
select District_name,(Age_Group_50/Population)*100 as percent from data where (Age_Group_50/Population)*100 <10;
-- Find the state with the highest number of people in the age group 30-49.
select State_name,Age_Group_30_49 from data order by Age_Group_30_49 desc limit 1;
-- List districts where the age group 0-29 makes up more than 70% of the population.
select District_name ,(Age_Group_0_29/Population)*100 from data where (Age_Group_0_29/Population)*100>70;
-- Calculate the total population for each age group across all districts.
select District_name,sum(Age_Group_0_29),sum(Age_Group_30_49),sum(Age_Group_50) from data group by District_name;
