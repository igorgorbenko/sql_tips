-- Returning changed rows 

declare @pass_table table
(
	[id_client] [int] not null,
	[first_name] [varchar](50) null,
	[middle_name] [varchar](50) null,
	[last_name] [varchar](50) null,
	[date_birth] [smalldatetime] not null,
	[email] [varchar](50) NOT NULL,
	[region] [varchar](50) NOT NULL
)

begin tran
	delete from pass_for_test 
		output deleted.*
			into @pass_table
	where id_client = 1
rollback

select *
from @pass_table
