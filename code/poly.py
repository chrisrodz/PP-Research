# This file was *autogenerated* from the file poly.sage.
from sage.all_cmdline import *   # import sage library
_sage_const_2 = Integer(2); _sage_const_397 = Integer(397); _sage_const_0 = Integer(0); _sage_const_18 = Integer(18); _sage_const_1 = Integer(1)
count = _sage_const_0  # cuente los PP

l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados

p = _sage_const_397  # Tamano del  cuerpo

k = GF(p) # Crea el CF

R = PolynomialRing(GF(p),_sage_const_1 ,"x", names=('x',)); (x,) = R._first_ngens(1)# Crea el anillo de polinomios utilizando

for a in range(_sage_const_1 , p): # Fija a
        for b in range(_sage_const_1 , p): # Fija b
                R = PolynomialRing(GF(p),_sage_const_1 ,"x", names=('x',)); (x,) = R._first_ngens(1)
                f = (x**(((p-_sage_const_1 )/_sage_const_2 )+_sage_const_1 )) + (a * x**(((p-_sage_const_1 )/_sage_const_18 )+_sage_const_1 )) + (b * x) # El polinomio
                for x in range(_sage_const_0 , p): # Evalua el poly
                        value = f(x)
                        if((value in l) == False): # Verifica que no se repitan los resultados
                                l.add(value) # si no se repite inserta el resultado en la lista
                                if(x == (p-_sage_const_1 )): # verifica si x llego al final de for
                                        count = count + _sage_const_1  # aumenta en 1 cuando encuentra un PP
                                        l = set()
                                        print str(a) + ", " +  str(b) # imprime la a y b que producieron el PP
                        else: # si se repiten res
                                l = set() # limpia la lista
                                break # rompe el ciclo
print count
