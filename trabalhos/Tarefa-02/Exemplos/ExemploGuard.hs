menor_de_tres :: (Int, Int, Int)->Int
menor_de_tres (x,y,z)
	| x < y && x < z = x
	| y < z			 = y
	| otherwise		 = z
	
menor_de_tres2 :: (Int, Int, Int)->Int
menor_de_tres2 (x,y,z) = if (x<y && x<z) then x
						 else if (y<z) then y else z