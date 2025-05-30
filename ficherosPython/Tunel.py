from Hoja import Hoja

class Tunel(Hoja):

    def esTunel(self):
        return True
    
    def aceptar(self, unVisitor):
        unVisitor.visitarTunel(self)

    def crearNuevoLaberinto(self, alguien):
        self.laberinto = alguien.juegoClonaLaberinto()
        print(f"{alguien} crea un nuevo laberinto")