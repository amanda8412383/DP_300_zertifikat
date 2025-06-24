--index
--clusterd index only one per table usually primary key
--non clustered index can have as many as one wish, 
--but insert/update/delete rows will result in adjustment all existing index
--when creating index option 'with (fill factor = 62)
--this means it'll leave out 38% capacit� on index page for future insertion

--row store traditional way of store, a row is a set unit
--column store it store each column seperately
--it compress strings into number coding and a value table of the number coding

--DMV dynamic management views
--gather query performance info

--1. retrieved cached query plan
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




--2.top n or most CPU times 
--sys.dm_exec_query_stats 
--Returns aggregate performance statistics for cached query plans in SQL Server. The view contains one 
--row per query statement within the cached plan, and the lifetime of the rows are tied to the plan itself. 
--When a plan is removed from the cache, the corresponding rows are eliminated from this view. 
select *
from sys.dm_exec_query_stats 

--sys.dm_exec_procedure_stats 
--Returns aggregate performance statistics for cached stored procedures. The view returns one row for 
--each cached stored procedure plan, and the lifetime of the row is as long as the stored procedure 
--remains cached. When a stored procedure is removed from the cache, the corresponding row is 
--eliminated from this view.
select *
from sys.dm_exec_procedure_stats

--3. Find still running sessions (right now)  
--concurrent request (status = runnable)
--sys.dm_exec_requests 
--Returns information about each request that is executing in SQL Server. 
select *
from sys.dm_exec_requests 

--get current sessionid
select @@spid

--4. Current active sessions right now 
--sys.dm_exec_connections 
--Returns information about the connections established to this instance of SQL Server and the details of 
--each connection. Returns server wide connection information for SQL Server. Returns current database 
--connection information for SQL Database. 
--dm_exec_connections contains additional information for sessions established by external clients, including protocol details comparing to sys. dm_exec_requests 

select *
from sys.dm_exec_connections 




--5. Data and log I/O usage 
--sys.dm_db_resource_stats (Azure SQL Database) 
--Returns CPU, I/O, and memory consumption for an Azure SQL Database database or an Azure SQL 
--Managed Instance. One row exists for every 15 seconds, even if there is no activity. Historical data is 
--maintained for approximately one hour. 
select *
from sys.dm_db_resource_stats


--sys.resource_stats (all databases – must be in "master" database in Azure SQL Database 
--when executing it). 
--Returns CPU usage and storage data for an Azure SQL Database. The data is collected and aggregated 
--within five-minute intervals. For each user database, there is one row for every five-minute reporting 
--window in which there is a change in resource consumption. The data returned includes CPU usage, 
--storage size change, and database SKU modification. Idle databases with no changes may not have rows 
--for every five-minute interval. Historical data is retained for approximately 14 days. 
select *
from sys.resource_stats








--sys.server_resource_stats (Managed Instance) 
--Returns CPU usage, IO, and storage data for Azure SQL Managed Instance. The data is collected and 
--aggregated within five-minute intervals. There is one row for every 15 seconds reporting. The data 
--returned includes CPU usage, storage size, IO utilization, and SKU. Historical data is retained for 
--approximately 14 days.
select *
from sys.server_resource_stats


--sys.elastic_pool_resource_stats (elastic pool databases) 
--Returns resource usage statistics for all the elastic pools in a SQL Database server. For each elastic pool, 
--there is one row for each 15 second reporting window (four rows per minute). This includes CPU, IO, 
--Log, storage consumption and concurrent request/session utilization by all databases in the pool. This 
--data is retained for 14 days. 

--Elastic pools is a cost-effective way to manage and scale multiple databases that have unpredictable usage patterns. 
--They provide a shared pool of resources (DTUs or vCores) that can be dynamically allocated to the databases within the pool 
select *
from sys.elastic_pool_resource_stats

--6. Find long running transactions 
--sys.dm_tran_active_transactions 
--Returns information about transactions for the instance of SQL Server.
select *
from sys.dm_tran_active_transactions ;

--7.Indexes 
--sys.dm_db_missing_index_details 
--Returns detailed information about missing indexes, excluding spatial indexes.  
--In Azure SQL Database, DMVs cannot expose information that would impact database containment or 
--expose information about other databases the user has access to. 


select *
from sys.dm_db_missing_index_details ;
--equality_columns : where column a = b
--inequality_columns : where column a <> b

--sys.dm_db_missing_index_group_stats 
--Returns summary information about groups of missing indexes, excluding spatial indexes.

select *
from sys.dm_db_missing_index_group_stats 
--avg_user_impact,percentage of average benefit if added index
--avg_total_user_cost average cost that could be reduce by index

--sys.dm_db_missing_index_groups 
--This DMV returns information about indexes that are missing in a specific index group, except for spatial 
--indexes. 
select *
from sys.dm_db_missing_index_groups 

--sys.dm_db_missing_index_group_stats_query 
--Returns information about queries that needed a missing index from groups of missing indexes, 
--excluding spatial indexes. More than one query may be returned per missing index group. One missing 
--index group may have several queries that needed the same index. 

select *
from sys.dm_db_missing_index_group_stats_query 

--hint
--specify join, union, group method for machine in option
--should be avoided in general
--multiple method can be given together in option seperated by comma
--keepfixedplan: only recompile when underlying schema(e.g. column)/ changed. remain if stats changed
--keepplan: compile less when statistic change (e.g. row cange)
--optimize for unknown: use the average selection of where
--option(optimize  for (@parameter unknown)) is often used in procedure 
--robust plan: work for maximum potential row size









