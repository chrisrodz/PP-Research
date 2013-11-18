# This file was *autogenerated* from the file tablita.sage.
from sage.all_cmdline import *   # import sage library
_sage_const_13 = Integer(13); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0); _sage_const_6 = Integer(6)
load('/Users/Makobi/PP-Research/code/poly.sage')
import matplotlib
import matplotlib.pyplot as plt

p=_sage_const_13 
d=_sage_const_6 

test = findab(p,d)
#print test

A = GF(p)
alpha = A.primitive_element()
R = PolynomialRing(A, names=('x',)); (x,) = R._first_ngens(1)

raices = {}

for i in range(_sage_const_1 ,p):
    raices[alpha**i] = i
#print raices

r'$\alpha > \beta$'


print '\n'

print "[a, b] | [i, j] | (i + j) | (i - j) "
print "------------------------------------"
for pair in test:
    print str(pair) + " |     " + str(raices[pair[_sage_const_0 ]]) + "    " + str(raices[pair[_sage_const_1 ]]) + "  " + str(raices[pair[_sage_const_0 ]]+raices[pair[_sage_const_1 ]]) + "  " + str(raices[pair[_sage_const_0 ]]-raices[pair[_sage_const_1 ]])

