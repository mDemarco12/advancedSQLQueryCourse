/*
Materialized Views: Precomputed queries
	They duplicate data already stored in tables, updates needs to done on a consistent basis
		There is a potential for inconsistencies between source table and view

	Good to save time on query response at cost of storage
	
create materialized view mv_staff as 
	select 
	s.last_name, s.department, s.job_title,
	cr.company_regions
from
	staff s
inner join
	company_regions cr
on
	s.region_id = cr.region_id
*//*
--Refreshing Materialized Views
--refresh materialized view mv_staff;
create materialized view sensor_metrics as 
	select 
	s.sensor_id,
	measure_data,
	temp,
	Humidity,
	Pressure
from 
	sensor_metric
where s.senor_id > 9000
*/

