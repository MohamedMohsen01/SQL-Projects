## Tesla Car Sales Data Analysis Project


## Content Index
1. [Introduction](#Introduction)
2. [Data Description](#Data-Description)
3. [Methodology](#Methodology)
4. [Exploratory Data Analysis (EDA)](#Exploratory-Data-Analysis-EDA)
5. [Query types used](#Query-types-used)
6. [Results](#Results)
7. [Conclusion](#Conclusion)
8. [SQL scripts](#Writing-SQL-scripts-to-address-various-questions-from-the-provided-list)
9. [Project Code](#Code)


## Introduction
The purpose of this analysis is to gain valuable insights and patterns within Tesla car sales data. By thoroughly examining sales data across various regions, products, and time frames, we aim to identify top-performing products, high-performing regions, and the most profitable time periods. These findings will help optimize our sales strategies and enhance overall performance to drive substantial revenue growth.



## Data Description

The dataset used in this analysis was obtained from the Kaggle website and contains 924 rows and 7 columns. The columns include Model, Period, Country, Purchase_type, Version, Price, and Gross_Profit, providing comprehensive information about the cars sold by the company.

**Data Dictionary:**

The dataset consists of 7 columns with their corresponding data types:

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
  - The dataset used for this analysis was sourced from the Kaggle website.

3. **Data Understanding:**

 - Explored the dataset's structure, available columns, data types, and the data dictionary to understand its contents and objectives.

3. **Data Assessment:** 
  - Thorough data quality assessment was conducted, addressing missing values, outliers, inconsistent formatting, and data entry errors.

4. **Data Cleaning and Data Validation:**

 Several tasks were performed to ensure the data was in a usable and reliable format. Here are some key steps I took:
   - Cleaned the data in Excel and adjusted the date format.
   - Added constraints in Microsoft SQL Server, like a `Primary Key` for uniqueness and data integrity.
   - Chose appropriate `data types` for accurate storage and manipulation of data.
   - Enforced `NOT NULL` constraints on relevant columns to ensure data completeness and prevent the insertion of null values.
 
 5. **Feature Engineering**
   - A new column called `month` was created to extract the corresponding month of each transaction, aiding in identifying months with the highest sales and profitability.
     

## Exploratory Data Analysis (EDA)

**Throughout the analysis, I'v eanswered various business questions based on the data, including:**

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
32. What is the highest car price in each country?
33. Which purchase type is most commonly used in each country?
34. Which car model generated the highest gross profit in Germany?
35. How many sales transactions were made for each car model in the US?
36. What is the total gross profit for each car model in the dataset?
37. Which country had the highest average sales for the car models sold?
38. what is the most sold car Model in each country?
39. What was the most common purchase type for Model S in Germany?
40. What is the total gross profit generated from each car version in the US?
41. How many sales transactions were made for each car version in the US?
42. What was the most popular car model in terms of sales volume?
43. How does the average price vary for different purchase types in the US?
44. What is the monthly gross profit for each month?
45. What is the standard deviation of price and gross profits?
46. Is there a correlation between car price and gross profit?




## Query types used
- ALTET TABLE
- ALTER COLUMN
- ADD
- IDENTITY()
- Aggregate Functions
- MIN/MAX
- SUM
- COUNT(DISTINCT)
- AVG
- ROW_NUMBER()
- ROUND
- WHERE BETWEEN
- Subqueries
- CASE statement 
- CTEs
- STDEV
- GROUP BY
- ORDER BY 





## Results

**1. Top Performing Car Models:**
- The dataset includes 2 unique car models, with `Model S` standing out as the top performer based on total gross profit and sales volume.

**2. Popular Car Versions and Purchase Types:**
- `75 RWD` emerged as the most popular car version among buyers.
- `Cash purchase` was the most commonly used purchase type, accounting for the majority of sales transactions.

**3. Profitable Time Periods:**
- `April` had the highest sales and profitability.

**4. Gross Profit and Sales by Country:**
- `The US` emerged as the top performer in terms of total sales and gross profit, closely followed by `Germany`.

**5. Average Sales Price and Gross Profit by Car Model:**
- `Model X` had the highest average sales price and gross profit, indicating its premium positioning.
- `Model S` generated the highest total gross profit.

**6. Sales Performance by Purchase Type:**
- `Cash purchase` generated the highest total sales and the highest average gross profit per transaction.

**7. Price Distribution and Highest Prices:**
- The highest car price was `$88700 for the 90D AWD` car version.
- The highest car prices in individual countries were `$80000 for the 90D car version in Australia` and `$88700 for the 90D AWD in Germany and the US`.

**8. Correlation between Car Price and Gross Profit:**
- The correlation coefficient of 0.1201 suggests a relatively `weak positive correlation` between car price and gross profit.

**9. Regional Sales Analysis:**
- `Model S` is the most sold car model in each country, with the highest demand for Tesla cars in `the US`.
- `The US` also had the highest number of cash purchases.

**10. Car Version and Model Analysis:**
- Sales transactions for each car version and model in the US were investigated, identifying the most popular car models in terms of sales volume and gross profit. The most common purchase type for specific car models was also determined.

**11. Monthly Gross Profit:**
- The analysis identified the months with the highest gross profit, providing valuable information for planning and resource allocation.

**12. Standard Deviation:**
- The standard deviation of car prices and gross profits was calculated, providing insight into the variability of these metrics within the dataset.

## Conclusion

The analysis of Tesla car sales data has provided critical insights into top-performing car models, profitable time periods, high-performing regions, and purchase preferences. Armed with this information, we can fine-tune our sales strategies, optimize overall performance, and drive substantial revenue growth for the company.



## Code:
For the code, check the [Tesla_Car_Sales_Analysis_queries.sql](https://github.com/MohamedMohsen01/SQL-Projects/blob/main/Tesla%20Car%20Sales%20Analysis%20SQL/Tesla_Car_Sales_Analysis.sql) file.
