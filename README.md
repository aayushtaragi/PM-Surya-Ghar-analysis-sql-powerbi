☀️ PM Surya Ghar: Muft Bijli Yojana Analysis
📌 Project Overview
This project focuses on performing an end-to-end data analysis pipeline on the PM Surya Ghar Muft Bijli Yojana (National Rooftop Solar Scheme) dataset. The goal is to clean unstructured operational data, evaluate execution efficiency across states and districts, and uncover regional supply chain bottlenecks to help accelerate solar adoption.

🛠 Tools Used
Microsoft Excel: For initial data pre-processing and removing structural anomalies.

MS SQL Server (T-SQL): For data type casting (TRY_CAST), handling string modifications, and advanced query analysis (CTEs, Window Functions).

Power BI: For building the interactive executive dashboard and calculating core DAX metrics.

🎯 Key Analysis Performed
Cleaned raw panel efficiency text data and converted it into usable float formats.

Calculated national baseline KPIs (Total Applications, Installations, Subsidies, and Capacity).

Identified top and bottom 3 states based on absolute application and installation volumes.

Isolated large-scale states with massive demand but weak installation efficiency (under 40%).

Extracted the top 2 highest-performing districts within each individual state using RANK() OVER.

Mapped specific high-risk districts with zero completed installations despite active applications.

Computed the average solar capacity installed per household across different states.

📊 Key Insights
The National Backlog: Public interest is massive (7.31M applications), but the national installation efficiency stands at just 47.71%, leaving a backlog of 4 million pending setups.

The Andhra Pradesh Bottleneck: Andhra Pradesh has the worst backlog crisis in India. Despite crossing 1 million applications, it has a staggering 83.16% pending rate (only 16.84% of applications are successfully installed).

Top Performers: Gujarat, Maharashtra, and Uttar Pradesh act as the primary growth engines, dominating capacity (MW) and subsidy absorption.

Micro-Market Leaders: At the district level, urban hubs like Lucknow, Nagpur, Surat, and Ahmedabad are executing installations the fastest.

💡 Recommendations
Clear the AP Bottleneck: Shift field installation teams and technical resources dynamically to Andhra Pradesh to resolve its 83% pending setup crisis.

Standardize Workflows: Study the fast-track approval playbooks used in high-performing areas like Gujarat and Lucknow to implement them in lagging states.

Risk Flagging: Build an automated tracker to flag any district the moment its pending installation rate crosses a 60% threshold for early intervention.

📁 Files Included
pm_surya_analysis.sql: SQL script containing all structural modifications, aggregations, and window functions.

pm_surya_cleaned.xlsx: Cleaned source dataset post Excel pre-processing.

pm_surya_dashboard.pbix: Interactive Power BI dashboard file.

dashboard_preview.png: Screenshot of the Power BI dashboard layout.
