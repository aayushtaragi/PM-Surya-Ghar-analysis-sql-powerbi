☀️ PM Surya Ghar Muft Bijli Yojana: Data Analytics Pipeline

📌Project Overview
This project focuses on performing an end-to-end data analysis pipeline on the PM Surya Ghar Muft Bijli Yojana (National Rooftop Solar Scheme) dataset. The data encompasses national application volumes, completion rates, pending backlogs, financial subsidies, and technical capacities across various states and districts. The goal is to clean unstructured operational metrics, evaluate execution efficiency, and uncover regional bottlenecks to provide data-driven recommendations for accelerating solar adoption.

🛠 Tools Used
Microsoft Excel: For initial data pre-processing, data hygiene, and flat-file validation.

MS SQL Server (T-SQL): For database schema modification, text-to-numeric casting (TRY_CAST, REPLACE), and advanced analytical modeling (CTEs, Window Functions).

Power BI: For relational data modeling, DAX structural engineering, and building an interactive executive dashboard.

🎯 Key Analysis Performed
Schema Optimization: Cleaned raw string fields containing percentage symbols (%) and converted them into indexable floating-point metrics.

National Performance Baseline: Generated macro-level KPIs including Total Applications (7.31M), Installations (3M), Total Capacity (12.55M KW), and Total Subsidies (₹23.61K).

Volume Leader Tracking: Identified the Top 3 and Bottom 3 states based on absolute application intake and deployment volume.

Operational Choke Point Discovery: Isolated large-scale states (>50,000 applications) demonstrating critical execution inefficiencies (efficiency under 40%).

Micro-Market Micro-Partitioning: Utilized advanced database partitioning (RANK() OVER) to extract the top 2 highest-performing districts within every individual state.

Risk Assessment Analysis: Mapped and flagged specific administrative districts containing active application volumes but zero completed installations.

Capacity Grid Density: Calculated the average installed solar capacity per household across individual regions to evaluate local grid contribution styles.

📊 Key Insights
The National Backlog Challenge: While public interest is massive (7.31M applications), the national installation efficiency sits at 47.71%, leaving a heavy backlog of 4 Million pending installations.

The Andhra Pradesh Bottleneck (Critical Insight): The dashboard clearly highlights Andhra Pradesh as the state with the most severe backlog crisis. Despite crossing the 1 million application milestone, it has a staggering 83.16% pending rate, meaning only 16.84% of received applications have successfully transitioned to completed installations.

Regional Powerhouses: Gujarat, Maharashtra, and Uttar Pradesh are the primary growth engines. Gujarat leads the capacity charts, while Maharashtra has the highest overall application interest (1,339.35K).

Micro-Market Hotspots: At the district level, localized hubs like Lucknow, Nagpur, Surat, and Ahmedabad lead the country in successful rooftop deployment.

💡 Recommendations
Target Backlog Hotspots: Administrative focus and technical field teams should be dynamically shifted to Andhra Pradesh to address the massive 83% backlog and clear localized supply chain or verification blockages.

Standardize Operational Playbooks: Analyze the approval and installation workflows of high-performing hubs like Gujarat and Lucknow to create a standardized template that can be implemented in slow-moving states.

Automated Threshold Alerts: Implement a tracking system that flags any district or state as a "High-Risk Zone" the moment its pending installation rate crosses 60%, allowing management to intervene early.

📁 Files Included
pm_surya_analysis.sql: T-SQL script containing all structural modifications, aggregations, and window functions.

pm_surya_cleaned.xlsx: Structured clean source dataset post Excel pre-processing.

pm_surya_dashboard.pbix: Interactive Power BI dashboard file tracking the complete program layout.

dashboard_preview.png: High-resolution dashboard interface capture (displayed below).
