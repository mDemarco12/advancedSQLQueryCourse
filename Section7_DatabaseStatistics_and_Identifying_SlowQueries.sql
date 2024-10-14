/*
Postgres ANALYZE command: Collects statistics in columns, tables, or schemas
	Run automatically by AUTOVACUUM deamon or manually
		VACUUM will reclaim space of updated data
	REINDEX command
		Collections and repairs corrupted indexes

PG_STAT_STATEMENTS: Requires access from DBA
	PG Stat Views: User, database, and quert IDs as well as query text
	Plain stats, min, max and std of time spend planning and executing

Reviewing execution plans with Explaining
	AUTO_EXPLAIN: Logs the execution plans of slow statments automatically, without having to write EXPLAIN in query
	auto_explain.log_min_duration, auto_explain.log_nested, auto_explain.log_level
PG_STATS: Describes the dist of data in a table
	Restricted to accessible data to the account
	Columns, Schema, table, and column name
	Average size and fraction of NULLs		
*/