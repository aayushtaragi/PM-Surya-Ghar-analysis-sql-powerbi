use PM_surya;

/* alter table pm_surya_clean
add efficiency_percentage float;

UPDATE pm_surya_clean
SET efficiency_percentage = TRY_CAST(REPLACE(efficiency_percent, '%', '') AS FLOAT);

 alter table pm_surya_clean
drop column efficiency_percent ;*/

select * from pm_surya_clean ;

/*NATIONAL OVERVIEW KPIs*/

select sum(applications) as Total_Applications_Received,
SUM(installations) as Total_Installations_Completed,SUM(pending) as total_pending_installations,
cast(
(SUM(installations)*100.0/sum(applications))
as decimal(10,2)) as Overall_Installation_Efficiency,
cast(
(sum(installationCapacity_KW)/1000.0)
as decimal(10,2)) as Total_Installed_Capacity_Mega_watt,
cast((SUM(subsidy_Amount)/10000000.0) as decimal(10,2)) as Total_Subsidy_Released_in_crore
from pm_surya_clean;



/*-------------------------------------------------STATE PERFORMANCE ANALYSIS--------------------------------------------------------------*/
select * from pm_surya_clean;

/*Top 3 States by Application Volume*/


select top 3 states as states, sum(applications) as total_applications
from pm_surya_clean
group by states
order by total_applications desc;

/*Bottom 3 States by Application Volume*/
select top 3 states as states, sum(applications) as total_applications
from pm_surya_clean
group by states
order by total_applications asc;


/*Top 3 States by Installation Volume*/
select top 3 states,sum(installations) as total_installations
from pm_surya_clean
group by states
order by total_installations desc ;

/*Bottom 3 States by Installation Volume*/
select top 3 states,sum(installations) as total_installations
from pm_surya_clean
group by states
order by total_installations asc ;



/*“Top 5 Large-Scale States having application more 50000 by Installation Efficiency”*/

WITH cte AS 
(
SELECT states,
        SUM(applications) AS applications,
        SUM(installations) AS installations
        FROM pm_surya_clean
        GROUP BY states
)
SELECT top 5 states as state_name,CAST((installations * 100.0 / applications )AS DECIMAL(10,2)) AS efficiency_percentage
FROM cte
WHERE applications > 50000
order by efficiency_percentage desc;



/* Top 5 Under-Performing Large-Scale States by Installation Efficiency */
WITH cte AS 
(
SELECT states,
        SUM(applications) AS applications,
        SUM(installations) AS installations
        FROM pm_surya_clean
        GROUP BY states
)
SELECT top 5 states as state_name,CAST((installations * 100.0 / applications )AS DECIMAL(10,2)) AS efficiency_percentage
FROM cte
WHERE applications > 50000
order by efficiency_percentage asc;

/*States with high demand but weak execution efficiency*/
WITH cte AS
(
    SELECT 
        states,
        SUM(applications) AS applications,
        SUM(installations) AS installations
FROM pm_surya_clean
GROUP BY states
)
SELECT 
states,
applications,
installations,
CAST(installations * 100.0 / applications
    AS DECIMAL(10,2)) AS efficiency_percentage
FROM cte WHERE applications > 50000
AND (installations * 100.0 / applications) < 40
ORDER BY efficiency_percentage ASC;


/*States with Highest Pending Installations*/

select top 5 states,sum(pending) as pending_installations from pm_surya_clean
group by states
order by pending_installations desc; 


/*States with Highest Installed Capacity*/

select top 5 states,cast((sum(installationCapacity_KW)/1000.00) as decimal(10,2)) as installed_capacity_MW from pm_surya_clean
group by states
order by installed_capacity_MW desc;

/*States with Highest Subsidy Disbursement*/

select top 5 states,cast((sum(subsidy_Amount)/10000000) as decimal(10,2)) as subsidy_Amount_in_crores from pm_surya_clean
group by states
order by subsidy_Amount_in_crores desc;

/*-------------------------------------------------DISTRICT PERFORMANCE ANALYSIS----------------------------------------------------------------*/

select * from pm_surya_clean 

/*Districts with Zero Installations Despite Applications*/

select states,count(District) as pending_districts from pm_surya_clean where installations =0 and applications>0
group by states;


/*Top Districts by Pending Installations*/

select top 5 district,states,
sum(pending) as pending_installations
from pm_surya_clean
group by district,states
order by pending_installations desc;



/*Best Performing District in Each State by Installation Efficiency*/

WITH cte AS 
(
SELECT states,district,CAST((installations * 100.0 / applications)
AS DECIMAL(10,2)
) AS efficiency_percentage,
RANK() OVER(PARTITION BY states ORDER BY (installations * 100.0 / applications) DESC) AS ranking 
FROM pm_surya_clean WHERE applications >= 1000
)
SELECT states,district,efficiency_percentage
FROM cte WHERE ranking = 1;

/*Top 2 Districts in Each State by Installation Volume*/
with cte as 
(
select states,
district,
installations,
rank()over(partition by states order by installations desc) as ranking 
from pm_surya_clean
)
select states,district,installations
from cte where ranking<=2 and installations !=0
order by states asc,installations desc;


/*Best 5 Large-Scale Districts(application>=1000) by Efficiency*/

select top 5 states,district,applications,installations,efficiency_percentage from pm_surya_clean
where applications >=1000
order by efficiency_percentage desc;



/*under-performing 5 Large-Scale Districts(application>=1000) by Efficiency*/
select top 5 states,district,applications,installations,efficiency_percentage from pm_surya_clean
where applications >=1000
order by efficiency_percentage asc

/*States with Highest Pending Installation Ratio*/

select top 5 states,
sum(applications) as total_applications,
sum(pending) as total_pending,
cast((sum(pending) * 100.0 / sum(applications))
as decimal(10,2)) as pending_ratio_percentage
from pm_surya_clean
group by states
order by pending_ratio_percentage desc;

/*State Contribution to National Installed Solar Capacity*/
SELECT states,
    CAST((SUM(installationCapacity_KW) * 100.00) / 
        (SELECT SUM(installationCapacity_KW) FROM pm_surya_clean) 
    AS DECIMAL(10,2)) AS contribution_percentage
FROM pm_surya_clean
GROUP BY states
ORDER BY contribution_percentage DESC;

/*Average Installed Capacity per Household Installation in each state*/
select states,cast( (sum(installationCapacity_KW)*1.0 / SUM(installations) ) as decimal(2) ) as average_installed_capacity 
from pm_surya_clean where installations>0
group by states
order by average_installed_capacity desc;


/*Top Districts by Installed Solar Capacity*/

select top 5 district,states,
cast(sum(installationCapacity_KW)/1000.0 as decimal(10,2)) as solar_capacity_MW
from pm_surya_clean 
group by district,states
order by solar_capacity_MW desc;

/*District-wise Installation Density Analysis*/
select states ,district,sum(installations) as solar_Installation
from pm_surya_clean 
group by states,district
order by solar_Installation desc; 

/*Top States by Average Solar Capacity per Installation*/

select top 5 states,
cast(sum(installationCapacity_KW)* 1.0 / sum(installations) as decimal(10,2)) as solar_capacity_MW
from pm_surya_clean  where installations > 0
group by states
order by solar_capacity_MW desc;

/*National Installation Backlog Percentage*/

SELECT CAST((SUM(pending) * 100.0 / SUM(applications))AS DECIMAL(10,2)
) AS national_backlog_percentage
FROM pm_surya_clean;