select *
from saleslt.address a
cross join saleslt.address b
--estimated execute plan
--execution run from left to right
--arrow thickness = number of rows
--more estimated row requires more memory reserve
--showing estimation plan details
set showplan_all on
go

set showplan_all off
go

--adding nonclusterd index turn scan for city to seek
create nonCLUSTERED INDEX ixcitty 
on saleslt.address (city asc)
go

--loop type
--1.nestedloop is efficient bcs it's indexed
--it used the minmum input/output and fewest comparison
--it take one rows from the top table and match all rows in the bottom

--2.merge join
--used when tables are not small
--it's a sorted join
-- it's fast

--3.hashmatch
--happen when indexes are missed
--least favorite, unsorted and non-indexed

--4. batch mode adaptive join
--once the first input is scanned, it convert into nested join/hashmatch

-- seek is more efficient than scan
-- "sargable" means that a query's conditions (predicates) are structured in a way that allows the database system to effectively use indexes for faster data retrieval
--string = 'sth' is a scan
--string like 'sth%' is a seek
--string like '%sth' is a scan
--isnull, left, year are all scan

--if  field type nvarchter is too wide, it increase the search time
create proc nameodproc (@year int) with compile as
select *
from saleslt.address a
order by city
--this will force the process to look at parameter instead of the cached estimated plan everytime it's execude
--should only be used on very different statistic
