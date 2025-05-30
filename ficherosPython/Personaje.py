from Ente import Ente

class Personaje(Ente):

    def __init__(self,unaCadena):
        super().__init__()
        self.vidas = 1000
        self.nombre = unaCadena

    def puedeAtacar(self):
        self.juego.buscarBicho()

    def irAlEste(self):
        self.posicion.irAlEste(self)

    def irAlNorte(self):
        self.posicion.irAlNorte(self)

    def irAlOeste(self):
        self.posicion.irAlOeste(self)
    
    def irAlSur(self):
        self.posicion.irAlSur(self)

    def irAlNoroeste(self):
        self.posicion.irAlNoroeste(self)

    def irAlNoreste(self):
        self.posicion.irAlNoreste(self)

    def irAlSuroeste(self):
        self.posicion.irAlSuroeste(self)
    
    def irAlSureste(self):
        self.posicion.irAlSureste(self)

    def avisar(self):
        self.juego.muerePersonaje()

    def crearNuevoLaberinto(self,unTunel):
        unTunel.crearNuevoLaberinto(self)

    def obtenerComandos(self):
        lista = []
        self.posicion.recorrer(lambda each: lista.extend(each.obtenerComandos()))
        return lista

    def __str__(self):
        return f"Personaje {self.nombre}"