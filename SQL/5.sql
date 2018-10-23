-- Error Handling

set nocount on;

begin try 
	begin tran
		insert into pass_for_test
		Select 'test', 'test', 'test', null, 'Test', 'Test'      
	
	if @@TRANCOUNT > 0
	begin
		select 'Commit transaction!' 
		commit tran;
	end

end try

begin catch
	select '!!! Error: ' + error_message(); 

	Exec sp_Send_email
	
	if @@TRANCOUNT > 0
		rollback tran;

end catch


