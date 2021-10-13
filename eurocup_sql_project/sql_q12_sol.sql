select gd.team_id, posi_to_play ,count(*) as total_goals
from goal_details as gd
left join player_mast as pm
on gd.player_id = pm.player_id 
group by posi_to_play, gd.team_id
order by gd.team_id;