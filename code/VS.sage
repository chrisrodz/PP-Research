count = 0 # cuente los PP 

l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados

p = 37 # Tamano del  cuerpo

d_1 = 2

d_2 = 3

a = 4

b = 3

k = GF(p) # Crea el CF 

R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando
"""
for a in range(1, p): # Fija a
        for b in range(1, p): # Fija b
                R.<x> = PolynomialRing(GF(p),1,"x")
                f = (x^(((p-1)/d_1)+1)) + (a * x^(((p-1)/d_2)+1)) + (b * x) # El polinomio
                for x in range(1, p): # Evalua el poly
                        value = f(x)
                        l.add(value) # si no se repite inserta el resultado en la lista
                        count = count + 1 # aumenta en 1 cuando encuentra un PP
                print "a: " + str(a) + ", b: " +  str(b) + " VS: " + str(len(l)) # imprime la a y b que producieron el PP
                l = set()
                count = 0
"""

R.<x> = PolynomialRing(GF(p),1,"x")
f = (x^(((p-1)/d_1)+1)) + (a * x^(((p-1)/d_2)+1)) + (b * x) # El polinomio
for x in range(1, p): # Evalua el poly
        value = f(x)
        l.add(value) # si no se repite inserta el resultado en la lista
        count = count + 1 # aumenta en 1 cuando encuentra un PP
print "a: " + str(a) + ", b: " +  str(b) + " VS: " + str(len(l)) # imprime la a y b que producieron el PP
print l
l = set()
count = 0