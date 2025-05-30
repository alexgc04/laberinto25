from Contenedor import Contenedor

class Laberinto(Contenedor):

    def __init__(self):
        super().__init__()

    def abrirPuertas(self):
        self.recorrer(lambda each: each.abrir() if each.esPuerta() and not each.estaAbierta() else None)

    def aceptar(self, unVisitor):
        for each in self.hijos:
            each.aceptar(unVisitor)

    def cerrarPuertas(self):
        self.recorrer(lambda each: each.cerrar() if each.esPuerta() and each.estaAbierta() else None)

    def entrar(self,alguien):
        hab1 = self.obtenerHabitacion(1)
        hab1.entrar(alguien)
        return "Estas en un laberinto"
    
    def esLaberinto(self):
        return True
    
    def agregarHabitacion(self, unaHabitacion):
        self.hijos.append(unaHabitacion)

    def eliminarHabitacion(self, unaHabitacion):
        try:
            self.hijos.remove(unaHabitacion)

        except ValueError:
            print(f"No existe ese objeto habitacion")

    def obtenerHabitacion(self, unNum):
        for habitacion in self.hijos:
            if habitacion.num == unNum:
                return habitacion
        return None
    
    def recorrer(self, unBloque):
        unBloque(self)
        for hijo in self.hijos:
            hijo.recorrer(unBloque)

    def printOn(self, aStream):
        print(f"{aStream} Laberinto")

    def __str__(self):
        return "Laberinto"