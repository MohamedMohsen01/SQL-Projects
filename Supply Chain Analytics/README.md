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
