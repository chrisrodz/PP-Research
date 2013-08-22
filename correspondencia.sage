def corresp (p, a, b):
	f = GF(p)
	alpha = f.primitive_element
	print "for p = " + str(p) + " and (a, b) = (" + str(a) + ", " + str(b) + "): "
	for k in range(1, 6):
	    for i in range(1, int((p-1)/6)):
	    	res = (alpha^((6*k)+i)) * (((-1)^i) + a*((alpha^(i * int((p-1)/6)))) + b)%p
	        print ("k: " + str(k) + ", i: " + str(i) + " = " + str(res))
	print "for p = " + str(p) + " and (a, b) = (" + str(a) + ", " + str(b) + "): "
	for k in range(1, 6):
		for i in range(1, int((p-1)/6)):
			res = (alpha^((6*k)+i)) * (((-1)^i) + a*((alpha^(i * int((p-1)/6)))) + (-b))%p
			print ("k: " + str(k) + ", i: " + str(i) + " = " + str(res))

