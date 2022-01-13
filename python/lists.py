#
#Consider a list (list = []). You can perform the following commands:

#insert i e: Insert integer  at position .
#print: Print the list.
#remove e: Delete the first occurrence of integer .
#append e: Insert integer  at the end of the list.
#sort: Sort the list.
#pop: Pop the last element from the list.
#reverse: Reverse the list.

#Initialize your list and read in the value of  followed 
#by  lines of commands where each command will be of the  types listed above. Iterate through each command in order and perform the corresponding operation on your list.
#



if __name__ == '__main__':
    N = int(input())
    
    lst = []
    for i in range(N):
        cmnd = input().split()
        
        if cmnd[0] == 'insert':
            lst.insert(int(cmnd[1]), int(cmnd[2]))
        elif cmnd[0] == 'print':
            print(lst)
        elif cmnd[0] == 'remove':
            lst.remove(int(cmnd[1]))
        elif cmnd[0] == 'append':
            lst.append(int(cmnd[1]))
        elif cmnd[0] == 'sort':
            lst.sort()
        elif cmnd[0] == 'pop':
            lst.pop()
        elif cmnd[0] == 'reverse':
            lst.reverse()
            
        
