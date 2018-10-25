-- The values through a separator

declare @names nvarchar(50) = ''

select @names = @names + a.first_name + ';'
from (
        select distinct s.first_name
        from pass_for_test s
    ) as a

 select @names as result
