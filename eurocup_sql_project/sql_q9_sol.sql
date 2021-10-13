with cte as (select *
from player_mast as pm
join soccer_country as sc
on pm.team_id = sc.country_id 
where country_name = 'Germany'
and posi_to_play = 'GK')

SELECT distinct player_name,jersey_no
from cte 
left join match_details as md 
on cte.player_id = md.player_gk 
where md.play_stage = 'G'