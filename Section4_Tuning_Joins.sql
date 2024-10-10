 /*
 Types of Joins:
 	Inner Join, Left Outer Join, Right outer join, full outer join
	 Inner: Returns both tables that have corresponding row in the other table
	 LEft: Returns all rows from left table, and rows from right table with matching keys
	 Right: Like left, but flipped
	 Full: Returns all rows from both tables

	Prefer inner joins as they are often faster, outer and full joins 
	require additional steps in than inner
 */
 /*
	Nested Loop Joins: Works with any type of join, uses two loops,
		outer iterates over one table, the driver
		innner iterates on the other, the join
		Outer executes once, inner executes per each row in join
	Benefit: Low overhead, works well with small tables, 
		small driver tables and joined column is indexed
	Cons: Can be slow, if tables are in memory (slow as hell), 
		indexes are needed especially covered indexes.

 set enable_nestloop=true;
 set enable_hashjoin=false;
 set enable_mergejoin=false; 
 
 explain select s.id, 
 s.last_name, s.job_title, cr.country
 from staff s
 inner join company_regions cr
 on s.region_id = cr.region_id
  */
/*
Hash functions: map a length og data to a value that acts as an index
	into an array. 
	Hash values are virtually unique

You need to build a table of hash values in a table.
Calculate the hash value of the key and lookup key in the hash table. 
Pros: Provide fast lookup compared to other join methods


 set enable_nestloop=false;
 set enable_hashjoin=true;
 set enable_mergejoin=false; 

 explain select 
 	s.id,s.last_name,
	s.job_title, cr.country
from staff s 
inner join company_regions cr
on s.region_id = cr.region_id
*/

/* 
Merge Joins: Sort input prior to lookup key-values.
They are limited to equality joins, works well with large tables

 set enable_nestloop=false;
 set enable_hashjoin=false;
 set enable_mergejoin=true;

explain select 
 	s.id,s.last_name,
	s.job_title, cr.country
from staff s 
inner join company_regions cr
on s.region_id = cr.region_id
*/
/*
Subqueries vs. joins: Optimize query for clarity. In many cases, 
	opt for one that makes intentions clear. 
*/
 

  