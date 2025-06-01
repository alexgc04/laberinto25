from Laberinto import Laberinto
from Habitacion import Habitacion
from Pared import Pared
from Puerta import Puerta
from Personaje import Personaje
from Creator import Creator
from CreatorB import CreatorB



class Juego:

    def abrirPuertas(self):
        self.laberinto.abrirPuertas()

    def agregarBicho(self, unBicho):
        self.bichos.append(unBicho)
        unBicho.juego = self

    def agregarPersonaje(self, unaCadena):
        self.person= Personaje(unaCadena)
        self.person.juego = self
        self.laberinto.entrar(self.person)

    def buscarBicho(self):
        posPerson = self.person.posicion
        bicho = next((b for b in self.bichos if b.estaVivo() and b.posicion == posPerson), None)
        if bicho != None:
            bicho.esAtacadoPor(self.person)
            print(f"{self.person} ataca a {bicho} en la habitacion {posPerson.num}")
        else:
            print(f"{self.person} no hay bichos en la habitacion {posPerson.num}")

    def buscarPersonaje(self, unBicho):
        posBicho = unBicho.posicion
        posPersonaje = self.person.posicion
        if posBicho == posPersonaje:
            self.person.esAtacadoPor(unBicho)
                    
    def cerrarPuertas(self):
        self.laberinto.cerrarPuertas()
        import copy

    def clonarLaberinto(self):
        import copy
        return copy.deepcopy(self.prototipo)

    def crearLaberinto2Habitaciones(self):

        hab1 = Habitacion()
        hab1.num = 1
        hab1.este = Pared()
        hab1.norte = Pared()
        hab1.oeste = Pared()

        hab2 = Habitacion()
        hab2.num = 2
        hab2.sur = Pared()
        hab2.este = Pared()
        hab2.oeste = Pared()

        puerta = Puerta()
        puerta.lado1 = hab1
        puerta.lado2 = hab2

        hab1.sur = puerta
        hab2.norte = puerta

        laberinto = Laberinto()
        laberinto.agregarHabitacion(hab1)
        laberinto.agregarHabitacion(hab2)
        return laberinto

    def crearLaberinto2HabitacionesFM(self):

        unFM = Creator()

        hab1 = unFM.fabricarHabitacion(1)
        hab2 = unFM.fabricarHabitacion(2)

        puerta = unFM.fabricarPuerta()
        puerta.lado1 = hab1
        puerta.lado2 = hab2

        hab1.sur = puerta
        hab2.norte = puerta

        self.laberinto = unFM.fabricarLaberinto()
        self.laberinto.agregarHabitacion(hab1)
        self.laberinto.agregarHabitacion(hab2)

        return self.laberinto
    
    def crearLaberinto2HabitacionesFM(self, unFM):

        hab1 = unFM.fabricarHabitacion(1)
        hab2 = unFM.fabricarHabitacion(2)

        puerta = unFM.fabricarPuerta()

        puerta.lado1 = hab1
        puerta.lado2 = hab2

        hab1.ponerEnOr(unFM.fabricarSur(), puerta)
        hab2.ponerEnOr(unFM.fabricarNorte(), puerta)    

        self.laberinto = unFM.fabricarLaberinto()
        self.laberinto.agregarHabitacion(hab1)
        self.laberinto.agregarHabitacion(hab2)

        return self.laberinto
    
    def crearLaberinto2HabitacionesFMD(self, unFM):
        
        hab1 = unFM.fabricarHabitacion(1)
        hab2 = unFM.fabricarHabitacion(2)

        bomba1 = unFM.fabricarBomba()
        bomba1.em = unFM.fabricarPared()
        hab1.este=bomba1

        bomba2 = unFM.fabricarBomba()
        bomba2.em = unFM.fabricarPared()
        hab2.este=bomba2

        puerta = unFM.fabricarPuerta()
        puerta.lado1 = hab1
        puerta.lado2 = hab2

        hab1.sur = puerta
        hab2.norte = puerta

        self.laberinto = unFM.fabricarLaberinto()
        self.laberinto.agregarHabitacion(hab1)
        self.laberinto.agregarHabitacion(hab2)

        return self.laberinto
    
    def crearLaberinto4H4BFM(self,unFM):

        norte = unFM.fabricarNorte()
        sur = unFM.fabricarSur()
        este = unFM.fabricarEste()
        oeste = unFM.fabricarOeste()


        hab1 = unFM.fabricarHabitacion(1)
        hab2 = unFM.fabricarHabitacion(2)
        hab3 = unFM.fabricarHabitacion(3)
        hab4 = unFM.fabricarHabitacion(4)

        puerta1 = unFM.fabricarPuerta()
        puerta2 = unFM.fabricarPuerta()
        puerta3 = unFM.fabricarPuerta()
        puerta4 = unFM.fabricarPuerta()

        puerta1.lado1 = hab1
        puerta1.lado2 = hab2
        puerta2.lado1 = hab1
        puerta2.lado2 = hab3
        puerta3.lado1 = hab2
        puerta3.lado2 = hab4
        puerta4.lado1 = hab3
        puerta4.lado2 = hab4

        hab1.ponerEnOr(sur, puerta1)
        hab2.ponerEnOr(norte, puerta1)
        hab1.ponerEnOr(este, puerta2)
        hab3.ponerEnOr(oeste, puerta2)
        hab2.ponerEnOr(este, puerta3)
        hab4.ponerEnOr(oeste, puerta3)
        hab3.ponerEnOr(sur, puerta4)
        hab4.ponerEnOr(norte, puerta4)

        bicho1 = unFM.fabricarBichoAgresivo()
        bicho2 = unFM.fabricarBichoAgresivo()
        bicho3 = unFM.fabricarBichoPerezoso()
        bicho4 = unFM.fabricarBichoPerezoso()

        self.laberinto = unFM.fabricarLaberinto()
        self.laberinto.agregarHabitacion(hab1)
        self.laberinto.agregarHabitacion(hab2)
        self.laberinto.agregarHabitacion(hab3)
        self.laberinto.agregarHabitacion(hab4)
        self.agregarBicho(bicho1)
        self.agregarBicho(bicho2)
        self.agregarBicho(bicho3)
        self.agregarBicho(bicho4)

        bicho1.posicion = hab1
        bicho2.posicion = hab3
        bicho3.posicion = hab2
        bicho4.posicion = hab4

        return self.laberinto
    
    def eliminarBichos(self, unBicho):
        try:
            self.bichos.remove(unBicho)

        except ValueError:
            print("No existe ese objeto bicho")

    def estanTodosLosBichosMuertos(self):
        bicho = next((each for each in self.bichos if each.estaVivo()), None)

        if bicho is None and self.person.estaVivo():
            self.ganaPersonaje()

    def ganaPersonaje(self):
        print(f"Fin del juego, {self.person} ha ganado")

    def __init__(self):
        self.laberinto = None
        self.person = None
        self.bichos = []
        self.hilos = {}

    def obtenerHabitacion(self, num):
        return self.laberinto.obtenerHabitacion(num)
    
    def lanzarBicho(self, unBicho):
        print(f"{unBicho} se activa")
        def proceso():
            while unBicho.estaVivo():
              unBicho.actua()
        from threading import Thread
        proceso_hilo = Thread(target=proceso, daemon=True)
        proceso_hilo.start()
        self.hilos[unBicho] = proceso_hilo
        
    def lanzarBichos(self):
        for each in self.bichos:
            self.lanzarBicho(each)


    def muerePersonaje(self):
        print(f"Fin del juego, {self.person} ha muerto")
        self.terminarBichos()

    def terminarBicho(self, unBicho):
        unBicho.vidas = 0
        print(f"{unBicho} ha muerto")

    def terminarBichos(self):
        for each in self.bichos:
            self.terminarBicho(each)

    def obtenerHabitacion(self,unNum):
        return self.laberinto.obtenerHabitacion(unNum)
    
    def habitaciones(self):
        return self.laberinto.habitaciones 
    

    def __str__(self):
        return "Juego"

    def activarBombas(self):
        for hab in self.laberinto.hijos:
            for hijo in getattr(hab, "hijos", []):
                if hasattr(hijo, "activar") and callable(hijo.activar):
                    hijo.activar()

    def desactivarBombas(self):
        for hab in self.laberinto.hijos:
            for hijo in getattr(hab, "hijos", []):
                if hasattr(hijo, "desactivar") and callable(hijo.desactivar):
                    hijo.desactivar()