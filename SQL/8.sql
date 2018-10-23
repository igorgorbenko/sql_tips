-- Checking the correctness of the email address

select *
from pass_for_test 
where email not like '_%@__%.__%'
