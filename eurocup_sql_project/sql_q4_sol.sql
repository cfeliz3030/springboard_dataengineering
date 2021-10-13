SELECT play_schedule , count(in_out) as subs
FROM player_in_out pio
group by 1