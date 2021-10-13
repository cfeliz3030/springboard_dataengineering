SELECT referee_name, mm.venue_id, count(match_no) as total_matches
from referee_mast as rm
join match_mast as mm
on rm.referee_id = mm.referee_id
group by referee_name, mm.venue_id
order by referee_name;