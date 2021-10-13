SELECT referee_name , count(mm.referee_id) as total_bookings
from referee_mast as rm
join match_mast as mm
on rm.referee_id = mm.referee_id
join player_booked as pb
on mm.match_no = pb.match_no
group by referee_name 
order by 2 desc;