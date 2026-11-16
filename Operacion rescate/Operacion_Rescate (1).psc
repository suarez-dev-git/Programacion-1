//Nombre del archivo: Operacion_Rescate.psc.
//Descripcion: Dadas 3 calificaciones te calcula el promedio, te clasifica y te dice metas alcanzables de promedios de 60 o 90. 
//Autor: Angel Gustavo Camargo Bermudez y Luis Suarez Garcia.
//Fecha:18-09-26
Proceso Operacion_Rescate
	Definir numEstudiantes,e1,e2,e3,e4_90,e4_60,promedio_actual,suma,conter Como Real
	//Decripcion del algoritmo
	escribir "=============================================="
	Escribir "      Algoritmo funciones:"
	escribir "   1.Te dice un promedio actual."
	escribir "   2.Te predice una calificacion en un"
	escribir "     cuarto examen para sacar 90 de promedio."
	escribir "   3.Te predice una calificacion en un"
	escribir "     cuarto examen para sacar 60 de promedio."
	escribir "   4.Te indica metas alcanzables de promedio"
	escribir "     final de 60 o 90."
	escribir "=============================================="
	//Indicador de entrada de cantidad de estudiantes
	escribir Sin Saltar "Cantidad de estudiantes a promediar:"
	leer numEstudiantes
	//Filtro para numero estudiates
	si numEstudiantes<0 Entonces
		escribir "Error...Cantidad de estudiantes a promediar:"
		leer numEstudiantes
	FinSi
	//contador para numero de estudiante
	conter <- 0
	//ciclo para capturar 3 calificaciones para cada estudiante
	mientras numEstudiantes>conter Hacer
		conter <- conter +1
		//Lector de calificaciones 
		escribir "=============================================="
		escribir "Estudiante:",conter
		escribir "=============================================="
		escribir Sin Saltar "Calificacion 1:"
		leer e1
		si e1<0 o e1>100 Entonces
			escribir Sin Saltar "Error...Calificacion 1:"
			leer e1
		FinSi
		escribir "=============================================="
		escribir Sin Saltar "Calificacion 2:"
		leer e2
		si e2<0 o e2>100 Entonces
			escribir Sin Saltar "Error...Calificacion 2:"
			leer e2
		FinSi
		escribir "=============================================="
		escribir Sin Saltar "Calificacion 3:"
		leer e3
		si e3<0 o e3>100 Entonces
			escribir Sin Saltar "Error...Calificacion 3:"
			leer e3
		FinSi
		escribir "=============================================="
		//suma de los 3 examenes
		suma <- (e1+e2+e3)
		//Calculador de el promedio actual
		promedio_actual <- suma/3
	    //Calculadores para la meta de el examen 4
		e4_90 <- 360-suma
		e4_60 <- 240-suma
		//Impresor de promedio, meta de 90 y de 60 y si son alcanzables.
		escribir "Promedio actual: ",promedio_actual
		escribir "Calificacion necesaria para obtener promedio de 90: ",e4_90
		escribir "Calificacion necesaria para obtener promedio de 60: ",e4_60
		//Meta de promedio de 90 alcanzable?
		si e4_90 <=100 Entonces
			escribir "Meta de promedio mayor de 90: ALCANZABLE "
		sino 
			escribir "Meta de promedio mayor de 90: NO ALCANZABLE "
		FinSi
		//meta de promedio de 60 alcanzable?
		si e4_60 <=100 Entonces
			escribir "Meta de promedio mayor de 60: ALCANZABLE "
		sino 
			escribir "Meta de promedio mayor de 60: NO ALCANZABLE "
		FinSi
		//Clasificador como sobresaliente,regular, tiene esperanza y reprobado obligatorio.
		si e4_90 <=100 Entonces
			escribir "Estudiante: SOBRESALIENTE"
		sino 
			si promedio_actual > 60 Entonces
				escribir "Estudiante: REGULAR"
			sino 
				si e4_60 >=0 y e4_60<=100 Entonces
					escribir "Estudiante: Puede rescatar el semestre"
				sino
					escribir "Estudiante: REPROBADO INEVITABLE"
				FinSi
			FinSi
		FinSi
		
		
	FinMientras
	
FinProceso