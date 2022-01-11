# Input
aaadaa
aa

#Output 
(0, 1)
(1, 2)
(4, 5)


# Enter your code here. Read input from STDIN. Print output to STDOUT
import re

string = input()
pattern = input()

p = r'(?=(' + pattern +'))'

ms = re.finditer(p,string)

flag=0
for match in ms:
    flag =1
    print((match.start(1),match.end(1)-1))
    
if flag==0:
    print((-1,-1))
