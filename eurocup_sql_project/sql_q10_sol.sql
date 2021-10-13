select *
from player_mast as pm
join soccer_country as sc
on pm.team_id = sc.country_id 
where playing_club = 'Liverpool'
and sc.country_name = 'England';