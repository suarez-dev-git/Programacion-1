# Tarea: Blackjack (jugador contra la banca)
# Materia: Programación I
# Nombre: Camargo Bermudez Angel Gustavo y Suarez Garcia Luis

# Descripción:
# Es un juego de Blackjack con ventana gráfica hecho con Pygame
# El jugador juega contra el dealer (la banca).
# El jugador puede pedir carta o plantarse y después juega el dealer
#
# Se uso pygame

# Aquí importa los módulos a usar
import random   # sirve para mezclar la baraja
import pygame   # sirve para hacer la ventana y dibujar el juego

# --------------------------------------------------
# DATOS DEL JUEGO
# --------------------------------------------------

# Estas son tuplas porque los palos y las denominaciones nunca cambian
# Los palos son corazones, diamantes, tréboles y picas
PALOS = ('♥', '♦', '♣', '♠')

# Las 13 denominaciones de la baraja inglesa
DENOMINACIONES = ('A', '2', '3', '4', '5', '6', '7',
                  '8', '9', '10', 'J', 'Q', 'K')

# Este es un diccionario: la clave es la denominación de la carta
# y el valor son los puntos que vale.
# El As vale 11 aquí, pero después lo cambio a 1 si me paso de 21
# J, Q y K valen 10
PUNTOS_CARTAS = {
    'A': 11,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'J': 10,
    'Q': 10,
    'K': 10
}

# Listas donde guarda las cartas
baraja = []         # cartas que todavía no se han repartido
mano_jugador = []   # cartas del jugador
mano_dealer = []    # cartas del dealer

# Este diccionario guarda dos cosas:
#   'terminado': True si la partida ya acabó, False si sigue
#   'mensaje': el texto que se muestra en pantalla
estado = {'terminado': False, 'mensaje': ''}

# --------------------------------------------------
# FUNCIONES DEL BLACKJACK
# --------------------------------------------------

# Esta función crea la baraja de 52 cartas.
# No recibe nada y regresa una lista con las 52 cartas ya mezcladas
def crear_baraja():
    cartas = []

    # Por cada palo (4) y por cada denominación (13) se hace una carta
    # 4 x 13 = 52 cartas
    for palo in PALOS:
        for denominacion in DENOMINACIONES:
            # Cada carta es una tupla: (denominación, palo)
            carta = (denominacion, palo)
            cartas.append(carta)

    # Se mezclan las cartas en orden aleatorio
    random.shuffle(cartas)
    return cartas


# Recibe una carta (tupla) y regresa cuántos puntos vale
def puntos_carta(carta):
    # carta[0] es la denominación, por ejemplo 'K'
    denominacion = carta[0]

    # Busca esa denominación en el diccionario
    return PUNTOS_CARTAS[denominacion]


# Recibe una mano (lista de cartas) y regresa el total de puntos
# Aquí se resuelve el problema del As (vale 11 o 1).
def calcular_puntos(mano):
    total = 0
    ases = 0   # aquí cuenta cuántos Ases hay en la mano

    # Se suman los puntos de todas las cartas de la mano
    for carta in mano:
        total = total + puntos_carta(carta)

        # Si la carta es un As, se cuenta
        if carta[0] == 'A':
            ases = ases + 1

    # Si pasa de 21 y tiene algún As, cambia de 11 a 1
    # Cambiar un As de 11 a 1 es restar 10 al total.
    # Ejemplo: A, A, 9 -> 11 + 11 + 9 = 31 (se pasa)
    #          resto 10 -> 21 (no se pasa)
    # Esto se repite mientras siga pasado de 21 y queden Ases
    while total > 21 and ases > 0:
        total = total - 10
        ases = ases - 1

    return total


# Recibe una mano y regresa True si es blackjack natural, False si no.
# Blackjack natural = las 2 primeras cartas son un As y una carta de 10
def es_blackjack_natural(mano):
    # Si la mano no tiene exactamente 2 cartas, no puede ser natural
    if len(mano) != 2:
        return False

    primera = mano[0][0]   # denominación de la primera carta
    segunda = mano[1][0]   # denominación de la segunda carta

    # Caso 1: la primera es As y la segunda vale 10
    if primera == 'A' and puntos_carta(mano[1]) == 10:
        return True

    # Caso 2: la segunda es As y la primera vale 10
    if segunda == 'A' and puntos_carta(mano[0]) == 10:
        return True

    # Si no pasó ninguno de los dos casos, no es natural
    return False


# Recibe un texto, marca que la partida terminó y guarda el mensaje
def terminar_partida(texto):
    estado['terminado'] = True
    estado['mensaje'] = texto


# Aquí juega el dealer. Se llama cuando el jugador ya terminó su turno
# Regla: el dealer está obligado a pedir cartas mientras tenga menos de 17
def turno_dealer():
    # Pide carta mientras tenga menos de 17 puntos
    # (también reviso que aún queden cartas en la baraja)
    while calcular_puntos(mano_dealer) < 17 and len(baraja) > 0:
        # pop() saca la última carta de la baraja y append() se la da al dealer
        mano_dealer.append(baraja.pop())

    # Cuando el dealer termina, calculo los puntos de los dos
    puntos_jugador = calcular_puntos(mano_jugador)
    puntos_dealer = calcular_puntos(mano_dealer)

    # Revisa quién ganó
    if puntos_dealer > 21:
        # El dealer se pasó, entonces gana el jugador
        terminar_partida('La banca se pasó de 21. ¡Ganaste!')
    elif puntos_jugador > puntos_dealer:
        terminar_partida('¡Ganaste! Tienes más puntos que la banca.')
    elif puntos_jugador < puntos_dealer:
        terminar_partida('La banca gana. Tiene más puntos.')
    else:
        # Si no fue ninguno de los casos anteriores, tienen los mismos puntos
        terminar_partida('Empate. Ambos tienen los mismos puntos.')


# Se usa cuando el jugador presiona el botón "Pedir carta"
def pedir_carta():
    # Si la partida ya terminó, no hace nada
    if estado['terminado']:
        return

    # Saca una carta de la baraja y se la da al jugador
    if len(baraja) > 0:
        carta = baraja.pop()
        mano_jugador.append(carta)

    # Calcula cuántos puntos tiene ahora el jugador
    puntos = calcular_puntos(mano_jugador)

    if puntos > 21:
        # Se pasó de 21, pierde
        terminar_partida('Te pasaste de 21. Gana la banca.')
    elif puntos == 21:
        # Con 21 ya no tiene caso pedir más, así que juega el dealer
        turno_dealer()
    else:
        # Si tiene menos de 21, puede seguir jugando
        estado['mensaje'] = 'Pide otra carta o elige Plantarse.'


# Se usa cuando el jugador presiona el botón "Plantarse"
# Si se planta, termina su turno y le toca al dealer
def plantarse():
    if not estado['terminado']:
        turno_dealer()


# Prepara una partida nueva. Se llama al abrir el juego
# y cada vez que se presiona "Nueva partida"
def iniciar_juego():
    # Hace una baraja nueva y mezclada.
    # clear() vacía la lista que ya existía y extend() le agrega las 52 cartas
    baraja.clear()
    baraja.extend(crear_baraja())

    # Reparte 2 cartas al jugador (primero vacío su mano anterior)
    mano_jugador.clear()
    mano_jugador.append(baraja.pop())
    mano_jugador.append(baraja.pop())

    # Reparte 2 cartas al dealer
    mano_dealer.clear()
    mano_dealer.append(baraja.pop())
    mano_dealer.append(baraja.pop())

    # La partida empieza sin terminar y con este mensaje
    estado['terminado'] = False
    estado['mensaje'] = 'Tu turno: pide una carta o plántate.'

    # Revisa si alguien tiene blackjack natural desde el inicio
    jugador_blackjack = es_blackjack_natural(mano_jugador)
    dealer_blackjack = es_blackjack_natural(mano_dealer)

    # Los dos tienen natural: empate
    # Solo el jugador: gana. Solo el dealer: gana la banca
    # Si ninguno tiene natural, la partida sigue normal
    if jugador_blackjack and dealer_blackjack:
        terminar_partida('Empate: ambos tienen blackjack natural.')
    elif jugador_blackjack:
        terminar_partida('¡Blackjack natural! Ganaste inmediatamente.')
    elif dealer_blackjack:
        terminar_partida('La banca tiene blackjack natural. Gana el dealer.')


# --------------------------------------------------
# PARTE GRÁFICA CON PYGAME
# --------------------------------------------------

# Inicio Pygame (siempre se pone antes de usarlo)
pygame.init()

# Tamaño de la ventana en píxeles
ANCHO = 900
ALTO = 700

# Creo la ventana y le pongo título
pantalla = pygame.display.set_mode((ANCHO, ALTO))
pygame.display.set_caption('Blackjack - Jugador contra banca')

# El reloj sirve para controlar la velocidad del juego
reloj = pygame.time.Clock()

# Colores. Cada color es una tupla de 3 números (rojo, verde, azul)
# y cada número va de 0 a 255.
VERDE = (12, 100, 59)
VERDE_OSCURO = (6, 65, 40)
BLANCO = (255, 255, 255)
NEGRO = (25, 25, 25)
ROJO = (190, 35, 45)
DORADO = (235, 195, 85)
AZUL = (35, 65, 145)
GRIS = (190, 190, 190)

# Tipos de letra a usar (nombre de la letra y tamaño)
fuente_titulo = pygame.font.SysFont('Arial', 42, bold=True)
fuente = pygame.font.SysFont('Arial', 24)
fuente_pequena = pygame.font.SysFont('Arial', 18)
fuente_palo = pygame.font.SysFont('segoeuisymbol', 27)  # para ♥ ♦ ♣ ♠

# Rectángulos de los botones.
# Se escriben así: (posición x, posición y, ancho, alto)
boton_pedir = pygame.Rect(245, 610, 170, 55)
boton_plantarse = pygame.Rect(435, 610, 170, 55)
boton_nueva = pygame.Rect(625, 610, 170, 55)


# Escribe un texto en la pantalla en la posición (x, y)
# Si no le dice color ni letra, usa blanco y la fuente normal
def dibujar_texto(texto, x, y, color=BLANCO, tipo=fuente):
    # render convierte el texto en una imagen
    imagen = tipo.render(str(texto), True, color)

    # blit pega esa imagen en la pantalla
    pantalla.blit(imagen, (x, y))


# Dibuja una carta en la posición (x, y).
# Si oculta es True, dibuja el reverso azul con un "?"
def dibujar_carta(carta, x, y, oculta=False):
    ancho_carta = 68
    alto_carta = 96

    # Rectángulo blanco (el fondo de la carta)
    pygame.draw.rect(pantalla, BLANCO,
                     (x, y, ancho_carta, alto_carta), border_radius=7)

    # Borde negro (el 2 es el grosor de la línea)
    pygame.draw.rect(pantalla, NEGRO,
                     (x, y, ancho_carta, alto_carta), 2, border_radius=7)

    if oculta:
        # Carta boca abajo: rectángulo azul y un signo de interrogación
        pygame.draw.rect(pantalla, AZUL,
                         (x + 5, y + 5, ancho_carta - 10, alto_carta - 10),
                         border_radius=5)
        dibujar_texto('?', x + 25, y + 27, BLANCO, fuente_titulo)
    else:
        # Carta boca arriba: separa la denominación y el palo de la tupla
        denominacion = carta[0]
        palo = carta[1]

        # Corazones y diamantes van en rojo, los demás en negro
        if palo == '♥' or palo == '♦':
            color = ROJO
        else:
            color = NEGRO

        # Escribe la denominación arriba y el palo en medio de la carta
        dibujar_texto(denominacion, x + 7, y + 7, color, fuente_pequena)
        dibujar_texto(palo, x + 24, y + 36, color, fuente_palo)


# Dibuja todas las cartas de una mano, una al lado de la otra
# y es qué tan abajo se dibuja la fila.
# Si ocultar_segunda es True, la segunda carta se dibuja boca abajo
def dibujar_mano(mano, y, ocultar_segunda=False):
    # Separación normal entre una carta y otra
    separacion = 82

    # Si hay muchas cartas, las acerco para que quepan en la ventana
    if len(mano) > 1:
        espacio_disponible = ANCHO - 160 - 68
        separacion = espacio_disponible / (len(mano) - 1)

        # Pero nunca más separadas de 82
        if separacion > 82:
            separacion = 82

    # Recorre la mano con un for y dibujo cada carta
    for i in range(len(mano)):
        # La posición x depende del número de carta (i)
        x = 80 + int(i * separacion)

        # La carta está oculta solo si ocultar_segunda es True
        # y es la segunda carta (posición 1)
        oculta = ocultar_segunda and i == 1

        dibujar_carta(mano[i], x, y, oculta)


# Dibuja un botón con su texto en el centro
# Si habilitado es False, lo dibuja en gris
def dibujar_boton(rectangulo, texto, habilitado=True):
    if habilitado:
        color = DORADO
        color_texto = NEGRO
    else:
        color = GRIS
        color_texto = NEGRO

    # Dibuja el rectángulo del botón
    pygame.draw.rect(pantalla, color, rectangulo, border_radius=9)

    # Convierte el texto en imagen
    imagen = fuente.render(texto, True, color_texto)

    # Calcula la posición para que el texto quede centrado en el botón
    x = rectangulo.x + (rectangulo.width - imagen.get_width()) // 2
    y = rectangulo.y + (rectangulo.height - imagen.get_height()) // 2
    pantalla.blit(imagen, (x, y))


# Dibuja toda la pantalla del juego
# Se llama una vez en cada vuelta del ciclo principal
def dibujar_juego():
    # Pinta todo el fondo de verde oscuro
    pantalla.fill(VERDE_OSCURO)

    # Dibuja la mesa verde con un borde dorado
    pygame.draw.rect(pantalla, VERDE, (25, 20, 850, 650), border_radius=30)
    pygame.draw.rect(pantalla, DORADO, (25, 20, 850, 650), 4,
                     border_radius=30)

    # Título centrado arriba
    titulo = fuente_titulo.render('BLACKJACK', True, DORADO)
    pantalla.blit(titulo, (ANCHO // 2 - titulo.get_width() // 2, 35))

    # Cartas del dealer.
    # Mientras la partida no termina, su segunda carta está oculta
    dibujar_texto('DEALER / BANCA', 70, 115, BLANCO, fuente)
    ocultar = not estado['terminado']
    dibujar_mano(mano_dealer, 150, ocultar)

    # Los puntos del dealer solo se muestran cuando termina la partida
    if estado['terminado']:
        dibujar_texto('Puntos: ' + str(calcular_puntos(mano_dealer)),
                      700, 175, BLANCO, fuente)

    # Cartas y puntos del jugador (siempre se ven)
    dibujar_texto('JUGADOR', 70, 350, BLANCO, fuente)
    dibujar_mano(mano_jugador, 390)
    dibujar_texto('Puntos: ' + str(calcular_puntos(mano_jugador)),
                  700, 420, BLANCO, fuente)

    # Mensaje de la partida, centrado
    imagen_mensaje = fuente.render(estado['mensaje'], True, DORADO)
    pantalla.blit(imagen_mensaje,
                  (ANCHO // 2 - imagen_mensaje.get_width() // 2, 525))

    # Botones. "Pedir carta" y "Plantarse" salen en gris cuando la partida
    # termina. "Nueva partida" siempre está activo.
    dibujar_boton(boton_pedir, 'Pedir carta', not estado['terminado'])
    dibujar_boton(boton_plantarse, 'Plantarse', not estado['terminado'])
    dibujar_boton(boton_nueva, 'Nueva partida')

    # flip muestra en la ventana todo lo que se dibujó
    pygame.display.flip()


# --------------------------------------------------
# PROGRAMA PRINCIPAL
# --------------------------------------------------

# Empiezo la primera partida
iniciar_juego()

# Mientras ejecutando sea True, el juego sigue abierto
ejecutando = True

while ejecutando:
    # Revisa todo lo que hizo el usuario (clics, cerrar ventana, etc.)
    for evento in pygame.event.get():

        # Si se cierra la ventana, el ciclo while se detiene
        if evento.type == pygame.QUIT:
            ejecutando = False

        # Si se hizo clic con el botón izquierdo del ratón (button == 1)
        elif evento.type == pygame.MOUSEBUTTONDOWN and evento.button == 1:
            # Guardo dónde se hizo el clic
            posicion = evento.pos

            # collidepoint dice si el clic cayó dentro del rectángulo
            if boton_nueva.collidepoint(posicion):
                iniciar_juego()

            # Los otros dos botones solo funcionan si la partida sigue
            elif not estado['terminado']:
                if boton_pedir.collidepoint(posicion):
                    pedir_carta()
                elif boton_plantarse.collidepoint(posicion):
                    plantarse()

    # Dibuja la pantalla en cada vuelta del ciclo
    dibujar_juego()

    # Limita el juego a 60 vueltas por segundo
    reloj.tick(60)

# Cuando termina el ciclo, cierra Pygame
pygame.quit()