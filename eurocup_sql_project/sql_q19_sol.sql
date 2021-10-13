select count(DISTINCT player_id ) as total_gk_cap
from match_captain as mc
left join player_mast as pm 
on mc.player_captain = pm.player_id
where posi_to_play = 'GK'
