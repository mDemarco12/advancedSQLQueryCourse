/*
Horizontal Partitioning: Split a large table into smaller sections. (Layering a cake)
	This limits scans to subset partitions, local indexes for each part., and efficient adding and deletion ops.
	Used in Data Warehouses, Timeseries data, and natural Partition data

Vertical Paritioning: Split table based on column. (Cutting a sandwich in half)
	Use same primary key in all tables, increases ## of rows in data block,
		global indexes for each partition, can reduce I/O operation.
	Used in data warehouses multi-attribute tables, and data analytics

Range Partitioning: Horizontal Partitioning based on a range (date, numeric range, alphabetic range)
	Partitions are bound by min, max values to the partition key. 
	Use to query latest data, compare to historic data, report within a range, or drop data after a period of time.
	
*/ 
/*
create table iot_measurement
(location_id int not null,
measurement_datetime TIMESTAMP not null,
temp_celcius int,
rel_humidity int)
partition by range (measurement_datetime)

create table iot_measurement_wk1_2024 
partition of iot_measurement
for values from ('2024-01-01') to ('2024-01-08');

create table iot_measurement_wk2_2024 
partition of iot_measurement
for values from ('2024-01-08') to ('2024-01-15');

create table iot_measurement_wk3_2024 
partition of iot_measurement
for values from ('2024-01-15') to ('2024-01-22');
*/

/* 
List Partitioning: Horizontal Partitioning except data is organized based on a partition key
	Each partition can have its own indexes, constraints, and defaults
	Use when data logically groups into subgroups, queries are executed within subgroups, and data is not time oriented
		to warrant parition by range
		
create table products
(prod_id int not null,
prod_name text not null,
prod_descr text,
prod_category text)
partition by LIST(prod_category)

create table product_clothing
partition of products
for values in ('casual', 'business', 'formal');

create table product_electronics
partition of products
for values in ('mobile', 'laptops', 'tablets');

create table product_kitchen
partition of products
for values in ('food-processor', 'cutlery', 'pans');
*/
/*
Hash partitioning: Horizontal Partitioning based on a modulus of hash partition key
	Modulus: number of partitions; Available in Postgres, Oracle, and MySQL
	Use when data does not logically group into subgroups, when you want an even distribution across partitions,
		and when there is no need for subgroup specific operations, for example, drop a partition.

create table customer_interactions
(ci_id int not null,
ci_url text not null,
time_at_url int not null,
click_sequence int not null)
partition by hash (ci_id)

create table customer_interactions_1
partition of customer_interactions
for values with (modulus 5, remainder 0);

create table customer_interactions_2
partition of customer_interactions
for values with (modulus 5, remainder 1);

create table customer_interactions_3
partition of customer_interactions
for values with (modulus 5, remainder 2);

create table customer_interactions_4
partition of customer_interactions
for values with (modulus 5, remainder 3);
*/




