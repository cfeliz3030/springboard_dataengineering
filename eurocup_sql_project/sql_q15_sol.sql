SELECT referee_name , count(DISTINCT pb.player_id) as total_players_booked
from referee_mast as rm
join match_mast as mm
on rm.referee_id = mm.referee_id
join player_booked as pb
on mm.match_no = pb.match_no
group by referee_name 
order by 2 desc;