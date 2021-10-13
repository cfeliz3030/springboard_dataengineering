SELECT player_name
from player_in_out as pio
left join player_mast as pm
on pio.player_id = pm.player_id
where in_out = 'I'
and play_half = 1
and play_schedule = 'NT';