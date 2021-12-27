with num_t as (
    Select level+1 num from dual connect by level <=999
)
Select listagg(num,'&') within group (order by num asc)
from 
(
    Select num,
    case 
    when not exists ( Select 1 from num_t t2 where t1.num > t2.num and remainder(t1.num, t2.num)=0 )
    then 'p'
    else 'np'
    end p_flg
    from num_t t1
) where p_flg ='p';
