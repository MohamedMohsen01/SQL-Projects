--I needed to clean the data in excel and change the date format  

USE ecommerce_sales

--What date range are we dealing with in these spreadsheets?
SELECT MIN(Date), MAX(Date)
FROM sales;                   --2010-02-05- 2012-10-26


SELECT MIN(Date), MAX(Date)
FROM features;               --2010-02-05-  2013-07-26

--So, they are not the same date range. 

--A question that I have about the data is what do the A, B, and C store types mean? This is a potential answer, but it is not straightforward: https://www.yourarticlelibrary.com/retailing/retailing-in-india/retail-store-classification-2-categories-retailing/87239 

--There are indeed only the three types: 
SELECT COUNT(DISTINCT Type)
FROM stores;

--Let’s see if there is a difference in sales between these three store types.  
select type, ROUND(AVG(size), 3) as avg_size, ROUND(AVG(weekly_sales), 3) as total_sales 
from sales as a 
join stores as b 
	on a.store = b.store 
group by Type;

--A different way to get the same results:
WITH new AS (
  SELECT b.Store, a.Type, a.Size, b.Weekly_Sales 
  FROM sales as b 
  JOIN stores as a 
	ON a.Store = b.Store
) 
SELECT Type, ROUND(AVG(size),3) as avg_size, ROUND(AVG(Weekly_Sales),3) as avg_weekly_sales 
FROM new 
GROUP BY Type;

--Not a huge difference. 

--Let’s look at how much each of these stores are selling in a year: 

SELECT Store, ROUND(SUM(Weekly_Sales), 3) as annual_sales 
FROM sales 
WHERE Date BETWEEN '2010-02-05' AND '2011-02-05' 
GROUP BY Store 
ORDER BY annual_sales DESC;

--So we know our top performers and worst performers in this date range. 

--What is our best performing store (all time)?
SELECT  Store, SUM(Weekly_Sales) as total_sales
FROM sales
GROUP BY Store
ORDER BY total_sales DESC;  --Our best performing Store is 20 with total_sales = 301397792.45999974


-- What is the second best highest performing store?
SELECT *
FROM (SELECT Store, ROW_NUMBER() OVER(ORDER BY SUM(Weekly_Sales) DESC) AS RN
		FROM sales
		group by store) as new
WHERE RN = 2;


--What is our worst performing store (all time)?
SELECT TOP 1 Store, SUM(Weekly_Sales) as total_sales
FROM sales
GROUP BY Store
ORDER BY total_sales ASC;  --Our worst performing Store is 33 with total_sales = 37160221.96

--How does each department do in the best performing store?
SELECT Store, dept, SUM(Weekly_Sales) as total_sales
FROM sales
WHERE Store = '20'
GROUP BY store, dept
ORDER BY total_sales ASC;

--It seems like there is a department that loses money (department 47) - perhaps this is returns? This is pretty low for returns however. There is also some departments that are scoring pretty low. I would want to ask more questions about what might be going on with these departments. 


--Let’s see how our most poorly performing store is doing:
SELECT Store, dept, SUM(Weekly_Sales) as total_sales
FROM sales
WHERE Store = '33'
GROUP BY store, dept
ORDER BY total_sales ASC;

--Again, I have questions about some of these lowest selling departments. 


-- What is the highest weekly sales in each department? 
SELECT *
FROM (SELECT Dept, weekly_sales, ROW_NUMBER() OVER(PARTITION BY dept ORDER BY SUM(Weekly_Sales) DESC) AS RN
		FROM sales
		GROUP BY Dept,weekly_sales) as NewTable
WHERE RN = 1;


--Let’s see how different variables impact sales in our stores like in Holidays.
SELECT Store, ROUND(AVG(Weekly_Sales), 3) as average_sales, IsHoliday
FROM sales
GROUP BY Store, IsHoliday
ORDER BY Store;

--Let’s look at temperature and sales for just store 33 (Top seller):
WITH temp_33 AS (
    SELECT Store, Date, 
        CASE 
            WHEN Temperature < 30 THEN 'cold'
            WHEN (Temperature >= 30) AND (Temperature < 80) THEN 'normal'
            ELSE 'hot'
        END AS temp_cat
    FROM features
    WHERE Store = '33' AND Date < '2012-10-26'
),
store_33 AS (
    SELECT Store, Date, SUM(Weekly_Sales) AS sales
    FROM sales
    WHERE Store = '33'
    GROUP BY Store, Date
)
SELECT a.Store, a.Date, a.temp_cat, b.sales
FROM temp_33 AS a
	JOIN store_33 AS b 
		ON a.Date = b.Date
ORDER BY a.Date ASC, b.sales DESC;


--From this table, is there big variability based on temperature?

--saved table as #combined_33_temp

CREATE TABLE #combined_33_temp (
    Store INT,
    Date DATE,
    Temp_cat VARCHAR(10),
    Sales DECIMAL(10,2)
);
WITH temp_33 AS (
    SELECT Store, Date, 
        CASE 
            WHEN Temperature < 30 THEN 'cold'
            WHEN (Temperature >= 30) AND (Temperature < 80) THEN 'normal'
            ELSE 'hot'
        END AS Temp_cat
    FROM features
    WHERE Store = '33' AND Date < '2012-10-26'
),
store_33 AS (
    SELECT Store, Date, SUM(Weekly_Sales) AS Sales
    FROM sales
    WHERE Store = '33'
    GROUP BY Store, Date
)
INSERT INTO #combined_33_temp (Store, Date, Temp_cat, Sales)
SELECT a.Store, a.Date, a.Temp_cat, b.Sales 
FROM temp_33 AS a 
JOIN store_33 AS b 
	ON a.Date = b.Date 
ORDER BY a.Date ASC, b.Sales DESC;


SELECT Temp_cat, AVG(sales)
FROM #combined_33_temp
GROUP BY temp_cat;

-- temp_cat	       AVG(sales)
--normal	   261262.48103896104
--hot	       258296.61215384607

--Not really.

--Ok, let’s just combine each of our special variables into a table that can be easily pulled from.
WITH store_33 AS (
  SELECT Date, SUM(Weekly_Sales) as total_sal 
  FROM sales 
  WHERE Store = '33' 
  GROUP BY Date
), 
features_33 AS (
  SELECT date, Temperature, Fuel_Price, CPI, Unemployment 
  FROM features 
  WHERE Store = '33'
)
SELECT a.date, a.Temperature, a.Fuel_Price, a.CPI, a.Unemployment, b.total_sal 
FROM features_33 as a 
JOIN store_33 as b 
	ON a.date = b.Date

--> saved table as combined_33

CREATE TABLE #combined_33 (
	Date DATE, 
	Temperature DECIMAL(10, 2), 
	Fuel_Price DECIMAL(10, 2), 
	CPI DECIMAL(10, 2), 
	Unemployment DECIMAL(10, 2), 
	Total_sal DECIMAL(10, 2)
);
WITH store_33 AS (
  SELECT Date, SUM(Weekly_Sales) AS total_sal 
  FROM sales 
  WHERE Store = '33' 
  GROUP BY Date
), 
features_33 AS (
  SELECT date, Temperature, Fuel_Price, CPI, Unemployment 
  FROM features 
  WHERE Store = '33'
) 
INSERT INTO #combined_33 (Date, Temperature, Fuel_Price, CPI, Unemployment, Total_sal)
SELECT a.date, a.Temperature, a.Fuel_Price, a.CPI, a.Unemployment, b.total_sal 
FROM features_33 AS a 
JOIN store_33 AS b 
	ON a.date = b.Date;


--Let’s look at unemployment:

SELECT MAX(Unemployment), MIN(Unemployment)
FROM #combined_33;

--# MAX(Unemployment)	MIN(Unemployment)
--     10.12  	              6.89

WITH unemployment_CTE AS (
  SELECT date, Total_sal, 
    CASE WHEN Unemployment < 7.8 THEN 'low' 
		 WHEN Unemployment >= 8 AND Unemployment < 9.5 THEN 'middle' 
		 ELSE 'high' 
	  END AS unemployment_cat 
  FROM #combined_33
)
SELECT AVG(total_sal) as average_sales, unemployment_cat 
  FROM unemployment_CTE 
  GROUP BY unemployment_cat;

--average_sales	       unemployment_cat
--290723.364285	           high
--248347.851645	          middle
--265943.047209	           low


--Unemployment does seem to have an impact on sales. Surprisingly, sales were lowest when unemployment was in the “middle”.

--Ok, Let’s look at fuel:

SELECT MIN(Fuel_Price), MAX(Fuel_Price)
FROM #combined_33;

--MIN(Fuel_Price), MAX(Fuel_Price)
--      2.825           4.468


WITH fuel AS (
  SELECT date, Total_sal, 
    CASE WHEN Fuel_Price > 4.1 THEN 'high' 
	WHEN Fuel_Price <= 4.1 AND Fuel_Price > 3.1 THEN 'middle' 
	ELSE 'low' 
	END AS fuel_cat 
  FROM #combined_33
)
SELECT AVG(total_sal) as [average sales], fuel_cat 
FROM fuel 
GROUP BY fuel_cat;

--average sales	      fuel_cat
--265,172.15857142856 	low
--255,063.93919540226 	middle
--270,887.31904761906 	high

--These were more even- but interestingly the 'middle' category was again the lowest. I wonder if this is a reflection of the social/economic trends, or a paucity of data.

--I added a 'number of records' for each category by adding to the select statement: COUNT(fuel_cat) as num_of_records

--It came up with this: 
--average sales	fuel_cat	num_of_records
--265172.15857142856		  low	   35
--255063.93919540226		  middle   87
--270887.31904761906 		 high	   21

--So actually, there is the most records in that middle category, which would fit with the bell curve assumptions I made when labeling the 'high/low' categories.


-- Ok, Let’s look at CPI:

SELECT MIN(CPI), MAX(CPI)
FROM #combined_33;

--  MIN(CPI)       MAX(CPI)
--  126.06          131.19

WITH CPI AS (
  SELECT date, Total_sal, 
    CASE WHEN CPI > 129 THEN 'high' 
	     WHEN CPI <= 129 AND CPI > 127.5 THEN 'middle' 
		 ELSE 'low' 
		END AS CPI_cat 
  FROM #combined_33
) 
SELECT AVG(total_sal) as [average sales], CPI_cat, COUNT(CPI_cat) as num_of_records 
FROM CPI 
GROUP BY CPI_cat;

--# average sales	CPI_cat	num_of_records
--265,003.2798039216     	 low	51
--251,150.55785714282 	middle	14
--258,063.42153846152 	high	78

--Interestingly, yet again the middle category has the lowest average sales- but this time it also has the lowest number of records. Adjusting the 'high' category to cut off at 129.5 instead of 129:

--# average sales	CPI_cat	num_of_records
--265,003.2798039216   	low	51
--250,246.87588235294 	middle	34
--260,976.91224137938 	high	58

--Same trend- these are all fairly similar as well. 

--Let’s run those numbers with the store that sold the most:

WITH store_20 AS (
  SELECT Date, SUM(Weekly_Sales) as total_sal 
  FROM sales 
  WHERE Store = '20' 
  GROUP BY Date
), 
features_20 AS (
  SELECT date, Temperature, Fuel_Price, CPI, Unemployment 
  FROM features 
  WHERE Store = '20'
) 
SELECT a.date, a.Temperature, a.Fuel_Price, a.CPI, a.Unemployment, b.total_sal
FROM features_20 as a 
JOIN store_20 as b 
  ON a.date = b.Date;

--> saved as combined_20

CREATE TABLE #combined_20 (
	Date DATE, 
	Temperature DECIMAL(10, 2), 
	Fuel_Price DECIMAL(10, 2), 
	CPI DECIMAL(10, 2), 
	Unemployment DECIMAL(10, 2), 
	Total_sal DECIMAL(10, 2)
);
WITH store_20 AS (
  SELECT Date,  SUM(Weekly_Sales) AS total_sal 
  FROM sales 
  WHERE Store = '20' 
  GROUP BY Date
), 
features_20 AS (
  SELECT date, Temperature, Fuel_Price, CPI, Unemployment 
  FROM features 
  WHERE Store = '20'
) 
INSERT INTO #combined_20 (Date, Temperature, Fuel_Price, CPI, Unemployment, Total_sal)
SELECT a.date, a.Temperature, a.Fuel_Price, a.CPI, a.Unemployment, b.total_sal 
FROM features_20 AS a 
JOIN store_20 AS b 
	ON a.date = b.Date;


--unemployment:
WITH unemployment AS (
  SELECT date, total_sal, 
         CASE WHEN Unemployment < 7.8 THEN 'low' 
		 WHEN Unemployment >= 8 AND Unemployment < 9.5 THEN 'middle' 
		 ELSE 'high' 
		END AS unemployment_cat 
  FROM #combined_20
)
SELECT AVG(Total_sal), unemployment_cat 
FROM unemployment 
GROUP BY unemployment_cat;


--# AVG(total)	               unemployment_cat
--2,068,378.3774999995	           middle
--2,053,552.0146153844	            high
--2,116,021.223360656	            low

--I used the same numbers as before, because it is the same date range.
--It looks like there is more consistency with this one.


WITH fuel AS (
  SELECT date, total_sal, 
    CASE WHEN Fuel_Price > 4.1 THEN 'high' 
	WHEN Fuel_Price <= 4.1 
    AND Fuel_Price > 3.1 THEN 'middle' 
	ELSE 'low' 
  END AS fuel_cat 
FROM #combined_20
)
SELECT AVG(total_sal) as [average sales], fuel_cat 
FROM fuel 
GROUP BY fuel_cat;

--# average sales	      fuel_cat
--2058985.0056818181     	low
--2129317.6990909097	   middle

--It looks like I need to adjust the fuel numbers?
--  Max         min-
-- 4.066       2.699

With fuel AS (
  SELECT date, total_sal, 
    CASE WHEN Fuel_Price > 3.7 THEN 'high' 
	     WHEN Fuel_Price <= 3.7 AND Fuel_Price > 3.0 THEN 'middle' 
	ELSE 'low' 
   END AS fuel_cat 
  FROM #combined_20)
  SELECT AVG(total_sal) as [average sales], fuel_cat 
  FROM fuel 
  GROUP BY fuel_cat;

--# average sales	       fuel_cat
--2,032,563.215238095	     low
--2,220,426.9620408164  	middle
--2,062,100.3130769236	     high

WITH CPI AS (
  SELECT date, total_sal, 
    CASE WHEN CPI > 129 THEN 'high' 
	     WHEN CPI <= 129 AND CPI > 127.5 THEN 'middle' 
		 ELSE 'low' 
		END AS CPI_cat 
  FROM #combined_20
)
SELECT AVG(total_sal) as 'average sales', CPI_cat, COUNT(CPI_cat) as num_of_records 
FROM CPI 
GROUP BY CPI_cat;

--# average sales	      CPI_cat	     num_of_records
--2107676.8703496503	   high	            143

--Ok what is the range here?
--'216.1515902', '203.6101784'


WITH CPI AS (
  SELECT date, total_sal, 
    CASE WHEN CPI > 212 THEN 'high' 
	     WHEN CPI <= 212 AND CPI > 207 THEN 'middle' 
		 ELSE 'low' 
		END AS CPI_cat 
  FROM #combined_20
)
SELECT AVG(total_sal) as [average sales], CPI_cat, COUNT(CPI_cat) as num_of_records 
FROM CPI 
GROUP BY CPI_cat;

--# average sales	       CPI_cat	       num_of_records
--2,103,630.694736842	     low	             57
--2,082,542.5199999996	    middle	             40
--2,134,546.566521739	  	high                 46

