def findabprimo(p,d):

        count = 0 # cuente los PP       

        l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados     


        k = GF(p) # Crea el Cuerpo Finito F_p  

        R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando el cuerpo finito

        for a in range(1, p): # Fija a
                for b in range(1, p): # Fija b
                        R.<x> = PolynomialRing(GF(p),1,"x")
                        f = (x^(((p-1)/2)+1)) + (a * x^(((p-1)/d)+1)) + (b * x) # El polinomio
                        for x in range(0, p): # Evalua el poly
                                value = f(x)
                                if((value in l) == False): # Verifica que no se repitan los resultados
                                        l.add(value) # si no se repite inserta el resultado en la lista
                                        if(x == (p-1)): # verifica si x llego al final de for
                                                count = count + 1 # aumenta en 1 cuando encuentra un PP
                                                l = set()
                                                print str(a) + ", " +  str(b) # imprime la a y b que producieron el PP
                                else: # si se repiten res
                                        l = set() # limpia la lista
                                        break # rompe el ciclo
        print count

def findxm(p,d,m):

        count = 0 # cuente los PP       

        l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados     


        k = GF(p) # Crea el Cuerpo Finito F_p  

        R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando el cuerpo finito

        for a in range(1, p): # Fija a
                for b in range(1, p): # Fija b
                        R.<x> = PolynomialRing(GF(p),1,"x")
                        f = x * (x^((p+1)/2) + a * x^((p+2)/3) + b) # El polinomio
                        for x in range(0, p): # Evalua el poly
                                value = f(x)
                                if((value in l) == False): # Verifica que no se repitan los resultados
                                        l.add(value) # si no se repite inserta el resultado en la lista
                                        if(x == (p-1)): # verifica si x llego al final de for
                                                count = count + 1 # aumenta en 1 cuando encuentra un PP
                                                l = set()
                                                print str(a) + ", " +  str(b) # imprime la a y b que producieron el PP
                                else: # si se repiten res
                                        l = set() # limpia la lista
                                        break # rompe el ciclo
        print count