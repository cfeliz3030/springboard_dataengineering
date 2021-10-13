with cte as (SELECT match_no, sum(penalty_score) as total_goals, rank() over(order by sum(penalty_score) desc) as ranks
FROM match_details md
GROUP BY 1)

select cte.match_no, team_id
from cte
join match_details as md 
on cte.match_no = md.match_no
where ranks = 1

