"""
Nombre del archivo: tarea_4_python.psc
Descripción: Programa que dibuja cierta figura que selecciones con cierta longitud y con el signo que designes.
Autor: Angel Gustavo Camargo Bermudez y Luis Suarez Garcia.
Fecha: 11-04-26
"""
# fue dificil

#################################### Función que dibuja los objetos ####################################
def imprimir_fila(ancho: int, espacios: int, simbolo: str, rellena: bool, borde: bool) -> None:
    """
    Imprime una línea individual de la figura con los espacios y símbolos correspondientes.

    Parameters:
        ancho (int): Cantidad de símbolos que tendrá la línea.
        espacios (int): Cantidad de espacios de margen izquierdo.
        simbolo (str): Carácter a utilizar para dibujar la figura.
        rellena (bool): True si la figura es rellena, False si es hueca.
        borde (bool): True si la línea debe forzarse como borde.

    Returns:
        None
    """
    linea = " " * espacios
    if rellena or ancho == 1 or borde:
        linea = linea + simbolo * ancho
    else:
        linea = linea + simbolo + " " * (ancho - 2) + simbolo
    print(linea)
    
########################### Función que calcula como dibujar el Reloj de arena ###############################
def reloj_arena(n: int, simbolo: str, rellena: bool) -> None:
    """
    Imprime la figura de un reloj de arena de tamaño n.

    Parameters:
        n (int): Tamaño de la figura (debe ser impar).
        simbolo (str): Carácter para dibujar.
        rellena (bool): True si es rellena, False si es hueca.
    """
    medio = n // 2
    i = 0
    while i < n:
        if i <= medio:
            espacios = i
        else:
            espacios = n - 1 - i
        ancho = n - 2 * espacios
        if i == 0 or i == n - 1:
            borde = True
        else:
            borde = False
        imprimir_fila(ancho, espacios, simbolo, rellena, borde)
        i += 1
        
########################### Función que calcula como dibujar el Rombo ###############################
def rombo(n: int, simbolo: str, rellena: bool) -> None:
    """
    Imprime la figura de un rombo de tamaño n.

    Parameters:
        n (int): Tamaño de la figura (debe ser impar).
        simbolo (str): Carácter para dibujar.
        rellena (bool): True si es rellena, False si es hueca.
    """
    medio = n // 2
    i = 0
    while i < n:
        if i <= medio:
            espacios = medio - i
        else:
            espacios = i - medio
        ancho = n - 2 * espacios
        imprimir_fila(ancho, espacios, simbolo, rellena, False)
        i += 1

########################### Función que calcula como dibujar el Moño ###############################
def mono(n: int, simbolo: str, rellena: bool) -> None:
    """
    Imprime la figura de un moño de tamaño n.

    Parameters:
        n (int): Tamaño de la figura (debe ser impar).
        simbolo (str): Carácter para dibujar.
        rellena (bool): True si es rellena, False si es hueca.
    """
    medio = n // 2
    
    # Parte de arriba
    i = 1
    while i <= medio:
        if rellena:
            lado = simbolo * i
        else:
            if i == 1:
                lado = simbolo
            else:
                lado = simbolo + " " * (i - 2) + simbolo
        espacios = n - 2 * i
        print(lado + " " * espacios + lado)
        i += 1
        
    # Fila central
    print(simbolo * n)
    
    # Parte de abajo
    i = medio
    while i >= 1:
        if rellena:
            lado = simbolo * i
        else:
            if i == 1:
                lado = simbolo
            else:
                lado = simbolo + " " * (i - 2) + simbolo
        espacios = n - 2 * i
        print(lado + " " * espacios + lado)
        i -= 1

########################### Función que calcula como dibujar la Copa  ###############################
def copa(n: int, simbolo: str, rellena: bool) -> None:
    """
    Imprime la figura de una copa de tamaño n.

    Parameters:
        n (int): Tamaño de la figura (debe ser impar).
        simbolo (str): Carácter para dibujar.
        rellena (bool): True si es rellena, False si es hueca.
    """
    medio = n // 2
    
    # Parte de arriba
    i = 0
    while i <= medio:
        espacios = i
        ancho = n - 2 * i
        if i == 0:
            borde = True
        else:
            borde = False
        imprimir_fila(ancho, espacios, simbolo, rellena, borde)
        i += 1
        
    # Cuerpo de la copa
    i = 0
    while i < 2:
        imprimir_fila(1, medio, simbolo, rellena, False)
        i += 1
        
    # Base de la copa (ancho completo n)
    imprimir_fila(n, 0, simbolo, rellena, True)
    
########################### Proceso Principal ###############################
if __name__ == "__main__":
    while True:
        print("===== FIGURAS =====")
        print("1. Reloj de arena")
        print("2. Rombo")
        print("3. Moño")
        print("4. Copa")
        print("5. Imprimir TODAS las figuras")
        print("6. Salir")
        print("=================")
        opcion = input("Selecciona una opción: ")
        if opcion == "6":
            print("Programa finalizado.")
            break
        if opcion in ["1", "2", "3", "4", "5"]:
            simbolo = input("Introduce el símbolo que deseas utilizar: ")
            if len(simbolo) != 1:
                print("Error: debes introducir solamente un símbolo.")
                continue
            try:
                n = int(input("Introduce el tamaño (impar, mínimo 5 y máximo 15): "))
            except ValueError:
                print("Error: El tamaño debe ser un número entero.")
                continue
            if n < 5 or n > 15 or n % 2 == 0:
                print("Error: el tamaño debe ser impar y estar entre 5 y 15.")
                continue
            modalidad = input("¿Deseas las figuras rellenas o huecas? (r/h): ").strip().lower()
            if modalidad == "r":
                rellena = True
            elif modalidad == "h":
                rellena = False
            else:
                print("Error: Opción de modalidad incorrecta.")
                continue
            print("===== RESULTADO =====")
            if opcion == "1":
                reloj_arena(n, simbolo, rellena)
            elif opcion == "2":
                rombo(n, simbolo, rellena)
            elif opcion == "3":
                mono(n, simbolo, rellena)
            elif opcion == "4":
                copa(n, simbolo, rellena)
            elif opcion == "5":
                print("--- Reloj de Arena ---")
                reloj_arena(n, simbolo, rellena)
                print("\n--- Rombo ---")
                rombo(n, simbolo, rellena)
                print("\n--- Moño ---")
                mono(n, simbolo, rellena)
                print("\n--- Copa ---")
                copa(n, simbolo, rellena)
        else:
            print("Error: Opción no válida. Intenta nuevamente.")