create table table1(val varchar);
create table table2(val varchar);

INSERT INTO table1 values ('a'),('b'),(null) ;
INSERT INTO table2 values ('c'),('d'),(null) ;

select * from table1 left join table2
on table1.val=table2.val; --3

select * from table1 join table2
on table1.val=table2.val; --0

select * from table1 right join table2
on table1.val=table2.val; --3

select * from table1 full outer join table2
on table1.val=table2.val; --0
