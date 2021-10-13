SELECT DISTINCT sv.venue_name
from penalty_shootout as ps
left join
match_mast as mm
on ps.match_no = mm.match_no 
join soccer_venue as sv
on sv.venue_id = mm.venue_id;

