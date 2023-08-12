# **<mark>Supply Chain Analytics Project</mark>**


## **Tabel of Contents**

1. [Problem Statement](#Proplem-Statement)
2. [Task](#Task)
3. [Data Description](#Data-Description)
4. [Methodology](#Methodology)
5. [Action - Exploratory Data Analysis (EDA)](#Action-Exploratory-Data-Analysis-EDA)
6. [Dashboard](#Dashboard)
7. [Results and Insights](#Results-and-Insights)
8. [Recommendations](#Recommendations)



# **<mark>Proplem Statement</mark>**

<span style="font-size: 16.38px;">AtliQ Mart is a growing FMCG manufacturer headquartered in Gujarat, India. It is currently operational in three cities Surat,<br></span><span style="font-size: 16.38px;">Ahmedabad and Vadodara. They want to expand to other metros/Tier 1 cities in the next 2 years.<br></span><span style="font-size: 16.38px;"><br></span>

<span style="font-size: 16.38px;">AtliQ Mart is currently facing a problem where a few key customers did not extend their annual contracts due to service issues.<br></span><span style="font-size: 16.38px;">It is speculated that some of the essential products were either not delivered on time or not delivered in full over a continued<br></span><span style="font-size: 16.38px;">period, which could have resulted in bad customer service. Management wants to fix this issue before expanding to other cities<br></span><span style="font-size: 16.38px;">and requested their supply chain analytics team to track the ’On time’ and ‘In Full’ delivery service level for all the customers<br></span><span style="font-size: 16.38px;">daily basis so that they can respond swiftly to these issues.<br></span><span style="font-size: 16.38px;"><br></span>

<span style="font-size: 16.38px;">The Supply Chain team decided to use a standard approach to measure the service level in which they will measure ‘On-time<br></span><span style="font-size: 16.38px;">delivery (OT) %’, ‘In-full delivery (IF) %’, and OnTime in full (OTIF) %’ of the customer orders daily basis against the target<br></span><span style="font-size: 16.38px;">service level set for each customer.</span>





# **<mark>Task</mark>**

**1\. Perform comprehensive exploratory data analysis (EDA) to address the following inquiries and derive valuable insights from the dataset:**

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">List the columns present in each table.&nbsp;</span>        

- <span style="color:var(--vscode-foreground)"><span style="font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:black;
    mso-color-alt:windowtext">Calculate the total number of unique customers.&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>        

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Provide a count of total products and their corresponding categories available.</span>

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Determine the count of distinct cities where operations are currently taking place.</span>

- <span style="color:var(--vscode-foreground)"><span style="font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:black;
    mso-color-alt:windowtext">Calculate the total number of orders, orders on time, orders in full, and OTIF (on-time and in full) orders for each city.&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;</span>     

- <span style="color:var(--vscode-foreground)"><span style="font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:black;
    mso-color-alt:windowtext">Provide insights into the distribution of the above metrics by customers within each city.</span></span>

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Calculate the percentage variance between actual and target values for OT, IF, and OTIF metrics by city.</span>

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Identify the top and bottom 5 customers based on total quantity ordered, in full quantity ordered, and OTIF quantity ordered.</span>

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Calculate the actual OT%, IF%, and OTIF% for each customer.</span>

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Categorize orders by product category for each customer in descending order.</span>
- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Categorize orders by product category for each city in descending order.</span>

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Determine the top 3 customers from each city based on their total order count and provide their OTIF%.</span>

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Identify the most and least ordered product by each customer.</span>

- <span style="font-size:10.5pt;
    font-family:&quot;Segoe UI&quot;,sans-serif;color:black;mso-color-alt:windowtext">Distribute the total product orders by their categories and calculate the percentage share. Also, identify the top and worst selling products for each city.</span>

<span style="background-color: rgb(255, 255, 255); color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px;"><b>2. The Dashboad should include the following:</b></span>

- Design a comprehensive dashboard that provides real-time monitoring of key performance indicators (KPIs) related to order fulfillment. The dashboard should focus on three main metrics: 'On Time%', 'In Full%', and 'OTIF%' on a daily basis and split by cities and then by customer.
    
- The dashboard should display the actual values of 'On Time%', 'In Full%', and 'OTIF%' alongside their respective targets. The metrics should be color-coded using conditional formatting to indicate whether each metric is above or below its target.
    
- The dashboard should display the (LIFR%) and (VOFR%) metrics specifically for each product. Additionally, a sparkline can be added next to each product's metrics to visualize their performance trends over time.

- The dashboard should present a matrix visualization that showcases the performance of customers across all the metrics. The matrix should clearly indicate whether the customer's performance is meeting or exceeding the targets.
    
- The dashboard should allow users to drill down into the (OTIF%) performance over months. It should provide the flexibility to view performance on a weekly and daily basis as well, enabling a detailed analysis of trends and patterns.




# **<mark>Data Description</mark>**

**<h2 align="center">dim_customers table</h2>**

<h4 align="center">This table contains all the information about customers</h4>

| Column | Description | Data Type |
| :-- | :-- | :-- |
| customer\_id | Unique ID assigned to each customer | INT |
| customer\_name | Name of the customer | VARCHAR(50) |
| city | City where the customer is located | VARCHAR(50) |

---



**<h2 align="center">dim_products table</h2>**

<h4 align="center">This table contains all the information about Products.</h4>



| Column | Description | Data Type |
| :-- | :-- | :-- |
| product\_id | Unique ID assigned to each product | INT |
| product\_name | Name of the product | VARCHAR(50) |
| category | Category to which the product belongs | VARCHAR(50) |

---


**<h2 align="center">dim_date</h2>**
<h4 align="center">This table contains date-related information.</h4>


| Column                  | Description                                                         | Data Type      |
| :---------------------- | :------------------------------------------------------------------ | :------------- |
| date                    | Date at the daily level                                             | DATE           |
| mmm_yy                  | Date at the monthly level                                           |DATE            |
| week_no                 | Week number of the year (as per date)                               | VARCHAR(20)    |

---


**<h2 align="center">dim_targets_orders</h2>**

<h4 align="center">This table contains target data at the customer level.</h4>


| Column | Description | Data Type |
| :-- | :-- | :-- |
| customer\_id | Unique ID assigned to each customer | INT |
| ontime\_target% | Target assigned for On-Time % for the customer | TINYINT |
| infull\_target% | Target assigned for In-Full % for the customer | TINYINT |
| otif\_target% | Target assigned for On-Time and In-Full % | TINYINT |

---


**<h2 align="center">fact_order_lines</h2>**

<h4 align="center">This table contains information about orders and ordered items.</h4>


| Column | Description | Data Type |
| :-- | :-- | :-- |
| order\_id | Unique ID for each order placed by the customer | VARCHAR(50) |
| order\_placement\_date | Date when the order was placed | DATE |
| customer\_id | Unique ID of the customer placing the order | INT |
| product\_id | Unique ID of the product in the order | INT |
| order\_qty | Number of products requested by the customer | INT |
| agreed\_delivery\_date | Date agreed for delivery between customer and the company | DATE |
| actual\_delivery\_date | Date of actual product delivery | DATE |
| delivered\_qty | Number of products actually delivered | INT |
| On\_Time | '1' if order delivered on time, '0' if not | BIT |
| In\_Full | '1' if order delivered on time, '0' if not | BIT |
| On\_Time\_In\_Full | '1' if order delivered on time and in full, '0' if not | BIT |

---


**<h2 align="center">fact_orders_aggregate</h2>**

<h4 align="center">This table contains aggregated information about order metrics per customer.</h4>




| Column                  | Description                                                         | Data Type      |
| :---------------------- | :------------------------------------------------------------------ | :------------- |
| order_id                | Unique ID for each order placed by the customer                     | VARCHAR(50)    |
| customer_id             | Unique ID of the customer placing the order                         | INT            |
| order_placement_date    | Date when the order was placed                                      | DATE           |
| On_Time                 | '1' if order delivered on time, '0' if not                          | BIT            |
| In_Full                 | '1' if order delivered on time, '0' if not                          | BIT            |
| On_Time_In_Full         | '1' if order delivered on time and in full, '0' if not              | BIT            |

---


# **<mark>Methodology</mark>**


###  1\. **Data Collection**

- <span style="font-size: 10.5pt; font-family: &quot;Segoe UI&quot;, sans-serif;">Acquired the dataset from the company to initiate the analysis process.</span>

### 2\. **Data Understanding**

- <span style="font-size: 10.5pt; font-family: &quot;Segoe UI&quot;, sans-serif;">Conducted an in-depth exploration of the dataset's structure, comprehensively documenting available columns, data types, and referring to the data dictionary for clarification.</span>
    
- Gained an understanding of the specific business questions or objectives that need to be addressed using the dataset.
    

### 3\. **Data Quality**

- <span style="font-size: 10.5pt; font-family: &quot;Segoe UI&quot;, sans-serif;">Methodically evaluated the quality and structural integrity of the data. checked issues like if there's any missing values, outliers, inconsistencies, and data entry errors.</span>

### 4\. **Data Exploration and Cleaning**

- <span style="color: var(--vscode-foreground);"><p class="MsoNormal" style="margin: 0in -2.9pt 0in 0in; border: none; display: inline !important;"><span style="font-size: 10.5pt; font-family: &quot;Segoe UI&quot;, sans-serif;">Applied data cleaning techniques to rectify identified issues. Transformed data formats and structures as necessary to prepare the dataset for analysis.</span></p></span>

### 5\. **Data Integration**

- Thoroughly validated the results of data cleaning and transformations to guarantee the accuracy and reliability of the processed dataset.

### 6\. **Feature Engineering**

Created new variables and features from existing data that provided additional insights, such as:

- created a column named  `Month`  to extract the month of the year for each transaction. This data will assist in identifying the trend of on-time (OT), in full(IF), and on-time in-full(OTIF) delivery varies over different months.

- created a column named  `Day_Name`  to extract the specific day of the week when each transaction occurred (Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday). This data will aid in understanding the distribution of customer orders based on the days of the week

### 7\. **SQL** **Query Types Used**

- CTEs
    
- JOINS
    
- ROW\_NUMBER()
    
- COUNT(DISTINCT...)
    
- AVG( )
    
- DATEDIFF( )
    
- SUM(CASE....)
    
- Subqueries
    
- ROUND( )
    
- MIN/MAX (CASE...)
    
- CASE statement
    
- CONCAT( )
    
- MONTH( )
    
- DATEPART(WEEKEND...)




### **Data Model**

![Data Model](https://github.com/MohamedMohsen01/SQL-Projects/assets/109850173/7be95d4c-81f2-486f-9296-d94d87c8bed2)



### 9. **Dax Functions Used**

- AVERAGE( )
    
- DIVIDE ( ) 
    
- DIVIDE(SUM... )
    
- SUM( )
    
- COUNT( )



# **<mark>Action-Exploratory Data Analysis (EDA)</mark>**


### **Let's get an overview of the data**

    

