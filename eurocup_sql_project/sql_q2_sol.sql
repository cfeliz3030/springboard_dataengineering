select count(match_no) as matches_won_by_p
from match_mast
where decided_by = 'P'