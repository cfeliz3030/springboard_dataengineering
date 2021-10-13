with cte as (SELECT match_no, count(match_no) as total_f_cards, rank() over(order by count(match_no) desc) as ranks
from player_booked as pb
group by match_no )

SELECT total_f_cards
from cte
WHERE ranks = 1;
