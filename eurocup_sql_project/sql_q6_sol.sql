select count(*) as single_pt_matches
from (SELECT match_no , max(winner) - max(loser) as score_diff
from (SELECT  match_no, case when win_lose = 'W' then goal_score else null end as winner,
case when win_lose = 'L' then goal_score else null end as loser
from match_details md
where penalty_score is null) as a
group by match_no ) as b
where score_diff = 1
