select country_name, count(ass_ref_id) as total_refs
from asst_referee_mast as arm
join soccer_country as sc
on arm.country_id = sc.country_id
group by 1
order by 2 desc
limit 1;