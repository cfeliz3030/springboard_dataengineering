select player_name, jersey_no, playing_club 
from player_mast as pm
join soccer_country as sc 
on pm.team_id = sc.country_id 
where posi_to_play = 'GK'
and sc.country_name = 'England';