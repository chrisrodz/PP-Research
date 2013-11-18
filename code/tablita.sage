load('/Users/Makobi/PP-Research/code/poly.sage')
import matplotlib
import matplotlib.pyplot as plt

p=13
d=6

test = findab(p,d)
#print test

A = GF(p)
alpha = A.primitive_element()
R.<x> = PolynomialRing(A)

raices = {}

for i in range(1,p):
    raices[alpha^i] = i
#print raices

r'$\alpha > \beta$'


print '\n'

print "[a, b] | [i, j] | (i + j) | (i - j) "
print "------------------------------------"
for pair in test:
    print str(pair) + " |     " + str(raices[pair[0]]) + "    " + str(raices[pair[1]]) + "  " + str(raices[pair[0]]+raices[pair[1]]) + "  " + str(raices[pair[0]]-raices[pair[1]])

