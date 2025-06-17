select *
from saleslt.address a
cross join saleslt.address b
--estimated execute plan
--execution run from left to right
--hour thickness = number of rows