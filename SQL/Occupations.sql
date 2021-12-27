Select doctor, Professor, Singer,actor from 
(
Select name, Occupation, row_number() over (Partition by Occupation order by name ) as rn
    from OCCUPATIONS 
)
Pivot 
(
    MAX(name) 
    for Occupation in ('Doctor' as doctor, 'Professor' as Professor,
                       'Singer' as singer, 'Actor' as Actor)
) order by rn;
