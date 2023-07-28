## Tesla Car Sales Data Analysis


## Project Overview:

The primary objective of this sales data analytics project is to uncover valuable insights and patterns within Tesla car's sales data, ultimately leading to enhanced sales performance. Through a comprehensive analysis of sales data across various regions, products, and time frames, we aim to identify top-performing products, high-performing regions, and the most profitable time periods. By leveraging this information, we can fine-tune our sales strategies, optimize overall performance, and drive substantial revenue growth.



## Data Description

The dataset employed in this analysis was obtained from the Kaggle website. It encompasses a comprehensive collection of information concerning the cars sold by the company. The dataset includes essential details such as car models, versions, countries of sale, customer purchase types, car prices, sales figures, and gross profits. This rich dataset forms the foundation for our in-depth analysis aimed at extracting valuable insights to enhance the company's sales performance and overall profitability.

### Data Dectionary

This dataset contains 7 columns and 924 rows.

| Column Name                | Column Datatype |
| :------------------------- | :-------------: |
| Model                      |  VARCHAR(50)    |
| Period                     |     DATE        |
| Country                    |  VARCHAR(50)    |
| Purchase_type              |  VARCHAR(50)    |
| Version                    |  VARCHAR(50)    |
| Price                      |  DECIMAL(10,3)  |
| Gross_Profit               |  DECIMAL(10,3)  |




## Methodology 

1. **Data Collection:**
   - The dataset employed in this analysis was obtained from the Kaggle website.

2. **Data Understanding:**

   - Explored the dataset's structure, including available columns, data types, and data dictionary to gain familiarity.
   - Identified and clarified the specific business questions or objectives that require insights from the dataset.

3. **Data Assessment:** 
   - Thoroughly assessed data quality and structure to identify and resolve potential issues or inconsistencies. This included detecting missing values, outliers, inconsistent formatting, and data entry errors.

4. **Data Cleaning and Data Validation Process:**
##### my role in data cleaning and data validation involved several tasks to ensure the data was in a usable and reliable format. Here are some key steps I took:
   - First, I cleaned the data in Excel and adjusted the date format.
   - Added constraints to the data in Microsoft SQL Server, like a `Primary Key` for uniqueness and data integrity.
   - Chose appropriate `data types` for accurate storage and manipulation of data.
   - Enforced `NOT NULL` constraints on relevant columns to ensure data completeness and prevent the insertion of null values.
 
     

## Exploratory Data Analysis (EDA):

##### Some of the business questions I've answered based on the data:

1.  Determine the number of unique car models in the data?
2.  What is the total number of sales transactions in the dataset?
3.  Which purchase type is most commonly used by people?
4.  Which car version is the most popular among buyers?
5.  What is the cumulative gross profit for both the first and second quarters of the year 2016?
6.  What is the total sales for the first and second quarters of the year 2016?
7.  What is the most frequent purchase type?
8.  What is the car version with the highest price?
9.  Which car version is generating the highest total sales?
10. How does the average gross profit vary across different car versions for each country?
11. what is the most sold car version in each country?
12. Which car version is generating the highest total gross profit?
13. Which Tesla car models do we have in our dataset?
14. What is the total gross profit and sales for each country?
15. Which model has the highest total gross profit?
16. What is the average sales price for each car model?
17. How many car models were sold in the US in January 2016?
18. Which country had the highest demand for Tesla cars?
19. How many unique car models were sold in Australia in January 2016?
20. What was the total gross profit generated from all sales in Germany?
21. What is the distribution of purchase types for each car model?
22. What is the average price of all cars sold in the US?
23. Which car version had the highest price in the US?
24. Which car version had the highest price in Australia?
25. What was the total sales generated from all sales in Australia?
26. Which country had the highest total sales?
27. Which country had the highest number of cash purchases?
28. What is the total sales for each purchase type?
29. What is the average gross profit for each purchase type?
30. How many different car versions were sold in the US?
31. What is the distribution of car prices in the US for January 2016?
32. What is the highest car price in each country
33. Which purchase type is most commonly used in each country?
34. Which car model generated the highest gross profit in Germany?
35. How many sales transactions were made for each car model in the US?
36. What is the total gross profit for each car model in the dataset?
37. Which country had the highest average sales for the car models sold?
38. what is the most sold car Model in each country
39. What was the most common purchase type for Model S in Germany?
40. What is the total gross profit generated from each car version in the US?
41. How many sales transactions were made for each car version in the US?
42. What was the most popular car model in terms of sales volume?
43. How does the average price vary for different purchase types in the US?
44. What is the monthly gross profit for each month?
45. Calculating the average car price and gross profit
46. Calculating the standard deviation of price and gross profits
47. Is there a correlation between car price and gross profit?

## Query types used:



3. #### Writing Scripts For Questions Listed

#### 1. To understand the most paid career

```sql
-- To understand the most paid career
SELECT
	Department,
    SUM(Salary) AS sum_salary
FROM HR_data
GROUP BY Department
ORDER BY sum_salary DESC;
```

#### 2. What is the average salary of each category?

```sql
-- What is the average salary of each category?
SELECT
	Department,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY Department
ORDER BY avg_salary DESC;
```

#### 3. How does gender affect the salary of an employee

```sql
-- How does gender affect the salary of an employee
SELECT
	Department,
    Sex,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY Department, Sex
ORDER BY Department, RaceDesc;
```

#### 4. How does race(white/black/Asian...) affect the salary of an employee?

[Gain understanding of CTEs in MySQL](https://youtu.be/GbRvy-fZ_r0)

```sql
-- How does race(white/black/Asian...) affect the salary of an employee
WITH CTE_tbl1 AS (SELECT
	Department,
    RaceDesc,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY Department, RaceDesc)
SELECT
	*,
    ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Department, avg_salary DESC) AS position
FROM CTE_tbl1;
```

#### 5. How does race(white/black/Asian...) affect employee position?

[Gain understanding of CTEs in MySQL](https://youtu.be/GbRvy-fZ_r0)

```sql
-- How does race(white/black/Asian...) affect employee position?
WITH cte_tbl AS (SELECT
	Position,
    RaceDesc,
    COUNT(Position) AS cnt_pos
FROM HR_data
GROUP BY Position, RaceDesc)
SELECT
	*,
    ROW_NUMBER() OVER(PARTITION BY Position ORDER BY cnt_pos DESC) AS rank_position
FROM cte_tbl;
```

#### 7. What is the most common recruitement source and how does recruitement source affect salary and EmpSatisfaction?

```sql
-- What is the most common recruitement source and how does
-- recruitement source affect salary and EmpSatisfaction?
SELECT
	RecruitmentSource,
    AVG(Salary) as avg_salary,
	COUNT(RecruitmentSource) AS count
FROM HR_data
GROUP BY RecruitmentSource
ORDER BY avg_salary DESC;
```

#### 8. What is the categorization count for EmploymentStatus?

[Gain understanding of Sub-queries in MySQL](https://youtu.be/ryrLlxFt48Q)

```sql
-- What is the categorization count for EmploymentStatus?
SELECT
	*,
    ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Department DESC) AS status_rank
FROM(SELECT
	Department,
    EmploymentStatus,
    COUNT(EmploymentStatus) AS status
FROM HR_data
GROUP BY Department, EmploymentStatus
ORDER BY Department, status DESC) AS subquery;
```

![Image  08](./images/image_08.png)

#### 9. What is the average salary based on department?

```sql
-- What is the average salary based on department?
SELECT
	Department,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY Department
ORDER BY avg_salary DESC;
```

![Image  09](./images/image_09.png)

#### 10. Which state has the most paid salary?

```sql
-- Which state has the most paid salary?
SELECT
	State,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY State
ORDER BY avg_salary DESC;
```

![Image  10](./images/image_10.png)

#### 11. What is the most common reason for termination?

```sql
-- What is the most common reason for termination?
SELECT
	TermReason,
    COUNT(TermReason) AS count
FROM HR_data
GROUP BY TermReason
ORDER BY count DESC;
```

![Image  11](./images/image_11.png)

#### 12. What is the most common reason for termination by race?

```sql
-- What is the most common reason for termination by race?
SELECT
	RaceDesc,
	TermReason,
    COUNT(TermReason) AS count
FROM HR_data
GROUP BY TermReason, RaceDesc
ORDER BY RaceDesc, count DESC;
```

![Image  12](./images/image_12.png)

#### 13. What is the most common EmploymentStatus?

```sql
-- What is the most common EmploymentStatus?
SELECT
	EmploymentStatus,
    COUNT(EmploymentStatus) AS count
FROM HR_data
GROUP BY EmploymentStatus
ORDER BY count DESC;
```

![Image  13](./images/image_13.png)

#### 14. Which recruitment source give employees with best performance score?

```sql
-- Which recruitment source give employees with best performance score?
SELECT
	RecruitmentSource,
    PerformanceScore,
    COUNT(PerformanceScore) AS perf_cnt
FROM HR_data
GROUP BY RecruitmentSource, PerformanceScore
ORDER BY RecruitmentSource, PerformanceScore;
```

![Image  14](./images/image_14.png)

#### 15. Which department has the most absenties?

```sql
-- Which department has the most absenties?
SELECT
	Department,
    SUM(Absences) AS absence_cnt
FROM HR_data
GROUP BY Department
ORDER BY absence_cnt DESC;
```

![Image  15](./images/image_15.png)



#### 16. Which race has the most absenties?

```sql
-- Which race has the most absenties?
SELECT
	RaceDesc,
    SUM(Absences) AS absence_cnt
FROM HR_data
GROUP BY RaceDesc
ORDER BY absence_cnt DESC;
```

![Image  16](./images/image_16.png)

Looks like the `white` race has most absenties, this does not give a clear picture, when you tend to get the mean. May be because they are the most in our dataset.

To prove this further, lets get the count of each race as well.

```sql
SELECT
	RaceDesc,
    SUM(Absences) AS absence_cnt,
    COUNT(RaceDesc) as race_cnt
FROM HR_data
GROUP BY RaceDesc
ORDER BY absence_cnt DESC;
```

![Image  16_2](./images/image_16_2.png)

The data is positively skewed, in such a case, the mean is not the best measure for central tendency. The `median` is much preferred in such case.

**Statistical Reading sources**

1. [Measures of central tendencies](https://www.abs.gov.au/statistics/understanding-statistics/statistical-terms-and-concepts/measures-central-tendency#:~:text=In%20a%20skewed%20distribution%2C%20the,the%20middle%20of%20the%20distribution.)

#### 17. Which department has the best employee satisfactions?

```sql
-- Which department has the best employee satisfactions?
SELECT
	Department,
    ROUND(AVG(EmpSatisfaction), 2) AS avg_empl_satisfaction
FROM HR_data
GROUP BY Department
ORDER BY avg_empl_satisfaction DESC;
```

![Image  17](./images/image_17.png)

Software engineers tend to be the most satisfied employees. What could be the reason for this? Salary?

![Image  17_2](./images/image_17_2.png)

Well, average salary isn't the case. Does the saying, **"money can't buy happiness"** true? There must be some other parameter affecting this. A leave this to open discussion.


#### 18. Which race has the most satisfied employees?

```sql
-- Which race has the most satisfied employees?
SELECT
	RaceDesc,
    ROUND(AVG(EmpSatisfaction), 2) AS avg_empl_satisfaction,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY RaceDesc
ORDER BY avg_empl_satisfaction DESC;
```

![Image  18](./images/image_18.png)

Using `Average` in the cases may not give us a clearer picture as they counts of each category is different. `Median` is probably a better measure for this. Using SQL for `median` calculation is abit of work. Keep this in mind, `average` is not the best measure in such a case and all the cases when I applied the mean.


#### 19. What is the employee satisfaction levels for married/single people?

```sql
-- What is the employee satisfaction levels for married/single people?
SELECT
	MaritalDesc,
    ROUND(AVG(EmpSatisfaction), 2) AS avg_empl_satisfaction,
    AVG(Salary) AS avg_salary
FROM HR_data
GROUP BY MaritalDesc
ORDER BY avg_empl_satisfaction DESC;
```

Again `mean` as a measure of central tendency does not give a clear picture in this case as each `MaritalDesc` section is different in count.

![Image  19](./images/image_19.png)


#### 20. Which state has the most satisfied employees?

```sql
-- Which state has the most satisfied employees?
SELECT
	State,
    ROUND(AVG(EmpSatisfaction), 2) AS avg_empl_satisfaction,
    AVG(Salary) AS avg_salary,
    COUNT(State) AS state_cnt
FROM HR_data
GROUP BY State
ORDER BY avg_empl_satisfaction DESC;
```

![Image  20](./images/image_20.png)

#### 22. What is the average age of employees in each department?


```sql
-- What is the average age of employees in each department?
SELECT
	Department,
    AVG(ROUND(DATEDIFF(NOW(), DOB) / 365, 1)) AS avg_age
FROM HR_data
GROUP BY Department;
```

![Image  22](./images/image_22.png)


#### 23. Average age by each race?

```sql
SELECT
	RaceDesc,
    AVG(ROUND(DATEDIFF(NOW(), DOB) / 365, 1)) AS avg_age
FROM HR_data
GROUP BY RaceDesc
ORDER BY avg_age DESC;
```

![Image  23](./images/image_23.png)


#### 24. What is the average age of each position?

```sql
-- What is the average age of each position?
SELECT
	Position,
    AVG(ROUND(DATEDIFF(NOW(), DOB) / 365, 1)) AS avg_age
FROM HR_data
GROUP BY Position
ORDER BY avg_age DESC;
```

![Image  24](./images/image_24.png)
