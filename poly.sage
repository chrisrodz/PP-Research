
p = 139 # Tamano del  cuerpo

k = GF(p) # Crea el CF

R.<x> = PolynomialRing(GF(p),1,"x")

for a in range(1, p): # Fija a
        for b in range(1, p): # Fija b
                R.<x> = PolynomialRing(GF(p),1,"x")
                f = (x^(((p-1)/2)+1)) + (a * x^(((p-1)/6)+1)) + (b * x) # El polinomio
                for x in range(0, p): # Evalua el poly
                        value = f(x)
                        if(l.count(value) == 0): # Verifica que no se repitan los resultados
                                l.append(value) # si no se repite inserta el resultado en la lista
                                if(x == (p-1)): # verifica si x llego al final de for
                                        count = count + 1 # aumenta en 1 cuando encuentra un PP
                                        l = []
                                        print str(a) + ", " +  str(b) # imprime la a y b que producieron el PP
                        else: # si se repiten res
                                l = [] # limpia la lista
                                break # rompe el ciclo
print count
