def g(x):
    y = list(x)
    c= False
    while not c:
        c = True
    for i in range(len(y) - 1):
        if y[i+1] < y[i]:
            tmp = y[i]
            y[i] = y[i+1]
            y[i+1] = tmp
            c = False
    return y

print(g([2,4,5,6,4]))