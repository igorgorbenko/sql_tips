-- string conversion to binary (4)
create function dbo.fnbinaryipv4(@ip as varchar(15)) returns binary(4)
as
begin
    declare @bin as binary(4)

    select @bin = cast( cast( parsename( @ip, 4 ) as integer) as binary(1))
                + cast( cast( parsename( @ip, 3 ) as integer) as binary(1))
                + cast( cast( parsename( @ip, 2 ) as integer) as binary(1))
                + cast( cast( parsename( @ip, 1 ) as integer) as binary(1))

    return @bin
end
go

-- binary(4) conversion to string
create function dbo.fndisplayipv4(@ip as binary(4)) returns varchar(15)
as
begin
    declare @str as varchar(15) 

    select @str = cast( cast( substring( @ip, 1, 1) as integer) as varchar(3) ) + '.'
                + cast( cast( substring( @ip, 2, 1) as integer) as varchar(3) ) + '.'
                + cast( cast( substring( @ip, 3, 1) as integer) as varchar(3) ) + '.'
                + cast( cast( substring( @ip, 4, 1) as integer) as varchar(3) );

    return @str
end;
go


SELECT dbo.fnBinaryIPv4('255.255.255.255')
-- should return 0xFFFFFFFF
go

SELECT dbo.fnDisplayIPv4( 0xFFFFFFFF )
-- should return '255.255.255.255'
go