<h1 align="center">
Walmart Retail Analytics: ETL Pipeline, SQL Database & Power BI Dashboard
</h1>

<p align="center">

<b>
Retail Data Engineering • ETL Automation • SQL Analytics • Business Intelligence
</b>

<br><br>

Python • Pandas • SQLAlchemy • MySQL • PostgreSQL • Power BI

</p>

---

<h2>Project Overview</h2>

<p>
This project demonstrates an end-to-end retail analytics solution by developing a semi-automated 
<b>ETL (Extract, Transform, Load) pipeline</b> for Walmart sales data.
</p>

<p>
The project integrates Python-based data processing, SQL database engineering, advanced business analytics, 
and Power BI visualization to transform raw transactional data into a structured decision-support system.
</p>

<p>
The complete workflow includes:
</p>

<ul>

<li>Data Extraction from raw datasets</li>
<li>Data Cleaning and Transformation using Python</li>
<li>Feature Engineering for business metrics</li>
<li>Database integration using SQLAlchemy</li>
<li>Advanced SQL business analysis</li>
<li>Power BI dashboard development</li>
<li>KPI monitoring and business reporting</li>

</ul>


---

<h2>Business Problem</h2>

<p>
Retail companies generate large amounts of transactional data, but raw data often cannot directly support 
business decisions because of:
</p>

<ul>

<li>Multiple disconnected data sources</li>

<li>Missing and inconsistent information</li>

<li>Lack of centralized databases</li>

<li>Manual reporting processes</li>

<li>Limited visibility into sales performance</li>

</ul>


<p>
This project solves these challenges by creating a structured analytics pipeline that converts raw Walmart 
transaction data into actionable business intelligence.
</p>


---

<h2>Project Objectives</h2>

<ul>

<li>Develop a semi-automated ETL pipeline for retail data processing</li>

<li>Create a centralized SQL database for analytics</li>

<li>Perform data cleaning and validation</li>

<li>Generate business features such as revenue and profitability metrics</li>

<li>Answer business questions using advanced SQL queries</li>

<li>Connect SQL databases with Power BI dashboards</li>

<li>Create KPI-based reporting for business decision support</li>

</ul>


---

<h2>Dataset Description</h2>


<table>

<tr>
<th>Category</th>
<th>Variables</th>
</tr>


<tr>
<td>Transaction</td>
<td>Invoice ID, Date, Time</td>
</tr>


<tr>
<td>Store Information</td>
<td>Branch, City</td>
</tr>


<tr>
<td>Product Information</td>
<td>Product Category, Product Line</td>
</tr>


<tr>
<td>Sales</td>
<td>Quantity, Unit Price, Total Sales</td>
</tr>


<tr>
<td>Customer</td>
<td>Customer Type, Gender</td>
</tr>


<tr>
<td>Payment</td>
<td>Payment Method</td>
</tr>


<tr>
<td>Performance</td>
<td>Rating, Profit Margin</td>
</tr>


</table>



---

<h2>End-to-End ETL Architecture</h2>


<pre>

Raw Walmart Dataset
        |
        |
        v

Data Extraction
(CSV / Kaggle Dataset)

        |
        |
        v

Python ETL Pipeline
(Pandas)

        |
        |
        +----------------+
        |                |
        v                v

Data Cleaning       Feature Engineering

- Missing values   - Revenue
- Duplicates       - Profit
- Data types       - Time features
- Validation       - Sales metrics


        |
        |
        v

SQL Database

(MySQL / PostgreSQL)

        |
        |
        +----------------------+
        |                      |
        v                      v

SQL Business Analysis     Power BI Dashboard

        |
        |
        v

Business Insights

</pre>



---

<h2>Technologies Used</h2>


<h3>Programming</h3>

<ul>

<li>Python</li>
<li>Pandas</li>
<li>NumPy</li>

</ul>


<h3>Database & ETL</h3>

<ul>

<li>SQLAlchemy</li>
<li>MySQL</li>
<li>PostgreSQL</li>
<li>MySQL Connector</li>
<li>Psycopg2</li>

</ul>


<h3>Visualization & BI</h3>

<ul>

<li>Power BI</li>
<li>KPI Dashboard</li>
<li>Data Visualization</li>

</ul>



---

<h2>ETL Pipeline Implementation</h2>


<h3>1. Data Extraction</h3>

<p>
The Walmart dataset was extracted and loaded into Python using Pandas.
</p>


<pre>

import pandas as pd

df = pd.read_csv(
"walmart_sales.csv"
)

</pre>



<h3>2. Data Cleaning</h3>


<ul>

<li>Removed duplicate records</li>

<li>Handled missing values</li>

<li>Converted data types</li>

<li>Validated transaction records</li>

<li>Prepared data for database loading</li>

</ul>



<h3>3. Feature Engineering</h3>


<p>
New analytical features were created to support business analysis.
</p>


<pre>

df["Total_Revenue"] = (
df["Unit Price"] *
df["Quantity"]
)

</pre>


Additional features:

<ul>

<li>Monthly Sales</li>

<li>Profit Calculation</li>

<li>Sales Time Categories</li>

<li>Revenue Metrics</li>

</ul>



---

<h2>SQL Database Integration Using SQLAlchemy</h2>


<p>
The cleaned dataset was loaded into relational databases using SQLAlchemy.
</p>


<pre>

from sqlalchemy import create_engine


engine = create_engine(
"mysql+mysqlconnector://user:password@localhost/walmart"
)


df.to_sql(
"walmart",
engine,
if_exists="replace",
index=False
)

</pre>


<p>
The database structure enables scalable querying and direct connection with BI tools.
</p>



---

<h2>SQL Business Analytics</h2>


<p>
More than 14 business questions were solved using SQL queries.
</p>


<h3>Business Analysis Examples:</h3>


<ul>

<li>Payment method analysis</li>

<li>Highest-rated category by branch</li>

<li>Busiest sales day identification</li>

<li>Category profitability analysis</li>

<li>Monthly revenue trends</li>

<li>Category sales ranking</li>

<li>Weekday vs weekend performance</li>

<li>Branch sales contribution</li>

<li>Revenue decrease analysis</li>

<li>Customer purchasing behavior</li>

</ul>



<h3>Example Query</h3>


<pre>

SELECT 
branch,
SUM(total) AS revenue

FROM walmart

GROUP BY branch

ORDER BY revenue DESC;

</pre>



---

<h2>Power BI Dashboard</h2>


<p>
The SQL database was connected directly to Power BI to develop an interactive retail analytics dashboard.
</p>


<h3>Dashboard Features</h3>


<ul>

<li>Total Revenue KPI</li>

<li>Total Transactions</li>

<li>Average Customer Rating</li>

<li>Sales by Branch</li>

<li>Sales by Product Category</li>

<li>Payment Method Analysis</li>

<li>Monthly Revenue Trends</li>

<li>Customer Behavior Analysis</li>

<li>Product Performance Monitoring</li>

</ul>



<h3>Dashboard Workflow</h3>


<pre>

SQL Database

      |

      |

Power BI Connection

      |

      |

Data Modeling

      |

      |

DAX Measures

      |

      |

Interactive Dashboard

</pre>



---

<h2>Results & Insights</h2>


<ul>

<li>Created a centralized Walmart sales database.</li>

<li>Developed a reusable ETL workflow.</li>

<li>Identified high-performing branches and categories.</li>

<li>Analyzed customer payment preferences.</li>

<li>Detected sales trends and purchasing patterns.</li>

<li>Built interactive KPI dashboards for monitoring performance.</li>

<li>Improved reporting efficiency through database-driven analytics.</li>

</ul>



---

<h2>Business Recommendations</h2>


<ul>

<li>Schedule automated ETL execution for continuous reporting.</li>

<li>Use sales analytics for inventory optimization.</li>

<li>Improve promotions using customer behavior insights.</li>

<li>Monitor underperforming branches through KPI dashboards.</li>

<li>Extend the pipeline toward real-time retail analytics.</li>

</ul>



---

<h2>Repository Structure</h2>


<pre>

Walmart-ETL-Analytics-Dashboard/

│

├── data/

│   └── walmart_sales.csv

│

├── notebooks/

│   └── Walmart_ETL_Analysis.ipynb

│

├── sql/

│   └── walmart_business_queries.sql

│

├── dashboard/

│   └── Walmart_Sales_PowerBI_Dashboard.pbix

│

├── images/

│   └── walmart_project-pipelines.png

│

├── src/

│   ├── etl_pipeline.py

│   ├── database_connection.py

│   └── data_cleaning.py

│

├── requirements.txt

├── README.md

└── LICENSE

</pre>



---

<h2>Future Improvements</h2>


<ul>

<li>Automated scheduled ETL jobs</li>

<li>Real-time data ingestion pipeline</li>

<li>Cloud database deployment</li>

<li>Machine learning sales forecasting</li>

<li>Customer segmentation models</li>

<li>Recommendation system development</li>

</ul>



---

<h2>Conclusion</h2>


<p>
This project demonstrates a complete retail analytics workflow combining 
<b>Python ETL development, SQL database engineering, advanced analytics, and Power BI visualization.</b>
</p>


<p>
The pipeline transforms raw Walmart transaction data into a structured business intelligence solution 
that supports sales analysis, operational monitoring, and data-driven decision making.
</p>


<p align="center">

<b>
Python → ETL → SQL → Analytics → Power BI → Business Decisions
</b>

</p>