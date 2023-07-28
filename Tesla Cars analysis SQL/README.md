# Tesla Car Sales SQL Report
<br>

## Data Source: [Here](https://github.com/VictorOluniyi/Sales-Performance-Dashboard)

<br>

## For details to the dashboard of this sql report, click [here](https://github.com/AviatorIfeanyi/tesla_car_sales_dashboard)

<br/>

# Project Objective

## The objective of this report is to provide valuable insights that will help Tesla's management plan better for future production. 

## This report highlights the key attributes of the data, including model, period, country, purchase_type, version, price, and gross profit.

<br />




<h1 align="center"> 🛠️ Research Questions </h1>
<br />

## 1. What is the total number of car ordered

## 2. Total profit made in the 2016, 1st and 2nd quarter

## 3. What are the countries that demand tesla cars

## 4. What model of tesla car is available

## 5. Profit made by car model

## 6. Profit made by countries

## 7. Top three model version preferred in different countries

## 8. Preferred car model in different countries

## 9. Available means of payment

## 10. Orders made through available purchase_type

## 11. Profit made by month

<br />
<br />

## Create Table
```sql
CREATE TABLE car_sales (
        id INT PRIMARY KEY,
        model VARCHAR(255),
        period INT,
        country VARCHAR(255),
        purchase_type VARCHAR(255),
        version VARCHAR(255),
        price DECIMAL(10, 2),
        gross_profit DECIMAL(10, 2)
    );

```
<br />

## Insert Sample Data

```
    INSERT INTO car_sales (id, model, period, country, purchase_type, version, price, gross_profit)
    VALUES 
    (1,'Model S',201601,'US','Deposit','75D AWD',75700,22407.30),
    (2,'Model S',201601,'US','Cash purchase','75D AWD',75700,22407.30),
    (3,'Model S',201601,'US','Cash purchase','75 RWD',70700,20927.30),
    (4,'Model S',201601,'US','Cash purchase','75 RWD',70700,20927.30),
    (5,'Model S',201601,'US','Cash purchase','75 RWD',70700,20927.30),
```

<br />

```sql 
select * from car_sales limit 5;
```
| id  | model   | period | country | purchase_type | version | price    | gross_profit |
| --- | ------- | ------ | ------- | ------------- | ------- | -------- | ------------ |
| 1   | Model S | 201601 | US      | Deposit       | 75D AWD | 75700.00 | 22407.30     |
| 2   | Model S | 201601 | US      | Cash purchase | 75D AWD | 75700.00 | 22407.30     |
| 3   | Model S | 201601 | US      | Cash purchase | 75 RWD  | 70700.00 | 20927.30     |
| 4   | Model S | 201601 | US      | Cash purchase | 75 RWD  | 70700.00 | 20927.30     |
| 5   | Model S | 201601 | US      | Cash purchase | 75 RWD  | 70700.00 | 20927.30     |


<br />

## 1. What is the total number of car ordered

```sql
    select count(id) total_orders from car_sales;
```
| total_orders |
| ------------ |
| 924          |

<br />

## 2. Total profit made in the 2016, 1st and 2nd quarter

```sql
    select concat('$',sum(gross_profit)) gross_profit from car_sales;
```
| gross_profit |
| ------------ |
| $18234780.10 |

<br />

## 3. What are the countries that demand tesla cars

```sql
    select distinct country from car_sales;
```
| country   |
| --------- |
| Australia |
| US        |
| Germany   |

<br />

## 4. What model of tesla car is available

```sql
    select distinct model from car_sales;
```
| model   |
| ------- |
| Model X |
| Model S |


<br />

## 5. Profit made by car model

```sql
select model, concat('$',sum(gross_profit)) as profit from car_sales
    group by model
    order by profit desc;
```
| model   | profit       |
| ------- | ------------ |
| Model X | $7273780.00  |
| Model S | $10961000.10 |

<br />

## 6. Profit made by countries

```sql
with country_profit as(
    	select country, sum(gross_profit) as profit from car_sales
    	group by country
    	order by profit desc
    )
    
    select country, concat('$', profit) as profit from country_profit;
```
| country   | profit       |
| --------- | ------------ |
| US        | $16030886.90 |
| Germany   | $1427345.10  |
| Australia | $776548.10   |

<br />

## 7. Top three model version preferred in different countries

```sql
with top_3_preferred_version as (
    	
    select country, version, count(version) qty_bought,
    row_number() over(partition by country) as rnk
    	from car_sales
    group by country, version
    order by country, qty_bought
    )
    
    select country, version, qty_bought
    from top_3_preferred_version
    where rnk <= 3
    order by country, qty_bought desc;
```
| country   | version | qty_bought |
| --------- | ------- | ---------- |
| Australia | 75 RWD  | 42         |
| Australia | P90D    | 12         |
| Australia | 90D     | 3          |
| Germany   | 75 RWD  | 34         |
| Germany   | 60D AWD | 16         |
| Germany   | 75D AWD | 8          |
| US        | 75 RWD  | 231        |
| US        | 60D AWD | 151        |
| US        | 75D AWD | 66         |

<br />

## 8. Preferred car model in different countries

```sql
with country_preferred_car_model as (
    	
    select country, model, count(version) qty_bought,
    row_number() over(partition by country) as rnk
    	from car_sales
    group by country, model
    order by country, qty_bought
    )
    
    select country, model, qty_bought
    from country_preferred_car_model
    where rnk <= 3
    order by country, qty_bought desc;
```
| country   | model   | qty_bought |
| --------- | ------- | ---------- |
| Australia | Model S | 42         |
| Australia | Model X | 15         |
| Germany   | Model S | 80         |
| Germany   | Model X | 13         |
| US        | Model S | 480        |
| US        | Model X | 294        |

<br />

## 9. Available means of payment

```sql
    select distinct purchase_type from car_sales;
```
| purchase_type |
| ------------- |
| Deposit       |
| Cash purchase |

<br />

## 10. Orders made through available purchase_type

```sql
select purchase_type, count(id) as orders
    from car_sales
    group by purchase_type
    order by orders;
```
| purchase_type | orders |
| ------------- | ------ |
| Deposit       | 404    |
| Cash purchase | 520    |

<br />

## 11. Profit made by month

```sql
with monthly_profit as(
    	select gross_profit, 
    		case when right(period, 2) = '01' then 'January'
    		when right(period, 2) = '02' then 'February'
    		when right(period, 2) = '03' then 'March'
    		when right(period, 2) = '04' then 'April'
    		when right(period, 2) = '05' then 'May'
    		when right(period, 2) = '06' then 'June'
    		else period end as _month
    	from car_sales
    )
    select _month, sum(gross_profit) as 'monthly_profit($)'
    from monthly_profit
    group by _month
    order by 'monthly_profit($)' desc;
```
| _month   | monthly_profit($) |
| -------- | ----------------- |
| January  | 1311806.60        |
| February | 4638103.90        |
| March    | 3776738.40        |
| April    | 5267557.60        |
| May      | 2403688.90        |
| June     | 836884.70         |
