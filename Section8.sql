/*
Common Table Expressions: Can be computed once or multiple times inline
Materialized CTE: Compute and store a CTE for reuse. Non-materialized or inline is standard 

Query Optimizer Hints: Inline suggestions
	SET command
	SET enable_hashjoin = off
	It is better to use ANALYZE or VACUUM instead of hints
	or use optimizing techniques that do not alter query plan behavior 

Parallel Queries: Executes parts of plan at the same time
	GATHER or GATHER MERGE appears in the query plan
	max_parallel_workers_per_gather must be greater than 0
	Query must not write data or lock rows

	Parallel plans must exceed setup and tuple cost paramets to work
	Hashjoins with execute in parallel.

Caching: Store results and increase retreival speeds
	Postgres will cache and evict data as needed
	Explain plans shows Hits(gathers data from cache) and reads
	Shared buffers will default to 128MB, but you can increase its size.
		Dedicated 25% of available memory in the seerver to the shared buffers

Helpful tips
	-Create indexes on join columns or columns used in WHERE clauses
	-Use covering indexes as it saves times
	-Use IS NULL to check for null values
	-When using functions in a WHERE clause, create a functional index for the column
	-Index range scans: Keep range small and use equality conditions
		LIKE "ABC%" can use an index, LIKE "%ABC" cannot
		Use GIN indexes for full text searches
		Use indexes to avoid sorts with ORDER BY
	-Filtering on a Range Condition:
		Use continuous conditions such as 
		TRUNC(sysdate)
		TRUNC(sysdate+1)
	-Dont store numeric data as char, varchar, or text, duh!
*/