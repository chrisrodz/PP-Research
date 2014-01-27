def findab(p,d_1,d_2):
        """ Dado p primo, d que divida p-1, imprime todos los pares (a,b) tal que el polinomio
         es un polinomio de permutacion y la cantidad de pares. Los devuelve tambien en forma de lista. """
        count = 0 # cuente los PP       

        l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados     


        k = GF(p) # Crea el Cuerpo Finito F_p  

        R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando el cuerpo finito

        pares = []

        for a in range(1, p): # Fija a
                for b in range(1, p): # Fija b
                        R.<x> = PolynomialRing(GF(p),1,"x")
                        f = (x^(((p-1)/d_1)+1)) + (a * x^(((p-1)/d_2)+1)) + (b * x) # El polinomio
                        for x in range(0, p): # Evalua el poly
                                value = f(x)
                                if((value in l) == False): # Verifica que no se repitan los resultados
                                        l.add(value) # si no se repite inserta el resultado en la lista
                                        if(x == (p-1)): # verifica si x llego al final de for
                                                count = count + 1 # aumenta en 1 cuando encuentra un PP
                                                l = set()
                                                #print str(a) + ", " +  str(b) # imprime la a y b que producieron el PP
                                                pares.append([a,b])
                                else: # si se repiten res
                                        l = set() # limpia la lista
                                        break # rompe el ciclo
        print d_1, d_2, len(pares)
        #return pares

def findab_general(p,d1,d2):
        """ Dado p primo, d1, d2 que dividan p-1, imprime todos los pares (a,b) tal que el polinomio general
         es un polinomio de permutacion y la cantidad de pares. Los devuelve tambien en forma de lista. """

        count = 0 # cuente los PP       

        l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados     


        k = GF(p) # Crea el Cuerpo Finito F_p  

        R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando el cuerpo finito

        pares = []

        for a in range(1, p): # Fija a
                for b in range(1, p): # Fija b
                        R.<x> = PolynomialRing(GF(p),1,"x")
                        f = (x^(((p-1)/d1)+1)) + (a * x^(((p-1)/d2)+1)) + (b * x) # El polinomio
                        for x in range(0, p): # Evalua el poly
                                value = f(x)
                                if((value in l) == False): # Verifica que no se repitan los resultados
                                        l.add(value) # si no se repite inserta el resultado en la lista
                                        if(x == (p-1)): # verifica si x llego al final de for
                                                count = count + 1 # aumenta en 1 cuando encuentra un PP
                                                l = set()
                                                print str(a) + ", " +  str(b) # imprime la a y b que producieron el PP
                                                pares.append([a,b])
                                else: # si se repiten res
                                        l = set() # limpia la lista
                                        break # rompe el ciclo
        print len(pares)
        return pares

def getaa(p, d1, d2):

    """Esta funcion devuelve un set con los pares a,a que cumplen con la primera condicion
    de la proposicion de ive. Es decir que Fa,a(alpha^i) != 0 para cualquier i"""

    l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados     

    k = GF(p) # Crea el Cuerpo Finito F_p  

    R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando el cuerpo finito

    alpha = primitive_root(p)

    for a in range(1, p): # Fija a

        R.<x> = PolynomialRing(GF(p),1,"x")

        f = (x^(((p-1)/d1))) + (a * x^(((p-1)/d2))) + a # El polinomio con a,a

        for i in range (0, p): # deja correr las i
            value = f(alpha^i) #calcula el valor del poly evaluado en la potencia de alpha
            if value == 0: # si el poly evaluado = 0 rompe y se mueve a otro par a,a
                break
            elif i == (p-1): # de lo contrario guarda la a
                l.add(a)
    return l


def findaa(p,d1,d2, m):
        """ Dado p primo, d1, d2 que dividan p-1, imprime todos los pares (a,b) tal que el polinomio general
         es un polinomio de permutacion y la cantidad de pares. Los devuelve tambien en forma de lista. """

        l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados     

        k = GF(p) # Crea el Cuerpo Finito F_p  

        R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando el cuerpo finito

        alpha = primitive_root(p)

        d = lcm(d1, d2)

        l = getaa(p, d1, d2) # busca las a que satisfacen la primera cond

        for a in l: # para cada a

            flag  = 0

            R.<x> = PolynomialRing(GF(p),1,"x")

            f = (x^(((p-1)/d1))) + (a * x^(((p-1)/d2))) + a # El polinomio

            for r1 in range (0, d): # deja correr los residuos para check la segunda cond

                for r2 in range (0, d):  # deja correr los residuos para check la segunda cond

                    value1 = m * r1 + log(f(alpha^r1)) # calcula primer valor

                    value2 = m * r2 + log(f(alpha^r2)) # calcula segundo valor

                    if value2%d == value1: #checa si son iguales
                        print a, value1, value2 
                        flag = 1
                        break #rompe si lo son

                if flag == 1:
                    break #rompe si lo son

            if flag == 0: #si no son iguales 
                print a #entoces el poly de a,a produce pp

def findaa_general(p,d1,d2):
        """ Dado p primo, d1, d2 que dividan p-1, imprime todos los pares (a,b) tal que el polinomio general
         es un polinomio de permutacion y la cantidad de pares. Los devuelve tambien en forma de lista. """

        count = 0 # cuente los PP       

        l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados     


        k = GF(p) # Crea el Cuerpo Finito F_p  

        R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando el cuerpo finito

        pares = []
        
        for a in range(1, p): # Fija a
                    R.<x> = PolynomialRing(GF(p),1,"x")
                    f = (x^(((p-1)/d1)+1)) + (a * x^(((p-1)/d2)+1)) + (a * x) # El polinomio
                    for x in range(0, p): # Evalua el poly
                            value = f(x)
                            if((value in l) == False): # Verifica que no se repitan los resultados
                                    l.add(value) # si no se repite inserta el resultado en la lista
                                    if(x == (p-1)): # verifica si x llego al final de for
                                            count = count + 1 # aumenta en 1 cuando encuentra un PP
                                            l = set()
                                            print str(a) + ", " +  str(a) # imprime la a y b que producieron el PP
                                            pares.append([a,a])
                            else: # si se repiten res
                                    l = set() # limpia la lista
                                    break # rompe el ciclo
        print len(pares)
        return pares

def get_valueset(p, f):
        """ Dado p primo y f un polinomio calcula el value set de f sobre F_p """
        vs = [] # Lista vacia para los valores del vs
        R.<x> = PolynomialRing(GF(p), 1, "x") # Cuerpo donde estamos trabajando
        for value in GF(p):
                vs.append(f(x=value))
        return vs

def trinomio_valueset(p, d1, d2, a, b):
        """ Dado p primo, d1, d2 que dividan p-1, i, j en F_p devuelve el value set del polinomio nuestro sobre F_p """
        vs = []
        R.<x> = PolynomialRing(GF(p),1,"x")
        f = (x^(((p-1)/d1)+1)) + (a * x^(((p-1)/d2)+1)) + (b * x)
        for value in range(0,p):
                vs.append(f(x=value))
        return vs

def cadena_sola(p,d1,d2,i,j):
        """ Dado p, d1, d2, i, j calcula los elementos de la clase de equivalencia (alpha^i,alpha^j) """
        cadena = []
        alpha = GF(p).primitive_element()
        newa = alpha^i
        newb = alpha^j        
        cadena.append((newa,newb))
        valor1 = (p-1)/(d1) # Primer valor para transformacion
        valor2 = (p-1)/(d2) # Segundo valor para transformacion
        flag = True
        while flag:
                newa = newa*(alpha^(valor1-valor2))
                newb = newb*(alpha^(valor1))
                if newa == alpha^i and newb == alpha^j:
                        flag = False
                else:
                        cadena.append((newa,newb))
        return cadena
                


def findxm(p,d,m):

        count = 0 # cuente los PP       

        l = set() # Guarda los PP evaluados para verificar que no se repitan los resultados     


        k = GF(p) # Crea el Cuerpo Finito F_p  

        R.<x> = PolynomialRing(GF(p),1,"x") # Crea el anillo de polinomios utilizando el cuerpo finito

        for a in range(1, p): # Fija a
                for b in range(1, p): # Fija b
                        R.<x> = PolynomialRing(GF(p),1,"x")
                        f = x^(m) * (x^((p-1)/2) + a * x^((p-1)/d) + b) # El polinomio
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

def toa_laj_cadenaj(p, d1, d2):
    procesado = []
    for i in range(0, p):
        for j in range(0, p):
            cadena = cadena_sola(p,d1,d2,i,j)
            print cadena
            procesado.append([i,j])

def tablita_e_ive (p):
    for d1 in range(1, p):
        for d2 in  range(1, p):
            if (p-1)%d1 == 0 and (p-1)%d2 == 0:
                findab(p, d1, d2)



