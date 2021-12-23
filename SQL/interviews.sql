Select contest_id, hacker_id,name, ts, tas,tv,tuv from
(Select con.contest_id, con.hacker_id, con.name, sum(total_submissions) ts,sum(total_accepted_submissions) tas, sum(total_views) tv,
sum(total_unique_views) tuv, sum(total_submissions)+ sum(total_accepted_submissions)+ sum(total_views)+ sum(total_unique_views) tot_sum 
from Contests con left JOIN Colleges col on con.contest_id = col.contest_id
left join Challenges ch on col.college_id = ch.college_id 
left join (SELECT CHALLENGE_ID, SUM(TOTAL_VIEWS) AS TOTAL_VIEWS, SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS 
            FROM VIEW_STATS GROUP BY CHALLENGE_ID) vs on vs.challenge_id = ch.challenge_id
left join (SELECT CHALLENGE_ID, SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS,  SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS 
        FROM SUBMISSION_STATS GROUP BY CHALLENGE_ID)ss on ss.challenge_id = ch.challenge_id  
 group by con.contest_id, con.hacker_id,con.name )
where tot_sum !=0 order by contest_id;
