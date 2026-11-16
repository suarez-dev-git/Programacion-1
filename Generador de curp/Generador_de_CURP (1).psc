//Nombre del archivo: Generador_de_CURP.psc
//Descripcion: Algoritmo en PSeInt generador de la CURP (Clave Única de Registro de Población) en sus primeros 16 caracteres.
//Autor: Angel Gustavo Camargo Bermudez y Luis Suarez Garcia.
//Grupo: 10
//Fecha:11-10-25
//**************** Caracteres 1-16 *******************
//Primera_Consonante_Apellido_Paterno y Primer_Vocal_Apellido_Paterno y Primer_Consonante_Interna_Apellido_Paterno
Funcion Caracter_1y2_14 <- Primera_Consonante_Y_Vocal_Y_Primer_Consonante_Interna_Apellido_Paterno(Apellido_Paterno)
    Definir Caracter_1y2_14,Caracter_1,Caracter_2,Caracter_14 Como Caracter
	Definir i,j,k Como Entero
    Si (Subcadena(Apellido_Paterno,1,6) = "DE LAS" O Subcadena(Apellido_Paterno,1,6) = "DE LOS") Y Subcadena(Apellido_Paterno,7,7) = " " Entonces
        Caracter_1 <- Subcadena(Apellido_Paterno,8,8)
		i <- 9
		j <- 0
		k <- 0
		Mientras k=0 y i <= Longitud(Apellido_Paterno) Hacer	
			Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
				i <- i + 1
			sino
				k <- 1
				Caracter_14 <- Subcadena(Apellido_Paterno,i,i)	
			FinSi	
		FinMientras
		i <-9
		Mientras j=0 y i <= Longitud(Apellido_Paterno) Hacer	
			Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
				j <- 1
				Caracter_2 <- Subcadena(Apellido_Paterno,i,i)	
			FinSi	
			i <- i + 1	
		FinMientras
		Caracter_1y2_14 <- Concatenar(Concatenar(Caracter_1, Caracter_2), Caracter_14)
    SiNo
        Si Subcadena(Apellido_Paterno,1,5) = "DE LA" Y Subcadena(Apellido_Paterno,6,6) = " " Entonces
            Caracter_1 <- Subcadena(Apellido_Paterno,7,7)
			i <- 8
			j <- 0
			k <- 0
			Mientras k=0 y i <= Longitud(Apellido_Paterno) Hacer	
				Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
					i <- i + 1
				sino
					k <- 1
					Caracter_14 <- Subcadena(Apellido_Paterno,i,i)	
				FinSi	
			FinMientras
			i <- 8
			Mientras j=0 y i <= Longitud(Apellido_Paterno) Hacer	
				Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
					j <- 1
					Caracter_2 <- Subcadena(Apellido_Paterno,i,i)	
				FinSi	
				i <- i + 1	
			FinMientras
			Caracter_1y2_14 <- Concatenar(Concatenar(Caracter_1, Caracter_2), Caracter_14)
        SiNo
            Si (Subcadena(Apellido_Paterno,1,3) = "DAS" O Subcadena(Apellido_Paterno,1,3) = "DEL" O Subcadena(Apellido_Paterno,1,3) = "DER" O Subcadena(Apellido_Paterno,1,3) = "DIE" O Subcadena(Apellido_Paterno,1,3) = "LES" O Subcadena(Apellido_Paterno,1,3) = "LOS" O Subcadena(Apellido_Paterno,1,3) = "LAS" O Subcadena(Apellido_Paterno,1,3) = "MAC" O Subcadena(Apellido_Paterno,1,3) = "VAN" O Subcadena(Apellido_Paterno,1,3) = "VON") Y Subcadena(Apellido_Paterno,4,4) = " " Entonces
                Caracter_1 <- Subcadena(Apellido_Paterno,5,5)
				i <- 6
				j <- 0
				k <- 0
				Mientras k=0 y i <= Longitud(Apellido_Paterno) Hacer	
					Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
						i <- i + 1
					sino
						k <- 1
						Caracter_14 <- Subcadena(Apellido_Paterno,i,i)	
					FinSi	
				FinMientras
				i <- 6
				Mientras j=0 y i <= Longitud(Apellido_Paterno) Hacer	
					Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
						j <- 1
						Caracter_2 <- Subcadena(Apellido_Paterno,i,i)	
					FinSi	
					i <- i + 1	
				FinMientras
				Caracter_1y2_14 <- Concatenar(Concatenar(Caracter_1, Caracter_2), Caracter_14)
            SiNo
                Si (Subcadena(Apellido_Paterno,1,2) = "DA" O Subcadena(Apellido_Paterno,1,2) = "DE" O Subcadena(Apellido_Paterno,1,2) = "DI" O Subcadena(Apellido_Paterno,1,2) = "EL" O Subcadena(Apellido_Paterno,1,2) = "LA" O Subcadena(Apellido_Paterno,1,2) = "LE" O Subcadena(Apellido_Paterno,1,2) = "MC") Y Subcadena(Apellido_Paterno,3,3) = " " Entonces
                    Caracter_1 <- Subcadena(Apellido_Paterno,4,4)
					i <- 5
					j <- 0
					k <- 0
					Mientras k=0 y i <= Longitud(Apellido_Paterno) Hacer	
						Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
							i <- i + 1
						sino
							k <- 1
							Caracter_14 <- Subcadena(Apellido_Paterno,i,i)	
						FinSi	
					FinMientras
					i <- 5
					Mientras j=0 y i <= Longitud(Apellido_Paterno) Hacer	
						Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
							j <- 1
							Caracter_2 <- Subcadena(Apellido_Paterno,i,i)	
						FinSi	
						i <- i + 1	
					FinMientras
					Caracter_1y2_14 <- Concatenar(Concatenar(Caracter_1, Caracter_2), Caracter_14)
                SiNo
                    Si Subcadena(Apellido_Paterno,1,2) = "Y " Entonces
                        Caracter_1 <- Subcadena(Apellido_Paterno,3,3)
						i <- 4
						j <- 0
						k <- 0
						Mientras k=0 y i <= Longitud(Apellido_Paterno) Hacer	
							Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
								i <- i + 1
							sino
								k <- 1
								Caracter_14 <- Subcadena(Apellido_Paterno,i,i)	
							FinSi	
						FinMientras
						i <-4
						Mientras j=0 y i <= Longitud(Apellido_Paterno) Hacer	
							Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
								j <- 1
								Caracter_2 <- Subcadena(Apellido_Paterno,i,i)	
							FinSi	
							i <- i + 1	
						FinMientras
						Caracter_1y2_14 <- Concatenar(Concatenar(Caracter_1, Caracter_2), Caracter_14)
                    SiNo
                        Caracter_1 <- Subcadena(Apellido_Paterno,1,1)
						i <- 2
						j <- 0
						k <- 0
						Mientras k=0 y i <= Longitud(Apellido_Paterno) Hacer	
							Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
								i <- i + 1
							sino
								k <- 1
								Caracter_14 <- Subcadena(Apellido_Paterno,i,i)	
							FinSi	
						FinMientras
						i <-2
						Mientras j=0 y i <= Longitud(Apellido_Paterno) Hacer	
							Si Subcadena(Apellido_Paterno,i,i) = "A" O Subcadena(Apellido_Paterno,i,i) = "E" O Subcadena(Apellido_Paterno,i,i) = "I" O Subcadena(Apellido_Paterno,i,i) = "O" O Subcadena(Apellido_Paterno,i,i) = "U" Entonces
								j <- 1
								Caracter_2 <- Subcadena(Apellido_Paterno,i,i)	
							FinSi	
							i <- i + 1	
						FinMientras
						Caracter_1y2_14 <- Concatenar(Concatenar(Caracter_1, Caracter_2), Caracter_14)
                    FinSi
                FinSi
            FinSi
        FinSi
    FinSi
FinFuncion
//Primera_Letra_Apellido_Materno y Primera_Consonante_Interna_Apellido_Materno
Funcion Caracter_3y15 <- Primera_Consonante_Apellido_Paterno_2(Apellido_Materno)
    Definir Caracter_3y15, Caracter_3, Caracter_15 Como Caracter
    Definir i, k Como Entero
    Si (Subcadena(Apellido_Materno,1,6) = "DE LAS" O Subcadena(Apellido_Materno,1,6) = "DE LOS") Y Subcadena(Apellido_Materno,7,7) = " " Entonces
        Caracter_3 <- Subcadena(Apellido_Materno,8,8)
        i <- 9
        k <- 0
        Mientras k = 0 Y i <= Longitud(Apellido_Materno) Hacer
            Si Subcadena(Apellido_Materno,i,i) <> "A" Y Subcadena(Apellido_Materno,i,i) <> "E" Y Subcadena(Apellido_Materno,i,i) <> "I" Y Subcadena(Apellido_Materno,i,i) <> "O" Y Subcadena(Apellido_Materno,i,i) <> "U" Entonces
                Caracter_15 <- Subcadena(Apellido_Materno,i,i)
                k <- 1
            FinSi
            i <- i + 1
        FinMientras
        Caracter_3y15 <- Concatenar(Caracter_3,Caracter_15)
    SiNo
        Si Subcadena(Apellido_Materno,1,5) = "DE LA" Y Subcadena(Apellido_Materno,6,6) = " " Entonces
            Caracter_3 <- Subcadena(Apellido_Materno,7,7)
            i <- 8
            k <- 0
            Mientras k = 0 Y i <= Longitud(Apellido_Materno) Hacer
                Si Subcadena(Apellido_Materno,i,i) <> "A" Y Subcadena(Apellido_Materno,i,i) <> "E" Y Subcadena(Apellido_Materno,i,i) <> "I" Y Subcadena(Apellido_Materno,i,i) <> "O" Y Subcadena(Apellido_Materno,i,i) <> "U" Entonces
                    Caracter_15 <- Subcadena(Apellido_Materno,i,i)
                    k <- 1
                FinSi
                i <- i + 1
            FinMientras
            Caracter_3y15 <- Concatenar(Caracter_3,Caracter_15)
        SiNo
            Si (Subcadena(Apellido_Materno,1,3) = "DAS" O Subcadena(Apellido_Materno,1,3) = "DEL" O Subcadena(Apellido_Materno,1,3) = "DER" O Subcadena(Apellido_Materno,1,3) = "DIE" O Subcadena(Apellido_Materno,1,3) = "LES" O Subcadena(Apellido_Materno,1,3) = "LOS" O Subcadena(Apellido_Materno,1,3) = "LAS" O Subcadena(Apellido_Materno,1,3) = "MAC" O Subcadena(Apellido_Materno,1,3) = "VAN" O Subcadena(Apellido_Materno,1,3) = "VON") Y Subcadena(Apellido_Materno,4,4) = " " Entonces
                Caracter_3 <- Subcadena(Apellido_Materno,5,5)
                i <- 6
                k <- 0
                Mientras k = 0 Y i <= Longitud(Apellido_Materno) Hacer
                    Si Subcadena(Apellido_Materno,i,i) <> "A" Y Subcadena(Apellido_Materno,i,i) <> "E" Y Subcadena(Apellido_Materno,i,i) <> "I" Y Subcadena(Apellido_Materno,i,i) <> "O" Y Subcadena(Apellido_Materno,i,i) <> "U" Entonces
                        Caracter_15 <- Subcadena(Apellido_Materno,i,i)
                        k <- 1
                    FinSi
                    i <- i + 1
                FinMientras
                Caracter_3y15 <- Concatenar(Caracter_3,Caracter_15)
            SiNo
                Si (Subcadena(Apellido_Materno,1,2) = "DA" O Subcadena(Apellido_Materno,1,2) = "DE" O Subcadena(Apellido_Materno,1,2) = "DI" O Subcadena(Apellido_Materno,1,2) = "EL" O Subcadena(Apellido_Materno,1,2) = "LA" O Subcadena(Apellido_Materno,1,2) = "LE" O Subcadena(Apellido_Materno,1,2) = "MC") Y Subcadena(Apellido_Materno,3,3) = " " Entonces
                    Caracter_3 <- Subcadena(Apellido_Materno,4,4)
                    i <- 5
                    k <- 0
                    Mientras k = 0 Y i <= Longitud(Apellido_Materno) Hacer
                        Si Subcadena(Apellido_Materno,i,i) <> "A" Y Subcadena(Apellido_Materno,i,i) <> "E" Y Subcadena(Apellido_Materno,i,i) <> "I" Y Subcadena(Apellido_Materno,i,i) <> "O" Y Subcadena(Apellido_Materno,i,i) <> "U" Entonces
                            Caracter_15 <- Subcadena(Apellido_Materno,i,i)
                            k <- 1
                        FinSi
                        i <- i + 1
                    FinMientras
                    Caracter_3y15 <- Concatenar(Caracter_3,Caracter_15)
                SiNo
                    Si Subcadena(Apellido_Materno,1,2) = "Y " Entonces
                        Caracter_3 <- Subcadena(Apellido_Materno,3,3)
                        i <- 4
                        k <- 0
                        Mientras k = 0 Y i <= Longitud(Apellido_Materno) Hacer
                            Si Subcadena(Apellido_Materno,i,i) <> "A" Y Subcadena(Apellido_Materno,i,i) <> "E" Y Subcadena(Apellido_Materno,i,i) <> "I" Y Subcadena(Apellido_Materno,i,i) <> "O" Y Subcadena(Apellido_Materno,i,i) <> "U" Entonces
                                Caracter_15 <- Subcadena(Apellido_Materno,i,i)
                                k <- 1
                            FinSi
                            i <- i + 1
                        FinMientras
                        Caracter_3y15 <- Concatenar(Caracter_3,Caracter_15)
                    SiNo
                        Caracter_3 <- Subcadena(Apellido_Materno,1,1)
                        i <- 2
                        k <- 0
                        Mientras k = 0 Y i <= Longitud(Apellido_Materno) Hacer
                            Si Subcadena(Apellido_Materno,i,i) <> "A" Y Subcadena(Apellido_Materno,i,i) <> "E" Y Subcadena(Apellido_Materno,i,i) <> "I" Y Subcadena(Apellido_Materno,i,i) <> "O" Y Subcadena(Apellido_Materno,i,i) <> "U" Entonces
                                Caracter_15 <- Subcadena(Apellido_Materno,i,i)
                                k <- 1
                            FinSi
                            i <- i + 1
                        FinMientras
                        Caracter_3y15 <- Concatenar(Caracter_3,Caracter_15)
                    FinSi
                FinSi
            FinSi
        FinSi
    FinSi
FinFuncion
//Ultimos_2_Digitos_Año
Funcion Caracter_5y6 <- Ultimos_2_Digitos_Anio(Anio)
	Definir Caracter_5y6 Como Cadena
	Caracter_5y6 <- Subcadena(Anio,3,4)
FinFuncion
//Primera_Consonante_Interna_Nombre
Funcion Caracter_16 <- Primera_Consonante_Interna_Nombre(Nombre_1)
	definir Caracter_16 Como Caracter
	Definir i,j Como Entero
	i <- 2
	j <- 0
	Mientras j=0 y i < Longitud(Nombre_1) Hacer	
		Si Subcadena(Nombre_1,i,i) = "A" O Subcadena(Nombre_1,i,i) = "E" O Subcadena(Nombre_1,i,i) = "I" O Subcadena(Nombre_1,i,i) = "O" O Subcadena(Nombre_1,i,i) = "U" Entonces
			i <- i + 1	
		sino
			j <- 1
			Caracter_16 <- Subcadena(Nombre_1,i,i)	
		FinSi	
	FinMientras
FinFuncion
//Primera_Letra_Nombre_1_o_2
Funcion Caracter_4 <- Primera_Letra_Nombre_1_o_2(Nombre_1, Nombre_2)
    Definir Caracter_4 Como Caracter
    Si Subcadena(Nombre_1, 1, 5) = "MARIA" o Subcadena(Nombre_1,1,2) = "DE" o Subcadena(Nombre_1,1,3) = "DAS" O Subcadena(Nombre_1,1,2) = "DA" O Subcadena(Nombre_1,1,3) = "DEL" O Subcadena(Nombre_1,1,3) = "DER" O Subcadena(Nombre_1,1,2) = "DI" O Subcadena(Nombre_1,1,3) = "DIE" O Subcadena(Nombre_1,1,2) = "DD" O Subcadena(Nombre_1,1,2) = "EL" O Subcadena(Nombre_1,1,2) = "LA" O Subcadena(Nombre_1,1,3) = "LOS" O Subcadena(Nombre_1,1,3) = "LAS" O Subcadena(Nombre_1,1,2) = "LE" O Subcadena(Nombre_1,1,3) = "LES" O Subcadena(Nombre_1,1,3) = "MAC" O Subcadena(Nombre_1,1,2) = "MC" O Subcadena(Nombre_1,1,1) = "Y" O Subcadena(Nombre_1,1,3) = "VAN" O Subcadena(Nombre_1,1,3) = "VON" O Subcadena(Nombre_1,1,5) = "DE LA"  Entonces
        Caracter_4 <- Subcadena(Nombre_2, 1, 1)
    SiNo
        Si Subcadena(Nombre_1, 1, 4) = "JOSE" o Subcadena(Nombre_1,1,2) = "DE" o Subcadena(Nombre_1,1,3) = "DAS" O Subcadena(Nombre_1,1,2) = "DA" O Subcadena(Nombre_1,1,3) = "DEL" O Subcadena(Nombre_1,1,3) = "DER" O Subcadena(Nombre_1,1,2) = "DI" O Subcadena(Nombre_1,1,3) = "DIE" O Subcadena(Nombre_1,1,2) = "DD" O Subcadena(Nombre_1,1,2) = "EL" O Subcadena(Nombre_1,1,2) = "LA" O Subcadena(Nombre_1,1,3) = "LOS" O Subcadena(Nombre_1,1,3) = "LAS" O Subcadena(Nombre_1,1,2) = "LE" O Subcadena(Nombre_1,1,3) = "LES" O Subcadena(Nombre_1,1,3) = "MAC" O Subcadena(Nombre_1,1,2) = "MC" O Subcadena(Nombre_1,1,1) = "Y" O Subcadena(Nombre_1,1,3) = "VAN" O Subcadena(Nombre_1,1,3) = "VON" O Subcadena(Nombre_1,1,5) = "DE LA" Entonces
            Caracter_4 <- Subcadena(Nombre_2, 1, 1)
        SiNo
            Caracter_4 <- Subcadena(Nombre_1, 1, 1)
        FinSi
    FinSi
    Si Caracter_4 = "Ü" Entonces
        Caracter_4 <- "U"
    FinSi
FinFuncion
//**************** PROCESO PRINCIPAL ****************
Proceso Generador_de_CURP
	//Variables proceso principal
	Definir Nombre_1,Nombre_2,Apellido_Paterno,Apellido_Materno,Anio,Mes,cero_dia,Dia,Sexo,Entidad_Federativa Como Caracter
	Definir i,j,k Como Entero
	//Variables para caracteres
	Definir C1y2y14,C3y15,C4,C5y6,C15,C16 Como Caracter
	Escribir "Algoritmo generador de la CURP"
	//Captura de nombres
	Escribir "____________NOMBRE(S):_____________"
	Escribir Sin Saltar "Introduce tu primer nombre: "
	leer Nombre_1
	Escribir Sin Saltar "Introduce tu segundo nombre: "
	leer Nombre_2
	Nombre_1 <- Mayusculas(Nombre_1)
	C4 <- Primera_Letra_Nombre_1_o_2(Nombre_1,Nombre_2)
	Si C4 = "Ñ" Entonces
		C4 <- "X"
	FinSi
	//Captura de apellidos
	Escribir "___________APELLIDO(S)_____________"
	//Captura de apellido paterno
	Escribir Sin Saltar "Introduce tu apellido paterno:"
	leer Apellido_Paterno
	Apellido_Paterno <- Mayusculas(Apellido_Paterno)
	C1y2y14 <- Primera_Consonante_Y_Vocal_Y_Primer_Consonante_Interna_Apellido_Paterno(Apellido_Paterno)
	//Captura de apellido materno
	Escribir Sin Saltar "Introduce tu apellido materno:"
	leer Apellido_Materno
	Apellido_Materno <- Mayusculas(Apellido_Materno)
	C3y15 <- Primera_Consonante_Apellido_Paterno_2(Apellido_Materno)
	//Capturador de fecha de nacimiento
	Escribir "________FECHA DE NACIMIENTO________"
	Escribir Sin Saltar "Introduce tu año de nacimiento: "
	leer Anio
	C5y6 <- Ultimos_2_Digitos_Anio(Anio)
	//Capturar mes de nacimiento
	Escribir "Selecciona tu mes de nacimiento (1/12): "
	Escribir "(1) -> Enero"
	Escribir "(2) -> Febrero"
	Escribir "(3) -> Marzo"
	Escribir "(4) -> Abril"
	Escribir "(5) -> Mayo"
	Escribir "(6) -> Junio"
	Escribir "(7) -> Julio"
	Escribir "(8) -> Agosto"
	Escribir "(9) -> Septiembre"
	Escribir "(10) -> Octubre"
	Escribir "(11) -> Noviembre"
	Escribir "(12) -> Diciembre"
	Escribir Sin Saltar "Digita según tu mes (1-12):"
	leer i
	si i > 12 o i < 0 Entonces
		Escribir Sin Saltar "Error...Digita según tu mes (1-12):"
		leer i
	FinSi
	Segun i Hacer
		1: Mes <- "01"
		2: Mes <- "02"
		3: Mes <- "03"
		4: Mes <- "04"
		5: Mes <- "05"
		6: Mes <- "06"
		7: Mes <- "07"
		8: Mes <- "08"
		9: Mes <- "09"
		10: Mes <- "10"
		11: Mes <- "11"
		12: Mes <- "12"
	FinSegun
	//Captura el día del mes de nacimiento
	Escribir Sin Saltar "Introduce tu día del mes de nacimiento: "
	leer Dia
	cero_dia <- "0"
	si dia = "1" o dia = "2" o dia = "3" o dia = "4" o dia = "5" o dia = "6" o dia = "7" o dia = "8" o dia = "9" Entonces	
		dia <- Concatenar(cero_dia,dia)
	FinSi
	//Captura de sexo
	Escribir "______________SEXO________________"
	Escribir "Selecciona tu Sexo: "
	Escribir "(1) -> Hombre"
	Escribir "(2) -> Mujer"
	Escribir Sin Saltar "Digita según tu sexo(1-2):"
	leer j
	si j = 1 Entonces
		Sexo <- "H"
	sino 
		si j = 2 Entonces
			Sexo <- "M"
		FinSi
	FinSi
	//Capturador de entidad federativa
	Escribir "________ENTIDAD FEDERATIVA________"
	Escribir "(0) <- Nacido en el extranjero"
	Escribir "(1) <- AGUASCALIENTES"
	Escribir "(2) <- BAJA CALIFORNIA"
	Escribir "(3) <- BAJA CALIFORNIA SUR"
	Escribir "(4) <- CAMPECHE"
	Escribir "(5) <- COAHUILA"
	Escribir "(6) <- COLIMA"
	Escribir "(7) <- CHIAPAS"
	Escribir "(8) <- CHIHUAHUA"
	Escribir "(9) <- DISTRITO FEDERAL"
	Escribir "(10) <- DURANGO"
	Escribir "(11) <- GUANAJUATO"
	Escribir "(12) <- GUERRERO"
	Escribir "(13) <- HIDALGO"
	Escribir "(14) <- JALISCO"
	Escribir "(15) <- MEXICO"
	Escribir "(16) <- MICHOACAN"
	Escribir "(17) <- MORELOS"
	Escribir "(18) <- NAYARIT"
	Escribir "(19) <- NUEVO LEON"
	Escribir "(20) <- OAXACA"
	Escribir "(21) <- PUEBLA"
	Escribir "(22) <- QUERETARO"
	Escribir "(23) <- QUINTANA ROO"
	Escribir "(24) <- SAN LUIS POTOSI"
	Escribir "(25) <- SINALOA"
	Escribir "(26) <- SONORA"
	Escribir "(27) <- TABASCO"
	Escribir "(28) <- TAMAULIPAS"
	Escribir "(29) <- TLAXCALA"
	Escribir "(30) <- VERACRUZ"
	Escribir "(31) <- YUCATAN"
	Escribir "(32) <- ZACATECAS"
	Escribir Sin Saltar "Ingresa tu E.F. correspondiente (0-32):"
	Leer k
	si k > 32 o k < 0 Entonces
		Escribir Sin Saltar "Error...Ingresa tu E.F. correspondiente (0-32):"
		Leer k
	FinSi
	Segun k Hacer
		0: Entidad_Federativa <- "NE"
			Escribir "Nacido en el extranjero"
		1: Entidad_Federativa <- "AS"
			Escribir "AGUASCALIENTES"
		2: Entidad_Federativa <- "BC"
			Escribir "BAJA CALIFORNIA"
		3: Entidad_Federativa <- "BS"
			Escribir "BAJA CALIFORNIA SUR"
		4: Entidad_Federativa <- "CC"
			Escribir "CAMPECHE"
		5: Entidad_Federativa <- "CL"
			Escribir "COAHUILA"
		6: Entidad_Federativa <- "CM"
			Escribir "COLIMA"
		7: Entidad_Federativa <- "CS"
			Escribir "CHIAPAS"
		8: Entidad_Federativa <- "CH"
			Escribir "CHIHUAHUA"
		9: Entidad_Federativa <- "DF"
			Escribir "DISTRITO FEDERAL"
		10: Entidad_Federativa <- "DG"
			Escribir "DURANGO"
		11: Entidad_Federativa <- "GT"
			Escribir "GUANAJUATO"
		12: Entidad_Federativa <- "GR"
			Escribir "GUERRERO"
		13: Entidad_Federativa <- "HG"
			Escribir "HIDALGO"
		14: Entidad_Federativa <- "JC"
			Escribir "JALISCO"
		15: Entidad_Federativa <- "MC"
			Escribir "MEXICO"
		16: Entidad_Federativa <- "MN"
			Escribir "MICHOACAN"
		17: Entidad_Federativa <- "MS"
			Escribir "MORELOS"
		18: Entidad_Federativa <- "NT"
			Escribir "NAYARIT"
		19: Entidad_Federativa <- "NL"
			Escribir "NUEVO LEON"
		20: Entidad_Federativa <- "OC"
			Escribir "OAXACA"
		21: Entidad_Federativa <- "PL"
			Escribir "PUEBLA"
		22: Entidad_Federativa <- "QT"
			Escribir "QUERETARO"
		23: Entidad_Federativa <- "QR"
			Escribir "QUINTANA ROO"
		24: Entidad_Federativa <- "SP"
			Escribir "SAN LUIS POTOSI"
		25: Entidad_Federativa <- "SL"
			Escribir "SINALOA"
		26: Entidad_Federativa <- "SR"
			Escribir "SONORA"
		27: Entidad_Federativa <- "TC"
			Escribir "TABASCO"
		28: Entidad_Federativa <- "TS"
			Escribir "TAMAULIPAS"
		29: Entidad_Federativa <- "TL"
			Escribir "TLAXCALA"
		30: Entidad_Federativa <- "VZ"
			Escribir "VERACRUZ"
		31: Entidad_Federativa <- "YN"
			Escribir "YUCATAN"
		32: Entidad_Federativa <- "ZS"
			Escribir "ZACATECAS"
	FinSegun
	//Recalculador de nombre y apellidos para caracter 14-16	
	C16 <- Primera_Consonante_Interna_Nombre(Nombre_1)
	Escribir "Tu CURP (Clave Única de Registro de Población) en sus primeros 16 caracteres: "
    Escribir subcadena(C1y2y14,1,2),subcadena(C3y15,1,1),C4,C5y6,Mes,Dia,Sexo,Entidad_Federativa,subcadena(C1y2y14,3,3),subcadena(C3y15,2,2),C16
FinProceso