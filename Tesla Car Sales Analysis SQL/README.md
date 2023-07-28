## Tesla Car Sales Data Analysis


## Project Overview:

The primary objective of this sales data analytics project is to uncover valuable insights and patterns within Tesla car's sales data, ultimately leading to enhanced sales performance. Through a comprehensive analysis of sales data across various regions, products, and time frames, we aim to identify top-performing products, high-performing regions, and the most profitable time periods. By leveraging this information, we can fine-tune our sales strategies, optimize overall performance, and drive substantial revenue growth.



## Data Description:

The dataset employed in this analysis was obtained from the Kaggle website. It encompasses a comprehensive collection of information concerning the cars sold by the company. The dataset includes essential details such as car models, versions, countries of sale, customer purchase types, car prices, and gross profits. This rich dataset forms the foundation for our in-depth analysis aimed at extracting valuable insights to enhance the company's sales performance and overall profitability.

### Data Dictionary:

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




## Methodology:

1. **Data Collection:**
  - The dataset used for this analysis was sourced from the Kaggle website.

3. **Data Understanding:**

  - Explored the dataset's structure, including available columns, data types, and data dictionary to gain familiarity.
  - Identified and clarified the specific business questions or objectives that require insights from the dataset.

3. **Data Assessment:** 
  - Thoroughly assessed data quality and structure to identify and resolve potential issues or inconsistencies. This included detecting missing values, outliers, inconsistent formatting, and data entry errors.

4. **Data Cleaning and Data Validation Process:**

 my role in data cleaning and data validation involved several tasks to ensure the data was in a usable and reliable format. Here are some key steps I took:
   - First, I cleaned the data in Excel and adjusted the date format.
   - Added constraints to the data in Microsoft SQL Server, like a `Primary Key` for uniqueness and data integrity.
   - Chose appropriate `data types` for accurate storage and manipulation of data.
   - Enforced `NOT NULL` constraints on relevant columns to ensure data completeness and prevent the insertion of null values.
 
 5. **Feature Engineering**
   - I have created a new column called `month` to extract the transaction's corresponding month of the year (January, February, March, etc.). This additional data will be instrumental in identifying the months with the highest sales and profitability.
     

## Exploratory Data Analysis (EDA):

**Some of the business questions I've answered based on the data:**

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




## Query types used:
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



3. ## Writing SQL scripts to address various questions from the provided list.

#### 1. Let's check What date range are we dealing with in this dataset?

```sql
-- What date range are we dealing with in this dataset?
SELECT
	MIN(Period) AS Min_Period,
	MAX(Period) AS Max_Period
FROM CarSales;				
```

#### 2. What is the number of unique car models in the data?

```sql
-- What is the number of unique car models in the data?
SELECT
	COUNT(DISTINCT Model) AS no_of_models
FROM CarSales;		
```

#### 3. Which purchase type is most commonly used by people?

```sql
-- Which purchase type is most commonly used by people?
SELECT
	TOP 1 Purchase_type,
	COUNT(*) AS no_of_purchases 
FROM CarSales
GROUP BY Purchase_type
ORDER BY no_of_purchases DESC;	
```

#### 4. Which car version is the most popular among buyers?

```sql
-- Which car version is the most popular among buyers?
SELECT
	Version,
	COUNT(*) AS no_of_versions 
FROM CarSales
GROUP BY Version
ORDER BY no_of_versions DESC;
```

#### 5. What is the cumulative gross profit for both first and second quarters of year 2016? 

```sql
-- What is the cumulative gross profit for both first and second quarters of year 2016? 
SELECT SUM(Gross_Profit) AS total_profit
FROM CarSales
WHERE Period BETWEEN '2016-01' AND '2016-06';
```

#### 6. What is the most frequent purchase type?

```sql
-- What is the most frequent purchase type?
SELECT
	TOP 1 Purchase_type,
	COUNT(*) AS Frequent_Purchase
FROM CarSales
GROUP BY Purchase_type
ORDER BY COUNT(*) DESC;
```

#### 7. What is the car version with the highest price?

```sql
-- What is the car version with the highest price?
SELECT
	TOP 1 Version,
	 Price
FROM CarSales
ORDER BY Price DESC;
```

#### 8. Which car version is generating the highest total sales?

```sql
-- Which car version is generating the highest total sales?
SELECT
	TOP 1 Version,
	SUM(Price) AS Total_Sales
FROM CarSales
GROUP BY Version	
ORDER BY Total_Sales DESC;
```

#### 9. How does the average gross profit vary across different car versions for each country?

```sql
-- How does the average gross profit vary across different car versions for each country?
SELECT
	Country,
	Version,
	AVG(Gross_Profit) AS Avg_Gross_Profit
FROM CarSales
GROUP BY Country, Version
ORDER BY Country, Avg_Gross_Profit DESC;
```

#### 10. what is the most sold car version in each country?

```sql
-- what is the most sold car version in each country?
SELECT Country, Version
FROM (
  SELECT Country, Version, 
         ROW_NUMBER() OVER (PARTITION BY Country ORDER BY COUNT(*) DESC) AS RN
  FROM CarSales
  GROUP BY Country, Version
) AS sales_version
WHERE RN = 1;
```

#### 11. Which car version is generating the highest total gross profit?

```sql
-- Which car version is generating the highest total gross profit?
SELECT
	TOP 1 Version,
	SUM(Gross_Profit) AS Total_Profit
FROM CarSales
GROUP BY Version
ORDER BY Total_Profit DESC;
```

#### 12. What is the total gross profit and sales for each country?

```sql
-- What is the total gross profit and sales for each country?
SELECT
	Country,
	SUM(Gross_Profit) AS Total_Gross_Profit,
	SUM(Price) AS Total_Sales
FROM CarSales
GROUP BY Country
ORDER BY Total_Gross_Profit DESC;
```

#### 13. What is the average sales price for each car model?

```sql
-- What is the average sales price for each car model?
SELECT
	Model,
	AVG(Price) AS Avg_Price
FROM CarSales
GROUP BY Model
ORDER BY Avg_Price DESC;

```


#### 14. How many car models were sold in the US in January 2016?

```sql
-- How many car models were sold in the US in January 2016?
SELECT
	Model,
	COUNT(DISTINCT Model) AS us_no_models
FROM CarSales
WHERE (Country = 'US') AND (Period = '2016-01')
GROUP BY Model;		
```

#### 15. Which country had the highest demand for Tesla cars?

```sql
-- Which country had the highest demand for Tesla cars?
SELECT
	Country,
	COUNT(*) AS no_demand_cars
FROM CarSales
GROUP BY Country
ORDER BY no_demand_cars DESC;	
```


#### 16. How many unique car models were sold in the Australia in January 2016?

```sql
-- How many unique car models were sold in the Australia in January 2016?
SELECT
	Model,
	COUNT(DISTINCT Model) AS AU_no_models
FROM CarSales
WHERE (Country = 'Australia') AND (Period = '2016-01')
GROUP BY Model;	
```

#### 17. What is the distribution of purchase types for each car model?

```sql
--  What is the distribution of purchase types for each car model?
SELECT
	Model,
	Purchase_type,
	COUNT(*) AS Frequency
FROM CarSales
GROUP BY Model, Purchase_type
ORDER BY Model, Frequency DESC;	
```

#### 18. What is the average price of all cars sold in the US?

```sql
-- What is the average price of all cars sold in the US?
SELECT
	Country,
	ROUND(AVG(Price),3) AS US_avg_Price
FROM CarSales 
WHERE Country = 'US'
Group BY Country;
```

#### 19. Which car model had the highest price in the US?

```sql
-- Which car model had the highest price in the US?
SELECT
	Model,
	ROUND(SUM(Price), 2) AS US_total_price
FROM CarSales
WHERE Country = 'US'
GROUP BY Model
ORDER BY US_total_price DESC;
```

#### 20. What was the total sales generated from all sales in Australia?

```sql
-- What was the total sales generated from all sales in Australia?
SELECT
	Country,
	ROUND(SUM(Price),3) AS AU_total_sal
FROM CarSales
WHERE Country = 'Australia'
GROUP BY Country;			
```

#### 21. Which country had the highest number of cash purchases?

```sql
-- Which country had the highest number of cash purchases?
SELECT
	TOP 1 Country,
	COUNT(*) AS no_Purchase
FROM CarSales
WHERE Purchase_type = 'Cash purchase'
GROUP BY Country
ORDER BY no_Purchase DESC;
```

#### 22. What is the average gross profit for each purchase type?

```sql
-- What is the average gross profit for each purchase type?
SELECT
	Purchase_type,
	AVG(Gross_Profit) AS Total_Sales
FROM CarSales
GROUP BY Purchase_type
ORDER BY Total_Sales DESC;
```

#### 23. What is the distribution of car prices in the US for January 2016?

```sql
-- What is the distribution of car prices in the US for January 2016?
SELECT
	Price,
	COUNT(*) AS Frequency
FROM CarSales  
WHERE (Country = 'US') AND (Period = '2016-01')
GROUP BY Price
ORDER BY Frequency DESC;
```

#### 24. What is the highest car price in each country?

```sql
-- What is the highest car price in each country?
SELECT Country, Price
FROM (SELECT Country, Price, ROW_NUMBER() OVER(PARTITION BY Country ORDER BY SUM(Price) DESC) AS RN
		FROM CarSales
		GROUP BY Country, Price) as NewTable
WHERE RN = 1;
```

#### 25. What is the distribution of purchase types for each car model?

```sql
-- What is the distribution of purchase types for each car model?
SELECT
	Model,
	Purchase_type,
	COUNT(*) AS Frequency
FROM CarSales
GROUP BY Model, Purchase_type
ORDER BY Model, Frequency DESC;
```

#### 26. Which purchase type is most commonly used in each country?

```sql
-- Which purchase type is most commonly used in each country?
SELECT
	Country,
	Purchase_type
FROM (SELECT
	Country,
	Purchase_type,
	ROW_NUMBER() OVER(PARTITION BY Country ORDER BY count(*) DESC) AS RN
		FROM CarSales
			GROUP BY Country, Purchase_type) as NewTable
WHERE RN = 1;
```

#### 27. Which car model generated the highest gross profit in Germany?

```sql
-- Which car model generated the highest gross profit in Germany?
SELECT
	Model,
	SUM(Gross_Profit) AS total_Prof
FROM CarSales
WHERE Country = 'Germany'
GROUP BY Model
ORDER BY total_Prof DESC;
```

#### 28. How many sales transactions were made for each car model in the US?

```sql
-- How many sales transactions were made for each car model in the US?
SELECT
	Model,
	Country,
	COUNT(id) AS us_no_trnascations
FROM CarSales
WHERE Country = 'US'
GROUP BY Model, Country;
```

#### 29. What is the total gross profit for each car model in the dataset?

```sql
-- What is the total gross profit for each car model in the dataset?
SELECT
	Model,
	SUM(Gross_Profit) AS total_Profit
FROM CarSales
GROUP BY Model
ORDER BY total_Profit DESC;	
```

#### 30. Which country had the highest average sales for the car models sold?

```sql
-- Which country had the highest average sales for the car models sold?
SELECT
	TOP 1 Country,
	Model,
	ROUND(AVG(Price),2) AS avg_sal
FROM CarSales
GROUP BY Country, Model
ORDER BY avg_sal;	
```

#### 31. What is the most sold car Model in each country?

```sql
-- What is the most sold car Model in each country?
SELECT
	Country,
	Model
FROM (SELECT
	Country,
	 Model,
	ROW_NUMBER() OVER(PARTITION BY Country ORDER BY Model DESC) AS RN
		FROM CarSales) as sales_model
WHERE RN = 1;
```

#### 32. What was the most common purchase type for 'Model S' in Germany?

```sql
-- What was the most common purchase type for 'Model S' in Germany?
SELECT
	Model,
	Purchase_type,
	COUNT(Purchase_type) AS no_Pur_type
FROM CarSales
WHERE (Country = 'Germany') AND (Model = 'Model S')
GROUP BY Model, Purchase_type
ORDER BY no_Pur_type DESC;	
```

#### 33. What is the total gross profit generated from each car version in the US?

```sql
-- What is the total gross profit generated from each car version in the US?
SELECT
	Version,
	SUM(Gross_Profit) AS US_totalprofit
FROM CarSales
WHERE Country = 'US'
GROUP BY Version;		
```

#### 34. How many sales transactions were made for each car version in the US?

```sql
-- How many sales transactions were made for each car version in the US?
SELECT
	Version,
	COUNT(*) AS no_sal_trans
FROM CarSales
WHERE Country = 'US'
GROUP BY Version;		
```

#### 35. What was the most popular car model in terms of sales volume?

```sql
-- What was the most popular car model in terms of sales volume?
SELECT
	Model,
	SUM(Price) AS total_sales
FROM CarSales
GROUP BY Model
ORDER BY total_sales DESC;		
```


#### 36. How does the average price vary for different purchase types in the US?

```sql
-- How does the average price vary for different purchase types in the US?
SELECT
	Purchase_type,
 	ROUND(AVG(Price), 3) AS avg_sales
WHERE Country = 'US'
FROM CarSales
GROUP BY Purchase_type;				
```

#### 37. what is the monthly gross profit for each month?

```sql
-- what is the monthly gross profit for each month?
WITH monthly_profit AS(
    SELECT Gross_Profit, 
    	CASE 
			WHEN right(Period, 2) = '01' THEN 'January'
    		WHEN right(Period, 2) = '02' THEN 'February'
    		WHEN right(Period, 2) = '03' THEN 'March'
    		WHEN right(Period, 2) = '04' THEN 'April'
    		WHEN right(Period, 2) = '05' THEN 'May'
    		WHEN right(Period, 2) = '06' THEN 'June'
    		ELSE Period 
		END AS Month
    	FROM CarSales
    )
    SELECT Month, sum(Gross_Profit) AS 'monthly_profit'
    FROM monthly_profit
    GROUP BY Month
    ORDER BY 'monthly_profit' DESC;			
```

#### 38. Calculating the average car price and gross profit
#### Calculating the standard deviation of price and gross profits

```sql
SELECT
  AVG(Price) AS Price_Mean,
  STDEV(Price) AS Price_StdDev,
  AVG(Gross_Profit) AS Profit_Mean,
  STDEV(Gross_Profit) AS Profit_StdDev
FROM CarSales; 			
```

#### 39. Is there a correlation between car price and gross profit?

```sql
-- Is there a correlation between car price and gross profit?
SELECT 
  (SUM(Price * Gross_Profit) - COUNT(*) * AVG(Price) * AVG(Gross_Profit)) /
  (COUNT(*) * STDEV(Price) * STDEV(Gross_Profit)) AS CorrelationCoefficient
FROM CarSales;			
```
Yes, there is a correlation between car price and gross profit.
 The correlation coefficient of 0.1201 between car price and gross profit suggests a relatively weak positive correlation between these two variables. 
 This means that there is a slight tendency for higher car prices to be associated with slightly higher gross profits, but the relationship is not very strong. 
 The value being positive indicates that when car prices increase, gross profits also tend to increase to some extent. 


## Code:
For the code, check the [Tesla_Car_Sales_Analysis_queries.sql](https://github.com/MohamedMohsen01/SQL-Projects/blob/main/Tesla%20Car%20Sales%20Analysis%20SQL/Tesla_Car_Sales_Analysis.sql) file.
