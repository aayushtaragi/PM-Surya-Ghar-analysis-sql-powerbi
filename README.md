# ☀️ PM Surya Ghar: Muft Bijli Yojana – Data Analysis Dashboard

## 📌 Project Overview

Performed an end-to-end data analysis of the **PM Surya Ghar: Muft Bijli Yojana (National Rooftop Solar Scheme)** dataset to evaluate implementation progress, identify regional installation bottlenecks, and analyze state- and district-level performance using **Excel**, **SQL Server**, and **Power BI**.

---

## 🛠️ Tools & Technologies

* 📊 **Microsoft Excel** – Data Cleaning & Pre-processing
* 🗄️ **MS SQL Server** – Data Transformation, CTEs, Window Functions
* 📈 **Power BI** – Dashboard Development, DAX, Interactive Visualizations

---

## 🔍 Key Responsibilities

* 🧹 Cleaned and standardized raw operational data using Excel and SQL Server.
* 🔄 Converted text-based numerical fields using `TRY_CAST()` and string manipulation functions.
* 🧠 Built SQL queries using **CTEs**, **Window Functions**, **GROUP BY**, and **RANK() OVER()** for advanced analysis.
* 📊 Developed an interactive Power BI dashboard with KPIs, slicers, drill-downs, and DAX measures.
* 🌍 Analyzed application, installation, subsidy, and rooftop solar capacity trends across states and districts.

---

## 📊 Analysis Performed

* ✅ Calculated national KPIs including Total Applications, Installations, Subsidies Released, and Installed Capacity.
* 🏆 Identified the top and bottom-performing states by application and installation volume.
* 📉 Evaluated installation efficiency and highlighted states with high demand but low execution rates.
* 🥇 Ranked the top two performing districts within each state using SQL Window Functions.
* 🚩 Identified districts with zero completed installations despite active applications.
* ⚡ Computed the average installed solar capacity per household across states.

---

## 💡 Key Insights

* 📌 Analyzed over **7.31 million** rooftop solar applications nationwide.
* 📈 Found a national installation efficiency of **47.71%**, indicating a backlog of approximately **4 million** pending installations.
* 🚨 Identified **Andhra Pradesh** as the largest execution bottleneck with only **16.84%** installation completion.
* 🌟 Observed that **Gujarat, Maharashtra, and Uttar Pradesh** contributed the highest installed capacity and subsidy utilization.
* 🏙️ Identified districts such as **Lucknow, Nagpur, Surat, and Ahmedabad** among the strongest performers in installation execution.

---

## 🚀 Recommendations

* 🎯 Prioritize resource allocation to states with high pending installation rates.
* 📖 Replicate best practices from high-performing states to improve implementation efficiency.
* 🔔 Introduce automated monitoring to flag districts with high installation backlogs for early intervention.

---

## 📂 Project Files

* 📜 **pm_surya_analysis.sql** – SQL queries for data cleaning and analysis
* 📗 **pm_surya_cleaned.xlsx** – Cleaned source dataset
* 📊 **pm_surya_dashboard.pbix** – Interactive Power BI dashboard
* 🖼️ **dashboard_preview.png** – Dashboard preview
