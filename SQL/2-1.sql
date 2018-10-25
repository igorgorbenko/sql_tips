-- Specified sort

declare @order nvarchar(200)
set @order = 'id_client'


select *
from pass_for_test
order by 
    case
        when @order = 'id_client'
            then id_client
        when @order = 'first_name'
            then first_name
        when @order = 'date_birth'
            then date_birth
    end
