-- DUMMY data preparing
drop table if exists pass_for_test

create table pass_for_test
	(
		id_client	int identity primary key,
		first_name	varchar(50) not null,
		middle_name	varchar(50) not null,
		last_name	varchar(50) not null,
		date_birth	date not null,
		email		varchar(50) not null,
		region		varchar(50) not null
	)


declare 
	@start_date	date,
	@end_date	date

select
	@start_date = '19600101',
	@end_date	= '19900101'

-- select getdate()		2016-11-20 17:00:39.340
-- select rand(checksum(newid())) * (datediff(d, '19600101', '19900101'))		4673,03529986249

insert into pass_for_test
select 
	first_name,
	middle_name,
	last_name,
	dateadd(dd, rand(checksum(newid())) * (datediff(dd, @start_date, @end_date)), 
	@start_date) as date_birth,
	last_name + first_name + left(middle_name, 1) + '.' + region + '@' + organization + '.com',
	region
from 
	(
		select 'Ivan' as first_name union
		select 'Petr' union
		select 'Sidor' union
		select 'Aleskey' union
		select 'Nikolay' union
		select 'Pavel' union
		select 'Roman' 
	) as first_name
	cross join
	(
		select 'Ivanovich' as middle_name union
		select 'Petrovich' union
		select 'Sidorovich' union
		select 'Alekseevich' union
		select 'Nikolaevich' union
		select 'Pavlovich' union
		select 'Romanovich'  
	) as middle_name
	cross join 
	(
		select 'Ivanov' as last_name union
		select 'Petrov' union
		select 'Sidorov' union
		select 'Alekseev' union
		select 'Nikolaev' union 
		select 'Pavlov' union
		select 'Romanov' 
	) as last_name
	cross join 
	(
		select 'Apple' as organization union
		select 'Oracle' union
		select 'IBM' union
		select 'Microsoft' union
		select 'Google' union 
		select 'Yandex' union
		select 'Cisco' 
	) as organization
	cross join 
	(
		select 'Western Europe' as region union
		select 'Eastern Europe' union
		select 'Asia' union
		select 'Africa' union
		select 'North America' union
		select 'South America' union 
		select 'Australia' 
	) as region

select  *
from pass_for_test
order by 7

