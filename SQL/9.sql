-- Sorting ip-addresses

with ip_addresses as
(
    select '131.33.2.201'    as ip_address union all
    select '2.12.4.4'        union all
    select '131.33.2.202'    union all
    select '2.12.4.169'      union all
    select '131.107.2.201'   union all
    select '131.108.2.201'   union all
    select '255.255.255.255' union all 
    select '192.188.1.1'        
 )
select ip_address
from ip_addresses
order  by cast('/' + ip_address + '/' as hierarchyid)


