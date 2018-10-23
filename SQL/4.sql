select date_birth
from pass_for_test
where date_birth = '19631116'

-- Simply update	 
begin tran
	update a
	set date_birth = dateadd(d, 1, date_birth)
	from
		(
			select top 1 date_birth
			from pass_for_test
			where date_birth = '19631116'
		) as a
rollback

-- Update operation with the window function
begin tran
	update a
	set date_birth = dateadd(d, 1, date_birth)
	from
		(
			select 
				row_number() over(order by date_birth) as num_row,
				date_birth
			from pass_for_test
			where date_birth = '19631116'
		) as a
		where a.num_row = 2
rollback

