# Modern SQL Warehousing Project

Hi there! 👋  
This is my **Modern SQL Warehousing Project** — a learning project where I practiced building a complete **data warehouse** from scratch using SQL Server.  
The idea was to start with raw data, clean and organize it, and then turn it into useful business insights through reporting and analysis.

---

## 🏗️ Project Design

For the structure, I followed the **Medallion Architecture** which has three layers:  

![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer** – Stores raw data exactly as it comes from the source (I loaded CSV files into SQL Server).  
2. **Silver Layer** – Cleans and standardizes data so it’s ready for analysis.  
3. **Gold Layer** – Contains the final, business-ready data in a **star schema** for fast and easy reporting.

---

## 📖 What I Worked On

This project covers:

- **Data Architecture** – Planning how data flows from raw files to clean tables.  
- **ETL Pipelines** – Extracting, transforming, and loading data into SQL Server.  
- **Data Modeling** – Designing fact and dimension tables for analytics.  
- **Analytics & Reporting** – Writing SQL queries to answer real business questions.

### Skills Practiced
- SQL Development  
- Data Cleaning & Transformation  
- ETL Process Design  
- Data Modeling (Star Schema)  
- Report Creation & Data Analysis  

---

## 🚀 Project Workflow

**Objective:**  
Build a small-scale, real-world style data warehouse in SQL Server using sales data from two sources.

**Steps I Followed:**
1. **Data Import** – Loaded CSV files from ERP and CRM systems into the Bronze layer.  
2. **Data Cleaning** – Fixed missing values, removed duplicates, standardized formats in the Silver layer.  
3. **Integration** – Combined data from both sources into a single, consistent data model.  
4. **Data Modeling** – Built fact and dimension tables in the Gold layer.  
5. **Analysis** – Ran SQL queries to get key business insights.

---

## 📊 Insights Generated

Some examples of the questions my queries answered:
- Who are the top customers by sales?
- Which products perform the best?
- How have sales changed over time?

These insights can help businesses make better, data-driven decisions.

---


## 🛡️ License

This project is licensed under the [MIT License](LICENSE).  
You’re free to use, modify, and share it — just give proper credit.

---

💡 *This was a great way for me to practice real-world data engineering concepts and strengthen my SQL skills.*

