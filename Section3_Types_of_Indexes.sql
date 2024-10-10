/*
B-Tree: The tree is balanced because the middle will always be the root of the tree
Each node will have a block value that we can call directly.
You want to use balance trees when a set has high cardinality, large ## of values in a column
Rebalance as needed to adjust data 

create index idx_staff_email
	on staff(email);

explain select 
	*
from
	staff
where email = 'bphillips5@time.com';
*/
/*
Bitmap indexes: Stores the number of bits in a value
Bits can represent boolean values, or multiple values
used when small ## of possible values in a column (low cardinality)
Filter by bitwise ops such as AND, OR, and NOT
Used MAINLY with data warehouses, as it has read-intense use cases, and few writes
Postgre will create bitmap indexes automatically, as needed
create index idx_staff_title
	on staff(job_title)


explain select * from staff
where job_title = 'Operator'
*/

/*
Hash Indexes: Hash functions mark abitrary data to a fixed value
Only used for equality comparisons, ie "="
Smaller size than B-Tree
As fast as a B-Tree, so good for performance
Good or high cardinality, and consistent operation time(linear time)
create index idx_staff_email
	on staff using hash(email)
*/

/*
Bloom Filter Indexes: Will return specified results and some that are not inclusive
	Probabilistic and space-efficient data struct
	Lossy representation of indexed attributes
	May report false positives
	Most useful for querying arbitrary combo's or large ## of attributes
	B-Tree indexes faster but require more indexes
Create a single index and specify what columns and combinations you want to return
	Specify length and number of bits for filter
Chance of false pos decrease as length increases
Note: Bloom filters are not baked into Postgre, so you need to call the extension
	CREATE EXTENSION IF NOT EXIST bloom;
*/

/*
Specialized indexes for Postgre
	GIST: Generalized Search Tree: 
	SP-GIST: Space-Paritioned GIST: Used for Non-balanced or skewed data structures
	GIN: Text indexing: Lookups are quick, but builds are slow and uses more storage
	BRIN: Block Range Indexing: Use for large data set, divides data into ordered blocks
		Keeps min and max values, search only blocks that may have range match
*/

