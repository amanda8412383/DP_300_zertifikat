--index
--clusterd index only one per table usually primary key
--non clustered index can have as many as one wish, 
--but insert/update/delete rows will result in adjustment all existing index
--when creating index option 'with (fill factor = 62)
--this means it'll leave out 38% capacitý on index page for future insertion

--row store traditional way of store, a row is a set unit
--column store it store each column seperately
--it compress strings into number coding and a value table of the number coding

--DMV dynamic management views
--gather query performance info

--sys.dm_exec_cached_plans 
--Returns a row for each query plan that is cached by SQL Server for faster query execution. You can use 
--this dynamic management view to find cached query plans, cached query text, the amount of memory 
--taken by cached plans, and the reuse count of the cached plans. 
--sys.dm_exec_sql_text 
--Returns the text of the SQL batch that is identified by the specified sql_handle. 
--sys.dm_exec_query_plan_stats 
--Returns the equivalent of the last known actual execution plan for a previously cached query plan. 
--cross apply like inner join
select *
from sys.dm_exec_cached_plans a 
cross apply sys.dm_exec_sql_text(plan_handle) b
cross apply sys.dm_exec_query_plan_stats (plan_handle) c





