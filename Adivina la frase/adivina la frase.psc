// Luis Suarez Garcia
// 12/10/2026
// Define una frase y la imprime enmascarada, si aciertas al caracter ese caracter se destapa y cada vez vas descubriendo la frase.
Algoritmo Adivina_la_Frase
	Definir frase, mascara, mascaraAnterior, entrada, letra Como Caracter
	Definir fallidos Como Entero
	
	frase <- Mayusculas("EL QUE BUSCA ENCUENTRA")
	mascara <- enmascarar(frase)
	fallidos <- 0
	
	Escribir "Frase: ", mascara
	
	Mientras mascara <> frase Hacer
		Escribir "Escribe un caracter:"
		Leer entrada
		Mientras Longitud(entrada) <> 1 Hacer
			Escribir "Debe ser un solo caracter, va de nuevo chavalon:"
			Leer entrada
		FinMientras
		
		letra <- Mayusculas(entrada)
		mascaraAnterior <- mascara
		mascara <- destapar(frase, mascara, letra)
		
		Si mascara = mascaraAnterior Entonces
			fallidos <- fallidos + 1
		FinSi
		Escribir mascara
	FinMientras
	
	Escribir "Frase completa. Intentos fallidos: ", fallidos
FinAlgoritmo

// Recibe la frase y devuelve la misma frase con * en lugar de letras
Funcion resultado <- enmascarar(frase)
	Definir resultado Como Caracter
	Definir i Como Entero
	
	resultado <- ""
	Para i <- 1 Hasta Longitud(frase) Con Paso 1 Hacer
		Si SubCadena(frase, i, i) = " " Entonces
			resultado <- resultado + " "
		SiNo
			resultado <- resultado + "*"
		FinSi
	FinPara
FinFuncion

// Recibe frase, mascara actual y una letra; devuelve la mascara ya actual
Funcion nueva <- destapar(frase, mascara, letra)
	Definir nueva Como Caracter
	Definir i Como Entero
	Definir existe, cambio Como Logico
	
	nueva <- ""
	existe <- Falso
	cambio <- Falso
	
	Para i <- 1 Hasta Longitud(frase) Con Paso 1 Hacer
		Si SubCadena(frase, i, i) = letra Entonces
			existe <- Verdadero
			Si SubCadena(mascara, i, i) = "*" Entonces
				cambio <- Verdadero
			FinSi
			nueva <- nueva + letra
		SiNo
			nueva <- nueva + SubCadena(mascara, i, i)
		FinSi
	FinPara
	
	Si existe = Falso Entonces
		Escribir "Intento fallido: el caracter no se encuentra en la frase."
	SiNo
		Si cambio = Falso Entonces
			Escribir "El caracter ya habia sido destapado."
		FinSi
	FinSi
FinFuncion