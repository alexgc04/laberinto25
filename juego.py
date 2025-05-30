class ElementoMapa:
    def entrar(self, bicho=None):
        raise NotImplementedError("Método debe ser implementado en la subclase")


class Pared(ElementoMapa):
    def entrar(self, bicho=None):
        print("Te has chocado con la pared")


class ParedBomba(Pared):
    def __init__(self, activa=False):
        self.activa = activa

    def entrar(self, bicho=None):
        if self.activa:
            print("¡Bomba explotó!")
            if bicho:
                bicho.vidas -= 1
        else:
            print("Te has chocado con la pared bomba")


class Puerta(ElementoMapa):
    def __init__(self, lado1, lado2):
        self.abierta = False
        self.lado1 = lado1
        self.lado2 = lado2

    def abrir(self):
        self.abierta = True

    def cerrar(self):
        self.abierta = False

    def entrar(self, bicho=None):
        if self.abierta:
            print("La puerta está abierta")
        else:
            print("La puerta está cerrada")


class Habitacion(ElementoMapa):
    def __init__(self, num):
        self.num = num
        self.norte = None
        self.sur = None
        self.este = None
        self.oeste = None
        self.elementos = []

    def entrar(self, bicho=None):
        print(f"Estás en la habitación {self.num}")
        for elemento in self.elementos:
            elemento.entrar(bicho)

    def poner_elemento(self, elemento):
        self.elementos.append(elemento)


class Laberinto(ElementoMapa):
    def __init__(self):
        self.habitaciones = []

    def agregar_habitacion(self, habitacion):
        self.habitaciones.append(habitacion)

    def obtener_habitacion(self, num):
        for h in self.habitaciones:
            if h.num == num:
                return h
        return None


class Modo:
    def actua(self, bicho):
        self.camina(bicho)

    def camina(self, bicho):
        raise NotImplementedError("Método debe ser implementado en la subclase")

    def es_agresivo(self):
        return False


class Perezoso(Modo):
    def camina(self, bicho):
        print("El bicho camina lentamente.")

    def es_agresivo(self):
        return False


class Agresivo(Modo):
    def camina(self, bicho):
        print("El bicho camina agresivamente.")

    def es_agresivo(self):
        return True


class Bicho:
    def __init__(self, vidas=5, poder=5, modo=None, posicion=None):
        self.vidas = vidas
        self.poder = poder
        self.modo = modo if modo else Perezoso()
        self.posicion = posicion

    def actua(self):
        self.modo.actua(self)

    def es_agresivo(self):
        return self.modo.es_agresivo()

    def mover_a(self, nueva_habitacion):
        self.posicion = nueva_habitacion
        nueva_habitacion.entrar(self)


class Bomba(ElementoMapa):
    def __init__(self, activa=False):
        self.activa = activa

    def entrar(self, bicho=None):
        if self.activa:
            print("¡Bomba explotó!")
            if bicho:
                bicho.vidas -= 1
        else:
            print("No pasó nada")


class Creator:
    def cambiar_modo_agresivo(self, bicho):
        bicho.modo = Agresivo()
        bicho.poder = 10

    def fabricar_bicho_agresivo(self):
        return Bicho(modo=Agresivo(), vidas=5, poder=5)

    def fabricar_pared(self):
        return Pared()


class CreatorB(Creator):
    def fabricar_pared(self):
        return ParedBomba()


class Decorator(ElementoMapa):
    def __init__(self, elemento):
        self.elemento = elemento

    def entrar(self, bicho=None):
        self.elemento.entrar(bicho)


class Juego:
    def __init__(self):
        self.laberinto = Laberinto()
        self.bichos = []

    def agregar_bicho(self, bicho):
        self.bichos.append(bicho)

    def crear_laberinto(self):
        hab1 = Habitacion(1)
        hab2 = Habitacion(2)
        hab3 = Habitacion(3)
        hab4 = Habitacion(4)

        puerta1 = Puerta(hab1, hab2)
        puerta2 = Puerta(hab2, hab3)
        puerta3 = Puerta(hab3, hab4)

        hab1.este = puerta1
        hab2.oeste = puerta1
        hab2.este = puerta2
        hab3.oeste = puerta2
        hab3.este = puerta3
        hab4.oeste = puerta3

        hab1.poner_elemento(Pared())
        hab2.poner_elemento(ParedBomba(activa=True))
        hab3.poner_elemento(Bomba(activa=True))

        self.laberinto.agregar_habitacion(hab1)
        self.laberinto.agregar_habitacion(hab2)
        self.laberinto.agregar_habitacion(hab3)
        self.laberinto.agregar_habitacion(hab4)

    def jugar(self):
        self.crear_laberinto()
        print("¡Bienvenido al juego del laberinto!")
        bicho = Bicho(posicion=self.laberinto.obtener_habitacion(1))
        self.agregar_bicho(bicho)
        bicho.posicion.entrar(bicho)
        # Ejemplo de movimiento:
        if bicho.posicion.este:
            print("Intentando ir al este...")
            bicho.posicion.este.abrir()
            bicho.mover_a(self.laberinto.obtener_habitacion(2))
        print(f"Vidas restantes del bicho: {bicho.vidas}")


if __name__ == "__main__":
    juego = Juego()
    juego.jugar()