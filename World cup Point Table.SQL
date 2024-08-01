create table icc_world_cup ( Team_1 Varchar(20), Team_2 Varchar(20), Winner Varchar(20) ); 
INSERT INTO icc_world_cup values('India','SL','India'); 
INSERT INTO icc_world_cup values('SL','Aus','Aus'); 
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ'); 
INSERT INTO icc_world_cup values('Aus','India','India')
----normal code
select team,match_played,coalesce(total_win,0) total_win, match_played-coalesce(total_win,0) total_loses from 
(select team,coalesce(sum(match_pa),0) match_played from (
select team_1 as team,count(*) match_pa from icc_world_cup group by team_1
union ALL
select team_2 as team,count(*) match_pa from icc_world_cup group by team_2
) all_teams group by team ) A
left join 
(select winner, count(winner) total_win from icc_world_cup group by winner) win
on A.team = win.winner

----enhanced code
select * from icc_world_cup

select team,sum(match_pa) match_played, sum(winner) as total_win, sum(match_pa)- sum(winner) total_loss from (
select team_1 as team,count(*) match_pa,
sum(case when Team_1=Winner then 1 else 0 end) as winner # here we are taking sum directly instead of select command from above.
from icc_world_cup group by team_1
union ALL
select team_2 as team,count(*) match_pa,
sum(case when Team_2=Winner then 1 else 0 end) as winner # here we are taking sum directly instead of select command from above.
 from icc_world_cup group by team_2
 ) all_teams group by team
