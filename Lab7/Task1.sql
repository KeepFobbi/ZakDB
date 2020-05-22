create database Lab_Index
USE Lab_Index

create table test_index(
id int not null,
pole1 char(36) not null,
pole2 char(216) not null
)

insert into test_index
values(1, 'a','b')

declare @i as int=31
while @i<240
begin
	set @i = @i+1;
	insert into test_index
		values(@i, 'a','b')
	end;


insert into test_index
values(241, 'a','b')


select OBJECT_NAME(object_id) as table_name,
name as index_name, type, type_desc
from sys.indexes
where OBJECT_ID = OBJECT_ID(N'test_index')

select  * from sys.dm_db_index_physical_stats(DB_ID(),null,null,null,null)


select index_type_desc, page_count, record_count, avg_page_space_used_in_percent 
from sys.dm_db_index_physical_stats
(db_id (N'test_index_db'), OBJECT_ID(565577053), null, null,'Detailed')
where object_id = 565577053

exec dbo.sp_spaceused @objname = N'test_index',@updateusage=true;

truncate table test_index

create clustered index idx_cl_id on test_index(id)

declare @i as int=0
while @i<18630
begin
	set @i = @i+1;
	insert into test_index
		values(@i, 'a','b')
	end;


select index_type_desc,  index_depth, index_level, page_count,
record_count, avg_page_space_used_in_percent, 
	avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats
(db_id(N'test_index_db'), OBJECT_ID(565577053), Null,
 Null, 'Detailed')
 where object_id = 565577053

exec dbo.sp_spaceused @objname = N'test_index', @updateusage = true;

insert into test_index
values(18631, 'a','b') 

truncate table test_index
declare @i as int=0
while @i<8906
begin
	set @i = @i+1;
	insert into test_index
		values(@i%100, 'a','b')
	end;


insert into test_index
values(8909%100, 'a','b')


truncate table test_index
drop index idx_cl_id on test_index
create clustered index idx_cl_pole1 on test_index(pole1)

declare @i as int=0
while @i<9000
begin
	set @i = @i+1;
	insert into test_index
		values(@i, format(@i, '0000'),'b')
	end;



truncate table test_index
declare @i as int=0
while @i<9000
begin
	set @i = @i+1;
	insert into test_index
		values(@i, cast(newid() as char(36)),'b')
	end;

alter index idx_cl_pole1 on test_index rebuild

drop index idx_cl_pole1 on test_index
 
create nonclustered index idx_ncl_pole1 on test_index(pole1)
truncate table test_index

declare @i as int=0
while @i<24472
begin
	set @i = @i+1;
	insert into test_index
		values(@i, format(@i, '0000'),'b')
	end;

insert into test_index
values(24473, '000024473','b')


drop index idx_cl_id on test_index
create clustered index idx_cl_pid on test_index(id)
 create nonclustered index idx_ncl_pole1 on test_index(pole1)
 truncate table test_index

declare @i as int=0
while @i<28864
begin
	set @i = @i+1;
	insert into test_index
		values(@i, format(@i, '0000'),'b')
	end;
	insert into test_index
		values(28865, '000028865','b')
	select * from test_index



select index_type_desc,  index_depth, index_level, page_count,
record_count, avg_page_space_used_in_percent, 
	avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats
(db_id(N'test1'), OBJECT_ID('565577053'), Null,
 Null, 'Detailed')
 where object_id = 565577053

 exec dbo.sp_spaceused @objname = N'test_index', @updateusage = true;

 alter index idx_ncl_pole1 on test_index rebuild
 alter index idx_cl_pid on test_index rebuild