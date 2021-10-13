select DISTINCT player_name
from goal_details as gd
left join player_mast as pm
on gd.player_id = pm.player_id 
where posi_to_play in (select position_id
						from playing_position
						where position_desc = 'Defenders');
						
