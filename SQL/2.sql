-- Specified sort
select  *
from pass_for_test
where last_name = 'Sidorov'
    and middle_name = 'Ivanovich'
    and region = 'Australia'
order by 
    case
        when first_name = 'Nikolay'
            then 0
        else
            1
    end,
    first_name


select  *
from pass_for_test
where last_name = 'Sidorov'
    and middle_name = 'Ivanovich'
    and region = 'Australia'
order by 
    first_name
