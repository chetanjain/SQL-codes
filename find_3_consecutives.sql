-- create a table
create table bms (seat_no int ,is_empty varchar(10));
insert into bms values
(1,'N')
,(2,'Y')                                                  
,(3,'N')                                                  
,(4,'Y')
,(5,'Y')
,(6,'Y')
,(7,'N')
,(8,'Y')
,(9,'Y')
,(10,'Y')
,(11,'Y')
,(12,'N')
,(13,'Y')
,(14,'Y');
--Option : 1
-- with bms1 as (
-- select *
-- , lead(is_empty,1) over (order by seat_no) next1
-- , lead(is_empty,2) over (order by seat_no) next2
-- , lag(is_empty,1) over (order by seat_no) prev1
-- , lag(is_empty,2) over (order by seat_no) prev2
--   from bms
-- )
-- select seat_no,is_empty from bms1
-- where is_empty='Y' 
-- and ((prev1='Y' and prev2= 'Y') or (next1='Y' and next2= 'Y') or (prev1='Y' and next1= 'Y'));

