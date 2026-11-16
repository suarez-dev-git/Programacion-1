//Nombre del archivo: IMC_Calculator.psc
//Descripcion:Captura tu peso y altura y te dice tu indice de masa corporal y te indica tu categoria utilizada por la OMS.
//Autor: Angel Gustavo Camargo Bermudez y Luis Suarez Garcia.
//Fecha:26-08-26
Proceso IMC_Calculator
	
	definir peso,altura,imc Como Real
	definir edad Como Entero
	
	Escribir "Calculador de categoria de IMC segun la OMS"
	Escribir ""
	
	Escribir "Escribe tu peso en kilogramos: "
	leer peso
	
	escribir "Escribe tu altura en metros: "
	leer altura
	
	Escribir "Escribe tu edad: "
	leer edad
	
	si peso<=0 o altura<=0 Entonces
		Escribir "Error: el valor dado de estatura y/o peso no deben ser cero"
	sino 
		imc <- peso/altura^2
		si edad < 20 Entonces
			escribir "Error: la persona debe tener almenos 20 años"
		sino 
			si imc < 16.5 Entonces
				escribir "Su indice de masas corporal es: ", imc
				escribir "Categoria: Bajo peso severo: IMC por debajo de 16.5"
			sino 
				si imc >= 16.5 y imc < 18.5 Entonces
					escribir "Su indice de masas corporal es: ", imc
					escribir "Categoria: Bajo peso: IMC desde 16.5 y por debajo de 18.5"
				sino 
					si imc >= 18.5 y imc < 25 Entonces
						escribir "Su indice de masas corporal es: ", imc
						escribir "Categoria: Peso saludable: IMC desde 18.5 y por debajo de 25.0"
					sino 
						si imc >= 25 y imc < 30 Entonces
							escribir "Su indice de masas corporal es: ", imc
							escribir "Categoria: Sobrepeso: IMC desde 25.0 y por debajo de 30.0"
						sino 
							si imc >= 30 y imc < 35 Entonces
								escribir "Su indice de masas corporal es: ", imc
								escribir "Categoria: Obesidad tipo I (moderada): IMC desde 30.0 y por debajo de 35.0"
							sino
								si imc >= 35 y imc < 40 Entonces
									escribir "Su indice de masas corporal es: ", imc
									escribir "Categoria: Obesidad tipo  II (severa): IMC desde 35.0 y por debajo de 40.0"
								SiNo
									si imc >= 40 Entonces
										escribir "Su indice de masas corporal es: ", imc
										escribir "Categoria: Obesidad tipo III (mórbida): IMC de 40.0 o mas"
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
FinProceso