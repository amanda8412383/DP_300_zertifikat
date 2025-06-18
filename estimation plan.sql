select *
from saleslt.address a
cross join saleslt.address b
--estimated execute plan
--execution run from left to right
--arrow thickness = number of rows
--more estimated row requires more memory reserve

set showplan_all on
go

set showplan_all off
go