-- The closest birthday this week 

set datefirst 1;

select getdate()	
-- 2016-11-21 22:44:33.967
select datefromparts('2000', month(getdate()), day(getdate()))	
-- 2000-11-21
select datepart(week, getdate()) 
-- 48

declare 
	@curDate	date,
	@week		smallint

set @curDate = datefromparts(year(getdate()), month(getdate()), day(getdate()))
set @week = datepart(week, getdate())

select 
	p.first_name,
	p.middle_name,
	p.last_name,
	p.date_birth,
	cast(datediff(dd, date_birth, getdate())/365.25 as int) as age
from pass_for_test p
where datepart(week, datefromparts(year(getdate()), 
	month(date_birth), day(date_birth))) = @week
order by
	case
		when  @curDate > datefromparts(year(getdate()), 
			month(date_birth), day(date_birth)) 
			then
				1
		else
			0
	end,
	datefromparts(year(getdate()), 
		month(date_birth), day(date_birth)) 
