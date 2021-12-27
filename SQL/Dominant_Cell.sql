#!/bin/python3

import math
import os
import random
import re
import sys

def numCells(grid):
    # Write your code here
    res =0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            value = grid[i][j]
            f=1
            for ii in range(max(0,i-1),min(len(grid),i+2)):
                for jj in range(max(0,j-1),min(len(grid[0]),j+2)): 
                    if (ii,jj) != (i,j) and value <=grid[ii][jj]:
                        f=0
                        break
                if f==0:
                    break
            else:
                res += 1
    return res
    

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    grid_rows = int(input().strip())
    grid_columns = int(input().strip())

    grid = []

    for _ in range(grid_rows):
        grid.append(list(map(int, input().rstrip().split())))

    result = numCells(grid)

    fptr.write(str(result) + '\n')

    fptr.close()
