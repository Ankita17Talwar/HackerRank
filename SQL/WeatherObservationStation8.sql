Select distinct city
from station 
where regexp_like(city,'[a,e,i,o,u]$','i') and regexp_like(city,'^[a,e,i,o,u]','i');
