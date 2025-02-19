class ElementoMapa:
    def __init__(self):
        pass

class Habitacion(ElementoMapa):
    def __init__(self, num):
        super().__init__()
        self.num = num
        self.norte = None
        self.sur = None
        self.este = None
        self.oeste = None

class Pared(ElementoMapa):
    def __init__(self):
        super().__init__()

class Puerta(ElementoMapa):
    def __init__(self, lado1, lado2):
        super().__init__()
        self.abierta = False
        self.lado1 = lado1
        self.lado2 = lado2

    def abrir(self):
        self.abierta = True

    def cerrar(self):
        self.abierta = False

class Laberinto(ElementoMapa):
    def __init__(self):
        super().__init__()
        self.habitaciones = []

    def agregar_habitacion(self, habitacion):
        self.habitaciones.append(habitacion)

class Juego:
    def __init__(self):
        self.laberinto = Laberinto()

    def crear_laberinto(self):
        # Crear habitaciones
        hab1 = Habitacion(1)
        hab2 = Habitacion(2)
        hab3 = Habitacion(3)
        hab4 = Habitacion(4)

        # Configurar conexiones entre habitaciones
        puerta1 = Puerta(hab1, hab2)
        puerta2 = Puerta(hab2, hab3)
        puerta3 = Puerta(hab3, hab4)

        hab1.este = puerta1
        hab2.oeste = puerta1
        hab2.este = puerta2
        hab3.oeste = puerta2
        hab3.este = puerta3
        hab4.oeste = puerta3

        # Agregar habitaciones al laberinto
        self.laberinto.agregar_habitacion(hab1)
        self.laberinto.agregar_habitacion(hab2)
        self.laberinto.agregar_habitacion(hab3)
        self.laberinto.agregar_habitacion(hab4)

    def jugar(self):
        self.crear_laberinto()
        print("¡Bienvenido al juego del laberinto!")
        # Aquí puedes agregar la lógica del juego

# Ejemplo de uso
juego = Juego()
juego.jugar()
