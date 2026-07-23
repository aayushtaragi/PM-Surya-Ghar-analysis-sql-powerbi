# PM-Surya-Ghar-analysis-excel-sql-powerbi

# ☀️ PM Surya Ghar Muft Bijli Yojana: Data Analytics Pipeline

## 📌 Project Overview
This project presents an end-to-end data analytics pipeline evaluating the performance of the **PM Surya Ghar Muft Bijli Yojana** (India's National Rooftop Solar Scheme). 

By analyzing over **7.3 Million applications**, the goal of this project was to identify execution bottlenecks, track subsidy utilization, and evaluate micro-market (district-level) performance. The analysis moves from raw public data manipulation to high-level corporate insights, providing actionable recommendations to improve national solar deployment efficiency.
---
## 🛠️ Tech Stack & Workflow
This project was built using a complete data analytics lifecycle:
*   **Microsoft Excel:** Performed initial data hygiene, standardized geographic naming conventions, and resolved structural anomalies to prepare the dataset for database ingestion.
*   **MS SQL Server (SQL):** Engineered database schemas, handled data type conversions (`TRY_CAST`), and wrote advanced analytical queries (Window Functions, CTEs) to extract core metrics.
*   **Power BI:** Developed an interactive business intelligence dashboard using DAX formulations to track national KPIs, geographical trends, and subsidy distribution.

---

## 🧠 Advanced SQL Implementation
To prove technical depth, here is an example of the SQL logic used in this project. 

**Identifying the Top 2 Performing Districts in Every State:**
Instead of just finding the top overall districts, I used Advanced Window Functions (`RANK() OVER`) to segment and isolate local execution leaders strictly within their respective state boundaries:
```sql
WITH RankedDistricts AS (
    SELECT 
        states, 
        district, 
        installations, 
        RANK() OVER (PARTITION BY states ORDER BY installations DESC) AS ranking 
    FROM pm_surya_clean
)
SELECT states, district, installations 
FROM RankedDistricts 
WHERE ranking <= 2 AND installations != 0 
ORDER BY states ASC, installations DESC;
