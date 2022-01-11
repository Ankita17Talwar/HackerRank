
# Sample Input
# 5
# 2 3 6 6 5

#Output
# 5

if __name__ == '__main__':
    n = int(input())
    arr = map(int, input().split())
    lst = list(arr)
    set1 = sorted(set(lst))
    print(set1[-2])
