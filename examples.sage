# Compute examples of case 6k = case 6l+1

k = GF(31)
A = k.primitive_element()

for m in range(1,6):
	for a in k:
		for b in k:
			check = A^(6*m)
			if k(1+b+a) != 0:
				if A*k((1+a*A^(5)+b)/k(1+a+b))==check:
					print m,a,b