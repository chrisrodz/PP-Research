def calcula(p):
    if not(is_prime(p) and p%10==1):
        return
    d1 = ((p-1)/2)+1
    d2 = ((p-1)/10)+1
    count = 0
        
    for a in range(1,p):
        for b in range(1,p):
            l = []
            for x in range(0,p):
                   value = ( (x^d1) + (a*x^d2) + (b*x) ) % p
                   if l.count(value) == 0:
                           l.append(value)
            if len(l)==p:
              count = count+1
              print str(p)+", "+str(count)


calcula(101)