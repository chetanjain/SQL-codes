/*
create table date_range
(date_start date,
 date_end date);

insert into date_range values
('2025-01-01', '2025-07-01')
*/

DECLARE @start_date date = (select date_start from date_range )
DECLARE @end_date date = (select date_end from date_range )
print(@start_date)
print(@end_date)

while (@end_date>=@start_date)
BEGIN
  print(@start_date)
  SET @start_date = DATEADD(month, 1, @start_date)
END
