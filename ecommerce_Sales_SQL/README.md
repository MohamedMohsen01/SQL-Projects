# ecommerce-Data-Analysis-SQL-Project

## Executive Summary
In this SQL project, I conducted an extensive analysis of e-commerce sales data, focusing on key objectives and additional insights. The project encompassed the following:

- Utilized SQL to analyze sales figures and identify stores with the highest and lowest sales performance.
- Explored and evaluated the performance of various departments within these stores, providing a comprehensive understanding of sales distribution.
- Investigated the potential influence of key variables, such as unemployment rates, temperature, fuel prices, consumer price index (CPI), and holiday seasons, on sales.
- Leveraged SQL to perform statistical analysis and assess the correlation or significance of these variables with sales performance.


## Data Dictionary

This dataset contains 3 tables:
- Features table contains 12 coluns and 8191 rows.
- Sales table contains 5 columns and 421571 rows.
- Stores table contains 3 columns and 64 rows.


**Features Table** 

| Column                  | Description                                                             | Data Type      |
| :---------------------- | :---------------------------------------------------------------------- | :------------- |
| store                   | Represents the store number.                                            | INT            |
| date                    | the date of the recorded data.                                          | DATE           |
| temprature              | the temperature on the given date and store location.                   | DECIMAL(3,3)   |
| fuel_price              | the fuel price on the given date and store location.                    | DECIMAL (10,3) |
| markdown 1              | various promotional markdowns of specific date and store location.      | DECIMAL(10,2)  |
| markdown 2              | various promotional markdowns of specific date and store location.      | DECIMAL(10,2)  |
| markdown 3              | various promotional markdowns of specific date and store location.      | DECIMAL(10,2)  |
| markdown 4              | various promotional markdowns of specific date and store location.      | DECIMAL(10,2)  |
| markdown 5              | various promotional markdowns of specific date and store location.      | DECIMAL(10,2)  |
| CPI                     | Consumer Price Index on the given date and store location.              | DECIMAL(10, 7) |
| unemployment            | unemployment rate on the given date and store location.                 | DECIMAL(10,3)  |
| IsHoliday               | Represents whether the given date is a holiday (TRUE) or not (FALSE).   | VARCHAR(5)     |



**Sales Table**
| Column                  | Description                                                         | Data Type      |
| :---------------------- | :------------------------------------------------------------------ | :------------- |
| store                   | Represents the store number.                                        | INT            |
| dept                    | Represents the department number.                                   | INT            |
| date                    | the date of the recorded data.                                      | DATE           |
| weekly_sales            | the weekly sales amount for the given store, department, and date.  | DECIMAL(20, 5) |


**Stores Table**

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| store                   | Represents the store number.            | INT            |
| type                    | Represents the store type.              | VARCHAR(5)     |
| size                    | Represents the size of the store.       | INT            |


## Methodology 

1. **Data Collection:**
 > - Collected the dataset from Kaggle.

2. **Data Understanding:**

 > - Familiarized myself with the dataset's structure, including the available columns, data types, and data dictionary.
 > - Gained an understanding of the specific business questions or objectives that need to be addressed using the dataset.

3. **Data Assessment:** 
 > - Assessed the quality and structure of the data to identify any issues or inconsistencies that needed to be addressed. This involved checking for missing            values, outliers, inconsistent formatting, or data entry errors.

4. **Data Cleaning and Preprocessing:**
 >   my role in data wrangling and cleaning involved several tasks to ensure the data was in a usable and reliable format. Here are some key steps I took:
 > - Employed techniques like imputation or deletion, depending on the nature of the missing data.
 > - Eliminated any duplicate records or entries to ensure data integrity.
 > - Standardized the formats of data fields, such as dates, currencies, and units, to ensure consistency.
     
5. **Data Transformation:**
 > Conducted data transformations to derive meaningful insights or facilitate analysis. This involved tasks like:
> - I aggregated data at different levels, such as weekly, yearly, and by categories, to enable analysis and reporting using aggregation functions like ( SUM, MIN, MAX, COUNT, AVG)

6. **Data Integration:** 
 > - After cleaning and transforming the data, I validated the results to ensure accuracy and integrity. I worked with multiple data sources, I merged and joined        datasets based on common identifiers or keys to combine relevant information into a unified dataset.

## Exploratory Data Analysis (EDA): 
Some of the business questions I've answered based on the data:

 1. What is the date range covered by the sales data?
 2. What is the date range covered by the features data?
 3. What are the different store types in the dataset?
 4. Is there a difference in sales between the different store types?
 5. Which store has the highest total sales and which store has the lowest total sales?
 6. How does each department perform in the best performing store?
 7. Which store has the second-highest total sales?
 8. How does each department perform in the worst performing store?
 9. What is the highest weekly sales in each department?
 10. What is the lowest weekly sales in each department?
 11. How does the presence of holidays impact sales in different stores?
 12. How does temperature relate to sales in the top-selling store?
 13. How does temperature relate to sales in the worst-selling store?
 14. How do different variables such as temperature, fuel price, CPI, and unemployment impact sales in the top performing store ?
 15. How do different variables such as temperature, fuel price, CPI, and unemployment impact sales in the worst performing store ?
 16. Is there significant variability in sales based on temperature?
 17. How does unemployment affect sales?
 18. What is the impact of fuel prices on sales?
 19. How do the variables (temperature, fuel prices, unemployment, CPI) collectively affect sales?

 ### Query types used:
- Count(distinct)
- Create table
- Insert into
- min/max
- SUM
- AVG
- Row_Number()
- Partition by
- ROUND
- Where between
- Join
- CTEs
- Case statement
- Group by
- Order by

For the the code, check the [ecommerce_sales_analysis_SQL_Queries.sql](https://github.com/MohamedMohsen01/E-commerce_Sales_Data_Analysis_SQL_Project/blob/main/ecommerce_sales_analysis_SQL.sql) file.
