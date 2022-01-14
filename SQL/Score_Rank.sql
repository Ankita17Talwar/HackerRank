Select * 
from (Select event_id, 
 listagg(participant_name,',') within group (order by participant_name) over (partition by event_id , rn) nm, rn
from (Select event_id, participant_name, 
score, dense_rank() over(partition by event_id order by score desc) rn
from (Select event_id, participant_name, score from (
Select event_id, participant_name, 
score, row_number() over (partition by event_id ,participant_name order by score desc) r
from scoretable )
where r =1)) where rn <=3
)
PIVOT(min(nm) for rn in 
    (1,2,3) 
)
order by event_id;
