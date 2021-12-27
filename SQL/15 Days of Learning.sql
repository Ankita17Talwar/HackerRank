sELECT t1.submission_date, t1.h_cnt, h.hacker_id, h.name
from (
    sELECT submission_date,COUNT(DIStinct hacker_id) as h_cnt
   from  (
        Select s1.submission_date, s1.hacker_id,          
            count(distinct(s2.submission_date)) cnt 
            from submissions s1 
            join submissions s2 
                on s2.hacker_id = s1.hacker_id
                and s2.submission_date <= s1.submission_date
            group by s1.submission_date, s1.hacker_id 
          )
    where submission_date- to_date('2016-03-01','yyyy-MM-dd') +1 = cnt
    group by submission_date
    ) t1
    join 
    (  Select submission_date, hacker_id from
        (Select submission_date, hacker_id, 
         row_number() over (partition by submission_date order by cnt desc, hacker_id asc) rn from 
           ( Select s1.submission_date, s1.hacker_id,                      
                    count(*) cnt 
                from submissions s1 
                group by s1.submission_date, s1.hacker_id))
        where rn=1
    ) t2 
    on t1.submission_date = t2.submission_date
    join hackers h 
    on t2.hacker_id = h.hacker_id
order by t1.submission_date ;
